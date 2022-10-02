package com.vn.travel;


import com.vn.travel.common.RestaurantType;
import com.vn.travel.common.type.ApproveStatus;
import com.vn.travel.common.type.ImageType;
import com.vn.travel.entity.BookingContact;
import com.vn.travel.entity.account.Account;
import com.vn.travel.entity.account.Role;
import com.vn.travel.entity.restaurant.Feature;
import com.vn.travel.entity.restaurant.Restaurant;
import com.vn.travel.entity.restaurant.RestaurantImage;
import com.vn.travel.entity.restaurant.RestaurantMenu;
import com.vn.travel.model.Contact;
import com.vn.travel.repository.restaurant.RestaurantRepository;
import com.vn.travel.request.restaurant.BookingRestaurantRequest;
import com.vn.travel.request.restaurant.RestaurantUploadRequest;
import com.vn.travel.service.impl.restaurant.RestaurantServiceImpl;
import com.vn.travel.utils.AuthenticationUtils;
import com.vn.travel.utils.HelperUtils;
import com.vn.travel.utils.MappingUtils;
import com.vn.travel.repository.restaurant.FeatureRepository;
import com.vn.travel.repository.restaurant.RestaurantImageRepository;
import com.vn.travel.repository.restaurant.RestaurantMenuRepository;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.response.restaurant.FacilityDTO;
import com.vn.travel.response.restaurant.RestaurantDetail;
import com.vn.travel.response.restaurant.RestaurantMenuDTO;
import com.vn.travel.service.impl.HelperService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@PrepareForTest(AuthenticationUtils.class)
@RunWith(PowerMockRunner.class)
public class RestaurantServiceImplTest {
    @Mock
    private HelperService helperService;
    @Mock
    private RestaurantRepository restaurantRepository;
    @Mock
    private RestaurantImageRepository restaurantImageRepository;
    @Mock
    private RestaurantMenuRepository restaurantMenuRepository;
    @Mock
    private FeatureRepository featureRepository;

    @InjectMocks
    RestaurantServiceImpl restaurantServiceImpl;

    Integer[] feature = {1};

    String userId = "1";

    Restaurant restaurant = new Restaurant("1", "restaurant-code", "nha han"
            , "ngon", "slug-restaurant", RestaurantType.NHA_HANG,
            feature, "a", userId, ApproveStatus.PENDING);

    Account account = new Account("1", "nam", "travalar@gmail.com"
            , "0983302976", true, "123456", "abc.jpg",
            "05-06-99", true, new Role(1L, "ROLE_ADMIN"), "a");

    Contact contact = new Contact("travalar", "nguyen",
            "travalar@123", "0983302922");

    BookingContact bookingContact = new BookingContact("1", "nam", "nguyen",
            "travalar@123", "0983302922", userId);

    BookingRestaurantRequest bookingRestaurantRequest =
            new BookingRestaurantRequest("restaurant-code", contact,
                    21001212, "2200", 2, 3);
    String bookingId = HelperUtils.genBookingID();

    List<String> restaurantImages = Collections.singletonList("aaaaaaaaaaaaaaa.jpg");

    Feature feature1 = new Feature(1, "a");

    List<Feature> features = Arrays.asList(feature1);

    RestaurantMenu restaurantMenu = new RestaurantMenu(1L, "restaurant-code", 2000D,
            "VND", "ngon", "ech", true, "a.jpg");

    List<RestaurantMenu> menuList = Collections.singletonList(restaurantMenu);

    @Test
    public void testGet() {

//        PowerMockito.mockStatic(AuthenticationUtils.class);
//        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(restaurantRepository.findFirstBySlug(Mockito.anyString())).thenReturn(Optional.ofNullable(restaurant));

        Mockito.when(featureRepository.findAll()).thenReturn(features);

        Map<Integer, Feature> map = features.stream().collect(Collectors.toMap(Feature::getId, Function.identity()));

        List<FacilityDTO> facilityDTOList = buildFavorite(restaurant, map);

        Mockito.when(restaurantMenuRepository.findAllByRestaurantCode(Mockito.anyString())).thenReturn(menuList);


        RestaurantDetail restaurantDetail = RestaurantDetail.builder()
                .id(restaurant.getId())
                .title(restaurant.getTitle())
                .slug(restaurant.getSlug())
                .code(restaurant.getCode())
                .address(restaurant.getAddress())
                .facilityDTOList(facilityDTOList)
                .description(restaurant.getDescription())
                .isFavorite(helperService.checkFavorite(restaurant.getSlug()))
                .restaurantMenuDTO(MappingUtils.map(menuList, RestaurantMenuDTO.class))
                .build();

        BaseResponse.ok(restaurantDetail);
        restaurantServiceImpl.get("slug-restaurant");

    }

    List<String> images = Collections.singletonList("aaaaaaaa.jpg");

    RestaurantUploadRequest restaurantUploadRequest = RestaurantUploadRequest.builder()
            .feature(feature)
            .description("hay")
            .restaurantType(RestaurantType.NHA_HANG)
            .address("ha noi")
            .images(images)
            .restaurantCode("restaurant-code")
            .title("nha hang")
            .build();


    RestaurantImage restaurantImage = new RestaurantImage(1L, "restaurant-code", "caption", "image", ImageType.FOOD);

    List<RestaurantImage> restaurantImages1 = Collections.singletonList(restaurantImage);

    @Test
    public void testUploadRestaurant() {

        PowerMockito.mockStatic(AuthenticationUtils.class);
        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(restaurantImageRepository.saveAll(restaurantImages1)).thenReturn(restaurantImages1);

        // lưu restaurant vao restaurant
        Restaurant restaurant = Restaurant.builder()
                .slug(HelperUtils.toSlug(restaurantUploadRequest.getTitle() + "restaurant-code"))
                .feature(restaurantUploadRequest.getFeature())
                .description(restaurantUploadRequest.getDescription())
                .title(restaurantUploadRequest.getTitle())
                .address(restaurantUploadRequest.getAddress())
                .restaurantType((restaurantUploadRequest.getRestaurantType()))
                .code("restaurant-code")
                .userId(userId)
                .approveStatus(ApproveStatus.PENDING)
                .build();

        Mockito.when(restaurantRepository.save(restaurant)).thenReturn(restaurant);

        Mockito.doNothing().when(restaurantRepository).updateSearchVector("restaurant-code");


        BaseResponse.ok(restaurant);

//        restaurantServiceImpl.uploadRestaurant(restaurantUploadRequest);


    }


    private List<FacilityDTO> buildFavorite(Restaurant restaurant, Map<Integer, Feature> map) {
        List<Integer> favorite = Arrays.asList(restaurant.getFeature());
        return favorite.stream().map(favoriteId -> FacilityDTO.builder()
                .id(favoriteId.toString())
                .name(map.get(favoriteId).getName())
                .build()).collect(Collectors.toList());
    }

}


