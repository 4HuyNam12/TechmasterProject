package TravelVietNam.controller.restaurant;

import TravelVietNam.request.restaurant.BookingRestaurantRequest;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.ReceiptService;
import TravelVietNam.service.impl.restaurant.ReceiptRestaurantService;
import TravelVietNam.service.impl.restaurant.RestaurantService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/restaurant")
@Log4j2
@AllArgsConstructor
public class RestaurantController {
    private ReceiptService receiptService;
    private ReceiptRestaurantService receiptRestaurantService;
    private RestaurantService restaurantService;



    // get chi tiết bai slug
    @GetMapping("/{slug}")
    public BaseResponse get(@PathVariable String slug) {
        return restaurantService.get(slug);
    }

    // book restaurant
    @PostMapping("/book")
    public BaseResponse bookingRestaurant(@Valid @RequestBody BookingRestaurantRequest bookingRestaurantRequest) {
        return receiptRestaurantService.bookingRestaurant(bookingRestaurantRequest);
    }

    // get chi tiết  book
    @GetMapping("/book-detail/{id}")
    public BaseResponse bookingRestaurantDetail(@PathVariable("id") String id) {
        return receiptRestaurantService.getReceiptRestaurantDetail(id);
    }

}
