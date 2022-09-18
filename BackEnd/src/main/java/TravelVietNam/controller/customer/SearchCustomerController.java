package TravelVietNam.controller.customer;

import TravelVietNam.response.SearchCustomerResponse;
import TravelVietNam.response.activities.ActivitiesDTO;
import TravelVietNam.response.hotel.HotelDTO;
import TravelVietNam.response.restaurant.RestaurantDTO;
import TravelVietNam.service.CustomerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/search/customer/")
@Log4j2
@AllArgsConstructor
public class SearchCustomerController {

    private CustomerService customerService;

    // api search của người dùng trả về 3 list hotel,restauran, activities
    @GetMapping("/search-filter")
    public SearchCustomerResponse search(@RequestParam(name = "title", required = false, defaultValue = "") String title) {


        List<HotelDTO> hotels = customerService.getListHotel(title);
        List<RestaurantDTO> restaurants = customerService.getListRestaurant(title);
        List<ActivitiesDTO> activities = customerService.getListActivities(title);


        return SearchCustomerResponse.builder()
                .hotels(hotels)
                .restaurants(restaurants)
                .activities(activities)
                .build();

    }


}
