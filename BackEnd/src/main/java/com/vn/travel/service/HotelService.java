package com.vn.travel.service;

import com.vn.travel.request.hotel.HotelRoomUploadBody;
import com.vn.travel.request.hotel.HotelUploadBody;
import com.vn.travel.response.BaseResponse;

public interface HotelService {
    BaseResponse get(String slug);

    BaseResponse uploadHotel(HotelUploadBody hotelUploadBody);

    void uploadHotelRoom(HotelRoomUploadBody hotelRoomUploadBody);

    void deleteHotel(String hotelCode);

    void deleteHotelRoom(Long roomId);

    BaseResponse getListHotel(Integer page, Integer perPage);

    BaseResponse getListRoom(String hotelCode, Integer page, Integer perPage);

    BaseResponse updateHotel(HotelUploadBody hotelUploadBody);

    void updateHotelRoom(HotelRoomUploadBody hotelRoomUploadBody);
}
