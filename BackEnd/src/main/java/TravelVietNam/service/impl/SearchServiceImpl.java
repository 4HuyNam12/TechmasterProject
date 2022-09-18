package TravelVietNam.service.impl;

import TravelVietNam.common.ConstantValue;
import TravelVietNam.common.SQLQueryParam;
import TravelVietNam.entity.hotel.Amenities;
import TravelVietNam.entity.hotel.Hotel;
import TravelVietNam.entity.hotel.HotelImage;
import TravelVietNam.repository.AmenitiesRepository;
import TravelVietNam.repository.FavoriteRepository;
import TravelVietNam.repository.HotelImageRepository;
import TravelVietNam.repository.HotelRepository;
import TravelVietNam.request.FilterRequest;
import TravelVietNam.request.SearchRequest;
import TravelVietNam.response.hotel.FacilityDTO;
import TravelVietNam.response.hotel.HotelDTO;
import TravelVietNam.response.hotel.SearchResponse;
import TravelVietNam.service.SearchService;
import TravelVietNam.utils.AuthenticationUtils;
import TravelVietNam.utils.EntityManagerUtils;
import TravelVietNam.utils.HelperUtils;
import TravelVietNam.utils.MappingUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
@AllArgsConstructor
@Log4j2
public class SearchServiceImpl implements SearchService {
    private HotelRepository hotelRepository;
    private EntityManager entityManager;
    private AmenitiesRepository amenitiesRepository;
    private HotelImageRepository hotelImageRepository;
    private FavoriteRepository favoriteRepository;

    @Override
    public SearchResponse searchFilter(SearchRequest searchRequest, FilterRequest filterRequest) {
        if (searchRequest.getPerPage() > ConstantValue.MAX_PER_PAGE) {
            searchRequest.setPerPage(ConstantValue.MAX_PER_PAGE);
        }
        SQLQueryParam request = generateQueryGetHotels(searchRequest, filterRequest);
        return searchFilterByProdCodes(request, searchRequest);
    }



    private SQLQueryParam generateQueryGetHotels(SearchRequest searchRequest, FilterRequest filterRequest) {
        SQLQueryParam hotelCodeQuery = getHotelCodesQuery(searchRequest, filterRequest);
        return new SQLQueryParam(hotelCodeQuery.getSql(), hotelCodeQuery.getParams());
    }

    private SearchResponse searchFilterByProdCodes(SQLQueryParam productCodeRequest, SearchRequest searchRequest) {
        List<String> productCodes = EntityManagerUtils.buildQuery(entityManager, productCodeRequest).getResultList();
        List<Amenities> amenitiesList = amenitiesRepository.findAll();
        Map<Integer, Amenities> map = amenitiesList.stream().collect(Collectors.toMap(Amenities::getId, Function.identity()));

        List<Hotel> hotelList = hotelRepository.findByCodeInOrderByCreatedAtDesc(productCodes, PageRequest.of(searchRequest.getPage() - 1, searchRequest.getPerPage()));
        List<HotelDTO> hotels = MappingUtils.map(hotelList, HotelDTO.class);
        hotels.forEach(hotel -> hotel.setFacilityDTOList(hotel.getAmenities()
                .stream().map(amenitiesId -> FacilityDTO.builder()
                        .id(amenitiesId.toString())
                        .name(map.get(amenitiesId).getName())
                        .icon(map.get(amenitiesId).getIcon())
                        .build())
                .collect(Collectors.toList())));

        List<HotelImage> hotelImages = hotelImageRepository.findUniqueImage(productCodes);
        Map<String, String> mapImage = hotelImages.stream().collect(Collectors.toMap(HotelImage::getHotelCode, HotelImage::getUrl));

        hotels.forEach(hotel -> {
            String imageUrl = mapImage.get(hotel.getCode());
            if (imageUrl != null) {
                hotel.setImage(imageUrl);
            }
        });
        hotels.forEach(hotel -> hotel.setFavor(checkFavoriteHotel(hotel.getSlug())));

        return SearchResponse.builder()
                .hotels(hotels)
                .total(productCodes.size())
                .build();
    }

    private SQLQueryParam getHotelCodesQuery(SearchRequest searchRequest, FilterRequest filterRequest) {
        Map<String, Object> sqlParams = new HashMap<>();
        String query;
        if (searchRequest.getQ() == null || searchRequest.getQ().isEmpty()) {
            query = " select code from hotel where approve_status = 'APPROVED'";
        } else {
            query = " select code from hotel where ts_search @@ plainto_tsquery(:q) and approve_status = 'APPROVED' ";
            sqlParams.put("q", HelperUtils.unAccent((searchRequest.getQ())));
        }
        if (!filterRequest.isNotProductFilter()) {
            if (!filterRequest.getType().isEmpty()) {
                query = " select code from hotel where code in (" + query + ") and hotel_type = (:hotelType) ";
                sqlParams.put("hotelType", filterRequest.getType());
            }
            if (filterRequest.getStar() != null) {
                query = " select code from hotel where code in (" + query + ") and star = (:star) ";
                sqlParams.put("star", filterRequest.getStar());
            }
        }
        //phân trang thủ công
//        Integer page = searchRequest.getPage();
//        Integer perPage = searchRequest.getPerPage();
//        Integer offsetPage = (page - 1) * perPage;
//        query = query + " limit (:perPage) offset (:offsetPage)";
//        sqlParams.put("perPage", perPage);
//        sqlParams.put("offsetPage", offsetPage);
        return new SQLQueryParam(query, sqlParams);
    }

    private boolean checkFavoriteHotel(String slug) {
        String userId = AuthenticationUtils.getUserId();
        if (userId != null) {
            return favoriteRepository.findByUserIdAndSlug(userId, slug).isPresent();
        }
        return false;
    }

}
