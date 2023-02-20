package com.vn.travel.service;

import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.request.activities.ActivitiesApproveBookingRequest;
import com.vn.travel.request.activities.BookingActivitiesRequest;
import com.vn.travel.request.hotel.BookingRequest;
import com.vn.travel.request.hotel.HotelApproveBookingRequest;
import com.vn.travel.response.BaseResponse;
import org.springframework.stereotype.Service;

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
