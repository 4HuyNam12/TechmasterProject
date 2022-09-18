package TravelVietNam.service;


import TravelVietNam.request.FilterRequest;
import TravelVietNam.request.SearchRequest;
import TravelVietNam.response.hotel.SearchResponse;

public interface SearchService {

    SearchResponse searchFilter(SearchRequest searchRequest, FilterRequest filterRequest);

//    SearchCustomerResponse searchFilterCustomer(SearchRequest searchRequest ,FilterRequest  filterRequest );

}