package TravelVietNam.service.impl.restaurant;


import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.restaurant.FilterRequestRestaurant;
import TravelVietNam.response.restaurant.SearchRestaurantResponse;

public interface SearchRestaurantService {
    SearchRestaurantResponse searchFilter(SearchRequest searchRequest, FilterRequestRestaurant filterRequestRestaurant);
}