package TravelVietNam.service;

import TravelVietNam.response.activities.ActivitiesDTO;
import TravelVietNam.response.hotel.HotelDTO;
import TravelVietNam.response.restaurant.RestaurantDTO;

import java.util.List;

public interface CustomerService {

    List<RestaurantDTO> getListRestaurant(String title);

    List<HotelDTO> getListHotel(String title);

    List<ActivitiesDTO>getListActivities(String title);


}
