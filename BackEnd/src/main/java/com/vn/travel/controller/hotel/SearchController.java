package com.vn.travel.controller.hotel;

import com.vn.travel.request.FilterRequest;
import com.vn.travel.request.SearchRequest;
import com.vn.travel.request.activities.FilterRequestActivities;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.service.ActivitiesSearchService;
import com.vn.travel.service.SearchService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/search")
@Log4j2
@AllArgsConstructor
public class SearchController {

    private SearchService searchService;
    private ActivitiesSearchService activitiesSearchService;

    // search hotel bởi người dùng
    @GetMapping("/search-filter")
    public BaseResponse searchFilter(SearchRequest searchRequest, FilterRequest filterRequest) {
        return BaseResponse.ok(searchService.searchFilter(searchRequest, filterRequest));
    }

    // search activities bởi người dùng
    @GetMapping("activities/search-filter")
    public BaseResponse activitiesSearchFilter(SearchRequest searchRequest, FilterRequestActivities filterRequest) {
        return BaseResponse.ok(activitiesSearchService.searchFilter(searchRequest, filterRequest));
    }

}
