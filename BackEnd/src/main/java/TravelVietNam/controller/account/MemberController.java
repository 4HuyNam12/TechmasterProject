package TravelVietNam.controller.account;


import TravelVietNam.common.type.BookingStatus;
import TravelVietNam.request.activities.ActivitiesApproveBookingRequest;
import TravelVietNam.request.hotel.HotelApproveBookingRequest;
import TravelVietNam.request.restaurant.RestaurantApproveBookingRequest;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.ReceiptService;
import TravelVietNam.service.impl.restaurant.ReceiptRestaurantService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/member")
@CrossOrigin(origins = "*", maxAge = -1)
@AllArgsConstructor
@Log4j2
public class MemberController {

    private ReceiptService receiptService;
    private ReceiptRestaurantService receiptRestaurantService;

    // api trả về list book khu vui chơi của member
    @GetMapping("/activities/booking/list")
    public BaseResponse getListActivitiesByUserId(@RequestParam(value = "status", required = false) BookingStatus status,
                                                  @RequestParam(value = "page", defaultValue = "0") Integer page,
                                                  @RequestParam(value = "perPage", defaultValue = "5") Integer perPage) {
        return receiptService.getListActivitiesReceiptByUserId(status, page, perPage);
    }


    // api trả về list book hotel của member
    @GetMapping("/hotel/booking/list")
    public BaseResponse getListHotelByPartner(@RequestParam(value = "status", required = false) BookingStatus status,
                                              @RequestParam(value = "page", defaultValue = "0") Integer page,
                                              @RequestParam(value = "perPage", defaultValue = "5") Integer perPage) {
        return receiptService.getListHotelReceiptByUserId(status, page, perPage);
    }

    // api trả về list book nhà hàng của member
    @GetMapping("/restaurant/booking/list")
    public BaseResponse getListRestaurantByPartner(@RequestParam(value = "status", required = false) BookingStatus status,
                                                   @RequestParam(value = "page", defaultValue = "0") Integer page,
                                                   @RequestParam(value = "perPage", defaultValue = "5") Integer perPage) {
        return receiptRestaurantService.getListRestaurantReceiptByUserId(status, page, perPage);
    }

    // api member thay đổi trạng thái  book của hotel
    @PostMapping("booking/approve/hotel")
    public BaseResponse approveHotelBooking(@RequestBody HotelApproveBookingRequest request) {
        receiptService.approveHotelBooking(request);
        return BaseResponse.ok();
    }

    // api member thay đổi trạng thái  book của activities
    @PostMapping("booking/approve/activities")
    public BaseResponse approveActivitiesBooking(@RequestBody ActivitiesApproveBookingRequest request) {
        receiptService.approveActivitiesBookingUserId(request);
        return BaseResponse.ok();
    }

    // api member thay đổi trạng thái  book của restaurant
    @PostMapping("booking/approve/restaurant")
    public BaseResponse approveRestaurantBooking(@RequestBody RestaurantApproveBookingRequest restaurantApproveBookingRequest) {
        receiptRestaurantService.restaurantApproStatusRepositoryUserId(restaurantApproveBookingRequest);
        return BaseResponse.ok();
    }


}
