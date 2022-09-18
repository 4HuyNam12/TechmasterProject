package TravelVietNam.service;


import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.activities.FilterRequestActivities;
import TravelVietNam.response.activities.ActivitiesSearchResponse;

public interface ActivitiesSearchService {

    ActivitiesSearchResponse searchFilter(SearchRequest searchRequest, FilterRequestActivities filterRequest);

}