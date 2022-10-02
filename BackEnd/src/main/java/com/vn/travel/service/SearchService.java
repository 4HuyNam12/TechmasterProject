package com.vn.travel.service;


import com.vn.travel.request.FilterRequest;
import com.vn.travel.request.SearchRequest;
import com.vn.travel.response.hotel.SearchResponse;

public interface SearchService {

    SearchResponse searchFilter(SearchRequest searchRequest, FilterRequest filterRequest);

//    SearchCustomerResponse searchFilterCustomer(SearchRequest searchRequest ,FilterRequest  filterRequest );

}