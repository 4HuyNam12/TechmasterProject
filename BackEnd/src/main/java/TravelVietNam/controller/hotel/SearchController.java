package TravelVietNam.controller.hotel;

import TravelVietNam.request.FilterRequest;
import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.activities.FilterRequestActivities;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.ActivitiesSearchService;
import TravelVietNam.service.SearchService;
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
