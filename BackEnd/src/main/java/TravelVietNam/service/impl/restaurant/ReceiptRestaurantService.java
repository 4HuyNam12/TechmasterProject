package TravelVietNam.service.impl.restaurant;

import TravelVietNam.common.type.BookingStatus;
import TravelVietNam.request.restaurant.BookingRestaurantRequest;
import TravelVietNam.request.restaurant.RestaurantApproveBookingRequest;
import TravelVietNam.response.BaseResponse;

public interface ReceiptRestaurantService {

    BaseResponse bookingRestaurant(BookingRestaurantRequest bookingRestaurantRequest);

    void restaurantApproStatusRepository(RestaurantApproveBookingRequest restaurantApproveBookingRequest);

    void restaurantApproStatusRepositoryUserId(RestaurantApproveBookingRequest restaurantApproveBookingRequest);

    BaseResponse getListRestaurantReceipt(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getListRestaurantReceiptByUserId(BookingStatus status, Integer page, Integer perPage);


    BaseResponse getReceiptRestaurantDetail(String id);
}
