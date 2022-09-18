package TravelVietNam.controller.hotel;

import TravelVietNam.request.hotel.BookingRequest;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.HotelService;
import TravelVietNam.service.ReceiptService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/hotel")
@Log4j2
@AllArgsConstructor
public class HotelController {
    private HotelService hotelService;
    private ReceiptService receiptService;


    // get detail hotel bởi slug

    @GetMapping("/{slug}")
    public BaseResponse get(@PathVariable String slug) {
        return hotelService.get(slug);
    }


    //api book hotel
    @PostMapping("/book")
    public BaseResponse bookingHotel(@Valid @RequestBody BookingRequest bookingRequest) {
        return receiptService.bookingHotel(bookingRequest);
    }

    // get detail hotel bởi id
    @GetMapping("/book-detail/{id}")
    public BaseResponse bookingHotel(@PathVariable("id") String id) {
        return receiptService.getReceiptDetail(id);
    }

}
