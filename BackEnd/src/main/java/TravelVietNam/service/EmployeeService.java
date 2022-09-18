package TravelVietNam.service;

import TravelVietNam.common.type.ApproveStatus;
import TravelVietNam.request.activities.ActivitiesApproveRequest;
import TravelVietNam.request.hotel.HotelApproveRequest;
import TravelVietNam.request.restaurant.RestaurantApproveRequest;
import TravelVietNam.response.BaseResponse;

public interface EmployeeService {

    void approveHotel(HotelApproveRequest hotelApproveRequest);

    BaseResponse getListHotel(String hotelName, ApproveStatus status, Integer page, Integer perPage);

    void approveActivities(ActivitiesApproveRequest activitiesApproveRequest);

    BaseResponse getListActivities(String activitiesName, ApproveStatus status, Integer page, Integer perPage);


    void approveRestaurant(RestaurantApproveRequest restaurantApproveRequest);

    BaseResponse getListRestaurant(String activitiesName, ApproveStatus status, Integer page, Integer perPage);
}
