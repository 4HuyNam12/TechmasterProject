package TravelVietNam.controller.restaurant;

import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.restaurant.FilterRequestRestaurant;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.impl.restaurant.SearchRestaurantService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/search")
@Log4j2
@AllArgsConstructor
public class SearchRestaurantController {

    private SearchRestaurantService searchRestaurantService;


    // search restaurant của người dùng
    @GetMapping("/restaurant/search-filter")
    public BaseResponse searchFilter(SearchRequest searchRequest, FilterRequestRestaurant filterRequestRestaurant) {
        return BaseResponse.ok(searchRestaurantService.searchFilter(searchRequest, filterRequestRestaurant));
    }

}
