package TravelVietNam.service;

import TravelVietNam.request.hotel.HotelRoomUploadBody;
import TravelVietNam.request.hotel.HotelUploadBody;
import TravelVietNam.response.BaseResponse;

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
