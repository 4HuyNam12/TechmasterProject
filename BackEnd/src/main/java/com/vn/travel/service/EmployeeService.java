package com.vn.travel.service;

import com.vn.travel.common.type.ApproveStatus;
import com.vn.travel.request.activities.ActivitiesApproveRequest;
import com.vn.travel.request.hotel.HotelApproveRequest;
import com.vn.travel.request.restaurant.RestaurantApproveRequest;
import com.vn.travel.response.BaseResponse;

public interface EmployeeService {

    void approveHotel(HotelApproveRequest hotelApproveRequest);

    BaseResponse getListHotel(String hotelName, ApproveStatus status, Integer page, Integer perPage);

    void approveActivities(ActivitiesApproveRequest activitiesApproveRequest);

    BaseResponse getListActivities(String activitiesName, ApproveStatus status, Integer page, Integer perPage);


    void approveRestaurant(RestaurantApproveRequest restaurantApproveRequest);

    BaseResponse getListRestaurant(String activitiesName, ApproveStatus status, Integer page, Integer perPage);
}
