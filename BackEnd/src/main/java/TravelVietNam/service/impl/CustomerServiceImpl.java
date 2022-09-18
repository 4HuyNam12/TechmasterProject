package TravelVietNam.service.impl;

import TravelVietNam.entity.activities.Activities;
import TravelVietNam.entity.activities.ActivitiesImage;
import TravelVietNam.entity.hotel.Hotel;
import TravelVietNam.entity.hotel.HotelImage;
import TravelVietNam.entity.restaurant.Restaurant;
import TravelVietNam.entity.restaurant.RestaurantImage;
import TravelVietNam.repository.HotelImageRepository;
import TravelVietNam.repository.HotelRepository;
import TravelVietNam.repository.activities.ActivitiesImageRepository;
import TravelVietNam.repository.activities.ActivitiesRepository;
import TravelVietNam.repository.restaurant.RestaurantImageRepository;
import TravelVietNam.repository.restaurant.RestaurantRepository;
import TravelVietNam.response.activities.ActivitiesDTO;
import TravelVietNam.response.hotel.HotelDTO;
import TravelVietNam.response.restaurant.RestaurantDTO;
import TravelVietNam.service.CustomerService;
import TravelVietNam.utils.HelperUtils;
import TravelVietNam.utils.MappingUtils;
import lombok.AllArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Transactional
@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private ActivitiesRepository activitiesRepository;
    private HotelRepository hotelRepository;
    private RestaurantRepository restaurantRepository;

    private RestaurantImageRepository restaurantImageRepository;
    private HotelImageRepository hotelImageRepository;
    private ActivitiesImageRepository activitiesImageRepository;


    @Override
    public List<RestaurantDTO> getListRestaurant(String title) {
        title = HelperUtils.unAccent(title);
        List<RestaurantDTO> restaurantDTOs;
        if (StringUtils.isBlank(title)) {
            List<Restaurant> restaurantList = restaurantRepository.findAllRestaurant();
            List<String> restaurantCodes = restaurantList.stream().map(Restaurant::getCode).collect(Collectors.toList());

            List<Restaurant> restaurantListQuery = restaurantRepository.findByCodeInOrderByCreatedAtDesc(restaurantCodes);

            restaurantDTOs = MappingUtils.map(restaurantListQuery, RestaurantDTO.class);
            List<RestaurantImage> restaurantImages = restaurantImageRepository.findUniqueImage(restaurantCodes);

            Map<String, String> mapImage = restaurantImages.stream().collect(Collectors.toMap(RestaurantImage::getRestaurantCode, RestaurantImage::getUrl));
            restaurantDTOs.forEach(restaurants -> {
                String imageUrl = mapImage.get(restaurants.getCode());
                if (imageUrl != null) {
                    restaurants.setImage(imageUrl);
                }
            });
        } else {
            List<Restaurant> restaurantList = restaurantRepository.findAllByTitleTsSearch(title);
            List<String> restaurantCodes = restaurantList.stream().map(Restaurant::getCode).collect(Collectors.toList());
            List<Restaurant> restaurantListQuery = restaurantRepository.findByCodeInOrderByCreatedAtDesc(restaurantCodes);
            restaurantDTOs = MappingUtils.map(restaurantListQuery, RestaurantDTO.class);
            List<RestaurantImage> restaurantImages = restaurantImageRepository.findUniqueImage(restaurantCodes);
            Map<String, String> mapImage = restaurantImages.stream().collect(Collectors.toMap(RestaurantImage::getRestaurantCode, RestaurantImage::getUrl));
            restaurantDTOs.forEach(restaurants -> {
                String imageUrl = mapImage.get(restaurants.getCode());
                if (imageUrl != null) {
                    restaurants.setImage(imageUrl);
                }
            });
        }

        return restaurantDTOs;
    }

    @Override
    public List<HotelDTO> getListHotel(String title) {
        title = HelperUtils.unAccent(title);
        List<HotelDTO> hotels;
        if (StringUtils.isBlank(title)) {
            List<Hotel> hotelList = hotelRepository.findAllHotel();
            List<String> productCodes = hotelList.stream().map(Hotel::getCode).collect(Collectors.toList());
            List<Hotel> hotelListQuery = hotelRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            hotels = MappingUtils.map(hotelListQuery, HotelDTO.class);
            List<HotelImage> hotelImages = hotelImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = hotelImages.stream().collect(Collectors.toMap(HotelImage::getHotelCode, HotelImage::getUrl));
            hotels.forEach(hotel -> {
                String imageUrl = mapImage.get(hotel.getCode());
                if (imageUrl != null) {
                    hotel.setImage(imageUrl);
                }
            });
        } else {
            List<Hotel> hotelList = hotelRepository.findAllByTitleAndTsSearch(title);
            List<String> productCodes = hotelList.stream().map(Hotel::getCode).collect(Collectors.toList());
            List<Hotel> hotelListQuery = hotelRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            hotels = MappingUtils.map(hotelListQuery, HotelDTO.class);
            List<HotelImage> hotelImages = hotelImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = hotelImages.stream().collect(Collectors.toMap(HotelImage::getHotelCode, HotelImage::getUrl));
            hotels.forEach(hotel -> {
                String imageUrl = mapImage.get(hotel.getCode());
                if (imageUrl != null) {
                    hotel.setImage(imageUrl);
                }
            });
        }
        return hotels;
    }

    @Override
    public List<ActivitiesDTO> getListActivities(String title) {
        title = HelperUtils.unAccent(title);
        List<ActivitiesDTO> activitiesDTOS;

        if (StringUtils.isBlank(title)) {
            List<Activities> activitiesList = activitiesRepository.findAllHotel();
            List<String> productCodes = activitiesList.stream().map(Activities::getCode).collect(Collectors.toList());
            List<Activities> activitiesListQuery = activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            activitiesDTOS = MappingUtils.map(activitiesListQuery, ActivitiesDTO.class);
            List<ActivitiesImage> activitiesImages = activitiesImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = activitiesImages.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));

            activitiesDTOS.forEach(activities -> {
                String imageUrl = mapImage.get(activities.getCode());
                if (imageUrl != null) {
                    activities.setImage(imageUrl);
                }
            });
        } else {
            List<Activities> activitiesList = activitiesRepository.findAllByTitleTsSearch(title);
            List<String> productCodes = activitiesList.stream().map(Activities::getCode).collect(Collectors.toList());

            List<Activities> activitiesListQuery = activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            activitiesDTOS = MappingUtils.map(activitiesListQuery, ActivitiesDTO.class);

            List<ActivitiesImage> activitiesImages = activitiesImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = activitiesImages.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));
            activitiesDTOS.forEach(activities -> {
                String imageUrl = mapImage.get(activities.getCode());
                if (imageUrl != null) {
                    activities.setImage(imageUrl);
                }
            });
        }
        return activitiesDTOS;
    }
}
