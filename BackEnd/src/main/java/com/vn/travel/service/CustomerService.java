package com.vn.travel.service;

import com.vn.travel.response.activities.ActivitiesDTO;
import com.vn.travel.response.hotel.HotelDTO;
import com.vn.travel.response.restaurant.RestaurantDTO;

import java.util.List;

public interface CustomerService {

    List<RestaurantDTO> getListRestaurant(String title);

    List<HotelDTO> getListHotel(String title);

    List<ActivitiesDTO>getListActivities(String title);


}
