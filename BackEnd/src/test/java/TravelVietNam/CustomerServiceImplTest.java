package TravelVietNam;


import TravelVietNam.common.ActivitiesType;
import TravelVietNam.common.HotelType;
import TravelVietNam.common.RestaurantType;
import TravelVietNam.common.type.ApproveStatus;
import TravelVietNam.utils.AuthenticationUtils;
import TravelVietNam.utils.HelperUtils;
import TravelVietNam.utils.MappingUtils;
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
import TravelVietNam.service.impl.CustomerServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class CustomerServiceImplTest {

    @Mock
    ActivitiesRepository activitiesRepository;
    @Mock
    HotelRepository hotelRepository;
    @Mock
    RestaurantRepository restaurantRepository;
    @Mock
    RestaurantImageRepository restaurantImageRepository;
    @Mock
    HotelImageRepository hotelImageRepository;
    @Mock
    ActivitiesImageRepository activitiesImageRepository;

    @InjectMocks
    CustomerServiceImpl customerServiceImpl;


    RestaurantDTO restaurantDTO = RestaurantDTO.builder()
            .address("ha noi")
            .approveStatus(ApproveStatus.APPROVED)
            .code("Restaurant-code")
            .description("description")
            .title("oki")
            .image("image.jpg")
            .restaurantType(RestaurantType.NHA_HANG)
            .slug("restaurant-slug")
            .build();

    List<RestaurantDTO> restaurantDTOs = Arrays.asList(restaurantDTO);

    String userId = "1";

    Restaurant restaurant = Restaurant.builder()
            .restaurantType(RestaurantType.NHA_HANG)
            .id("1")
            .title("nh? h?ng")
            .address("huhu")
            .approveStatus(ApproveStatus.APPROVED)
            .userId(userId)
            .slug("restaurant-slug")
            .build();

    String title = "";

    String title1 = "aaa";

    List<Restaurant> restaurants = Arrays.asList(restaurant);
    //hotel
    Hotel hotel = Hotel.builder()
            .hotelType(HotelType.FAMILY)
            .id("1")
            .title("nh? h?ng")
            .address("huhu")
            .description("aaaaa")
            .code("Restaurant-code")
            .approveStatus(ApproveStatus.APPROVED)
            .userId(userId)
            .slug("hotel-slug")
            .build();

    HotelDTO hotelDTO = HotelDTO.builder()
            .address("ha noi")
            .approveStatus(ApproveStatus.APPROVED)
            .code("Restaurant-code")
            .description("description")
            .title("oki")
            .description("aaaaa")
            .image("image.jpg")
            .hotelType(HotelType.FAMILY)
            .slug("restaurant-slug")
            .build();


    List<HotelDTO> hotelListDTOs = Arrays.asList(hotelDTO);
    List<Hotel> hotelList = Arrays.asList(hotel);

    // activities

    Activities activities = Activities.builder()
            .activitiesType(ActivitiesType.IN_DOOR)
            .childTicketPrice(10000D)
            .id("1")
            .title("nh? h?ng")
            .address("huhu")
            .code("Ac-1")
            .approveStatus(ApproveStatus.APPROVED)
            .userId(userId)
            .slug("activities-slug")
            .build();

    ActivitiesDTO activitiesDTO = ActivitiesDTO.builder()
            .activitiesType(ActivitiesType.IN_DOOR)
            .childTicketPrice(10000D)
            .title("khu vui ch?i")
            .address("huhu")
            .code("Ac-1")
            .approveStatus(ApproveStatus.APPROVED)
            .slug("activities-slug")
            .build();

    List<ActivitiesDTO> activitiesDTOList = Arrays.asList(activitiesDTO);
    List<Activities> activitiesList = Arrays.asList(activities);


    @Test
    public void testGetListRestaurant() {

        PowerMockito.mockStatic(AuthenticationUtils.class);
        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        title = HelperUtils.unAccent(title);
        if (StringUtils.isBlank(title)) {

            Mockito.when(restaurantRepository.findAllRestaurant()).thenReturn(restaurants);
            List<String> restaurantCodes = restaurants.stream().map(Restaurant::getCode).collect(Collectors.toList());
            Mockito.when(restaurantRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(restaurants);
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
            Mockito.when(restaurantRepository.findAllByTitleTsSearch(Mockito.anyString())).thenReturn(restaurants);
            List<String> restaurantCodes = restaurants.stream().map(Restaurant::getCode).collect(Collectors.toList());

            List<Restaurant> restaurantListQuery = restaurantRepository.findByCodeInOrderByCreatedAtDesc(restaurantCodes);
            Mockito.when(restaurantRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(restaurants);

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
        customerServiceImpl.getListRestaurant(title);
        customerServiceImpl.getListRestaurant(title1);
    }


    @Test
    public void testGetListHotel() {

        PowerMockito.mockStatic(AuthenticationUtils.class);
        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        title = HelperUtils.unAccent(title);

        if (StringUtils.isBlank(title)) {

            Mockito.when(hotelRepository.findAllHotel()).thenReturn(hotelList);
            List<String> productCodes = hotelList.stream().map(Hotel::getCode).collect(Collectors.toList());


            List<Hotel> hotelListQuery = hotelRepository.findByCodeInOrderByCreatedAtDesc(productCodes);

            Mockito.when(hotelRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(hotelList);
            hotelListDTOs = MappingUtils.map(hotelListQuery, HotelDTO.class);
            List<HotelImage> hotelImages = hotelImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = hotelImages.stream().collect(Collectors.toMap(HotelImage::getHotelCode, HotelImage::getUrl));
            hotelListDTOs.forEach(hotel -> {
                String imageUrl = mapImage.get(hotel.getCode());
                if (imageUrl != null) {
                    hotel.setImage(imageUrl);
                }
            });
        } else {
            Mockito.when(hotelRepository.findAllByTitleAndTsSearch(Mockito.anyString())).thenReturn(hotelList);

            List<String> productCodes = hotelList.stream().map(Hotel::getCode).collect(Collectors.toList());

            Mockito.when(hotelRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(hotelList);
            List<Hotel> hotelListQuery = hotelRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            hotelListDTOs = MappingUtils.map(hotelListQuery, HotelDTO.class);

            List<HotelImage> hotelImages = hotelImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = hotelImages.stream().collect(Collectors.toMap(HotelImage::getHotelCode, HotelImage::getUrl));
            hotelListDTOs.forEach(hotel -> {
                String imageUrl = mapImage.get(hotel.getCode());
                if (imageUrl != null) {
                    hotel.setImage(imageUrl);
                }
            });
        }
        customerServiceImpl.getListHotel(title);
        customerServiceImpl.getListHotel(title1);
    }

    @Test
    public void testGetListActivities() {
        title = HelperUtils.unAccent(title);

        if (StringUtils.isBlank(title)) {
            Mockito.when(activitiesRepository.findAllHotel()).thenReturn(activitiesList);
            List<String> productCodes = activitiesList.stream().map(Activities::getCode).collect(Collectors.toList());
            Mockito.when(activitiesRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(activitiesList);

            List<Activities> activitiesListQuery = activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            activitiesDTOList = MappingUtils.map(activitiesListQuery, ActivitiesDTO.class);
            List<ActivitiesImage> activitiesImages = activitiesImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = activitiesImages.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));

            activitiesDTOList.forEach(activities -> {
                String imageUrl = mapImage.get(activities.getCode());
                if (imageUrl != null) {
                    activities.setImage(imageUrl);
                }
            });
        } else {
            Mockito.when(activitiesRepository.findAllByTitleTsSearch(Mockito.any())).thenReturn(activitiesList);
            List<String> productCodes = activitiesList.stream().map(Activities::getCode).collect(Collectors.toList());
            Mockito.when(activitiesRepository.findByCodeInOrderByCreatedAtDesc(Mockito.any())).thenReturn(activitiesList);
            List<Activities> activitiesListQuery = activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes);
            activitiesDTOList = MappingUtils.map(activitiesListQuery, ActivitiesDTO.class);

            List<ActivitiesImage> activitiesImages = activitiesImageRepository.findUniqueImage(productCodes);
            Map<String, String> mapImage = activitiesImages.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));
            activitiesDTOList.forEach(activities -> {
                String imageUrl = mapImage.get(activities.getCode());
                if (imageUrl != null) {
                    activities.setImage(imageUrl);
                }
            });
        }

         customerServiceImpl.getListActivities(title);
        customerServiceImpl.getListActivities(title1);
    }
}
