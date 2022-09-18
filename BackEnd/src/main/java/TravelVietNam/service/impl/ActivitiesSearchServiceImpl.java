package TravelVietNam.service.impl;

import TravelVietNam.common.ConstantValue;
import TravelVietNam.common.SQLQueryParam;
import TravelVietNam.entity.activities.Activities;
import TravelVietNam.entity.activities.ActivitiesGame;
import TravelVietNam.entity.activities.ActivitiesImage;
import TravelVietNam.repository.FavoriteRepository;
import TravelVietNam.repository.activities.ActivitiesGameRepository;
import TravelVietNam.repository.activities.ActivitiesImageRepository;
import TravelVietNam.repository.activities.ActivitiesRepository;
import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.activities.FilterRequestActivities;
import TravelVietNam.response.activities.ActivitiesDTO;
import TravelVietNam.response.activities.ActivitiesGameDTO;
import TravelVietNam.response.activities.ActivitiesSearchResponse;
import TravelVietNam.service.ActivitiesSearchService;
import TravelVietNam.utils.AuthenticationUtils;
import TravelVietNam.utils.EntityManagerUtils;
import TravelVietNam.utils.HelperUtils;
import TravelVietNam.utils.MappingUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@AllArgsConstructor
@Log4j2
public class ActivitiesSearchServiceImpl implements ActivitiesSearchService {
    private ActivitiesRepository activitiesRepository;
    private EntityManager entityManager;
    private ActivitiesGameRepository activitiesGameRepository;
    private ActivitiesImageRepository activitiesImageRepository;
    private FavoriteRepository favoriteRepository;

    @Override
    public ActivitiesSearchResponse searchFilter(SearchRequest searchRequest, FilterRequestActivities filterRequest) {
        if (searchRequest.getPerPage() > ConstantValue.MAX_PER_PAGE) {
            searchRequest.setPerPage(ConstantValue.MAX_PER_PAGE);
        }
        SQLQueryParam request = generateQueryGetHotels(searchRequest, filterRequest);
        return searchFilterByProdCodes(request, searchRequest);
    }

    private SQLQueryParam generateQueryGetHotels(SearchRequest searchRequest, FilterRequestActivities filterRequest) {
        Map<String, Object> sqlParams = new HashMap<>();
        String query = null;
        if (searchRequest.getQ() == null || searchRequest.getQ().isEmpty()) {
            query = " select code from activities where approve_status = 'APPROVED'";
        } else {
            query = " select code from activities where ts_search @@ plainto_tsquery(:q) and approve_status = 'APPROVED' ";
            sqlParams.put("q", HelperUtils.unAccent((searchRequest.getQ())));
        }
        if (!filterRequest.isNotProductFilter()) {
            if (!filterRequest.getType().isEmpty()) {
                query = " select code from activities where code in (" + query + ") and type = (:type) ";
                sqlParams.put("type", filterRequest.getType());
            }
            if (filterRequest.getDurationFrom() != null && filterRequest.getDurationTo() != null) {
                query = " select code from activities where code in (" + query + ") and duration >= (:from) and duration <= (:to) ";
                sqlParams.put("from", filterRequest.getDurationFrom());
                sqlParams.put("to", filterRequest.getDurationTo());
            }
        }
        return new SQLQueryParam(query, sqlParams);
    }

    private ActivitiesSearchResponse searchFilterByProdCodes(SQLQueryParam productCodeRequest, SearchRequest searchRequest) {
        List<String> productCodes = EntityManagerUtils.buildQuery(entityManager, productCodeRequest).getResultList();

        List<Activities> activitiesList = activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes, PageRequest.of(searchRequest.getPage() - 1, searchRequest.getPerPage()));
        List<ActivitiesDTO> activitiesDTOS = MappingUtils.map(activitiesList, ActivitiesDTO.class);

        List<ActivitiesImage> activitiesImages = activitiesImageRepository.findUniqueImage(productCodes);
        Map<String, String> mapImage = activitiesImages.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));

        List<ActivitiesGame> activitiesGameList = activitiesGameRepository.findAllByActivitiesCodeIn(activitiesDTOS.stream().map(ActivitiesDTO::getCode).collect(Collectors.toList()));

        Map<String, List<ActivitiesGameDTO>> gameMaps = new HashMap<>();
        activitiesGameList.forEach(activitiesGame -> {
            ActivitiesGameDTO gameDTO = MappingUtils.map(activitiesGame, ActivitiesGameDTO.class);
            if (gameMaps.get(activitiesGame.getActivitiesCode()) == null || gameMaps.get(activitiesGame.getActivitiesCode()).isEmpty()) {
                List<ActivitiesGameDTO> dtoList = new ArrayList<>();
                dtoList.add(gameDTO);
                gameMaps.put(activitiesGame.getActivitiesCode(), dtoList);
            } else {
                List<ActivitiesGameDTO> dtoList = gameMaps.get(activitiesGame.getActivitiesCode());
                dtoList.add(gameDTO);
                gameMaps.put(activitiesGame.getActivitiesCode(), dtoList);
            }
        });

        activitiesDTOS.forEach(activities -> {
            String imageUrl = mapImage.get(activities.getCode());
            if (imageUrl != null) {
                activities.setImage(imageUrl);
            }
            activities.setActivitiesGameDTOS(gameMaps.get(activities.getCode()));
        });

        activitiesDTOS.forEach(activities -> activities.setFavor(checkFavoriteActivities(activities.getSlug())));

        return ActivitiesSearchResponse.builder()
                .activities(activitiesDTOS)
                .total(productCodes.size())
                .build();
    }

    private boolean checkFavoriteActivities(String slug) {
        String userId = AuthenticationUtils.getUserId();
        if (userId != null) {
            return favoriteRepository.findByUserIdAndSlug(userId, slug).isPresent();
        }
        return false;
    }

}
