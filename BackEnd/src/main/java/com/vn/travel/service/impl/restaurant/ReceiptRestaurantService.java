package com.vn.travel.service.impl.restaurant;

import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.request.restaurant.BookingRestaurantRequest;
import com.vn.travel.request.restaurant.RestaurantApproveBookingRequest;
import com.vn.travel.response.BaseResponse;

public interface ReceiptRestaurantService {

    BaseResponse bookingRestaurant(BookingRestaurantRequest bookingRestaurantRequest);

    void restaurantApproStatusRepository(RestaurantApproveBookingRequest restaurantApproveBookingRequest);

    void restaurantApproStatusRepositoryUserId(RestaurantApproveBookingRequest restaurantApproveBookingRequest);

    BaseResponse getListRestaurantReceipt(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getListRestaurantReceiptByUserId(BookingStatus status, Integer page, Integer perPage);


    BaseResponse getReceiptRestaurantDetail(String id);
}
