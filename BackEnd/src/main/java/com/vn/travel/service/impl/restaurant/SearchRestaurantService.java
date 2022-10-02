package com.vn.travel.service.impl.restaurant;


import com.vn.travel.request.SearchRequest;
import com.vn.travel.request.restaurant.FilterRequestRestaurant;
import com.vn.travel.response.restaurant.SearchRestaurantResponse;

public interface SearchRestaurantService {
    SearchRestaurantResponse searchFilter(SearchRequest searchRequest, FilterRequestRestaurant filterRequestRestaurant);
}