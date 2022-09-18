package TravelVietNam.service;

import TravelVietNam.common.type.BookingStatus;
import TravelVietNam.request.activities.ActivitiesApproveBookingRequest;
import TravelVietNam.request.activities.BookingActivitiesRequest;
import TravelVietNam.request.hotel.BookingRequest;
import TravelVietNam.request.hotel.HotelApproveBookingRequest;
import TravelVietNam.response.BaseResponse;

public interface ReceiptService {

    BaseResponse bookingHotel(BookingRequest bookingRequest);

    void approveHotelBooking(HotelApproveBookingRequest request);

    void approveHotelBookingUserId(HotelApproveBookingRequest request);

    BaseResponse getListHotelReceipt(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getReceiptDetail(String id);

    void approveActivitiesBooking(ActivitiesApproveBookingRequest request);

    void approveActivitiesBookingUserId(ActivitiesApproveBookingRequest request);

    BaseResponse getListActivitiesReceipt(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getListActivitiesReceiptByUserId(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getListHotelReceiptByUserId(BookingStatus status, Integer page, Integer perPage);

    BaseResponse getReceiptDetailActivities(String id);

    BaseResponse bookingActivities(BookingActivitiesRequest bookingRequest);
}
