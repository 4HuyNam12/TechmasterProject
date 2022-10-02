package com.vn.travel.service.impl.restaurant;

import com.vn.travel.request.restaurant.RestaurantMenuUploadBody;
import com.vn.travel.request.restaurant.RestaurantUploadRequest;
import com.vn.travel.response.BaseResponse;

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
