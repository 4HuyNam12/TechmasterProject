package com.vn.travel.controller.restaurant;

import com.vn.travel.request.restaurant.BookingRestaurantRequest;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.service.ReceiptService;
import com.vn.travel.service.impl.restaurant.ReceiptRestaurantService;
import com.vn.travel.service.impl.restaurant.RestaurantService;
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
