package com.vn.travel.service;


import com.vn.travel.request.SearchRequest;
import com.vn.travel.request.activities.FilterRequestActivities;
import com.vn.travel.response.activities.ActivitiesSearchResponse;

public interface ActivitiesSearchService {

    ActivitiesSearchResponse searchFilter(SearchRequest searchRequest, FilterRequestActivities filterRequest);

}