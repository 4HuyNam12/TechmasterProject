package TravelVietNam.service.impl.restaurant;

import TravelVietNam.request.restaurant.RestaurantMenuUploadBody;
import TravelVietNam.request.restaurant.RestaurantUploadRequest;
import TravelVietNam.response.BaseResponse;

public interface RestaurantService {
    BaseResponse get(String slug);

    BaseResponse uploadRestaurant(RestaurantUploadRequest restaurantUploadRequest);

    BaseResponse updateRestaurant(RestaurantUploadRequest restaurantUploadRequest);

    void uploadRestaurantMenu(RestaurantMenuUploadBody restaurantMenuUploadBody);

    void updateRestaurantMenu(RestaurantMenuUploadBody restaurantMenuUploadBody);

    void deleteRestaurant(String restaurantCode);

    void deleteRestaurantMenu(Long menuId);

    BaseResponse getListRestaurant(Integer page, Integer perPage);

//    BaseResponse getListRestaurantMenu(String RestaurantCode, Integer page, Integer perPage);

}
