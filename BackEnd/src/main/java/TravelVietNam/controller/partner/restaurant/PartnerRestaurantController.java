package TravelVietNam.controller.partner.restaurant;

import TravelVietNam.common.type.BookingStatus;
import TravelVietNam.request.restaurant.RestaurantApproveBookingRequest;
import TravelVietNam.request.restaurant.RestaurantMenuUploadBody;
import TravelVietNam.request.restaurant.RestaurantUploadRequest;
import TravelVietNam.response.BaseResponse;
import TravelVietNam.service.impl.restaurant.ReceiptRestaurantService;
import TravelVietNam.service.impl.restaurant.RestaurantService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/partner")
@Log4j2
@AllArgsConstructor
public class PartnerRestaurantController {

    private ReceiptRestaurantService receiptRestaurantService;
    private RestaurantService restaurantService;

    // api thêm restaurant bởi partner
    @PostMapping("restaurant/upload")
    public BaseResponse uploadRestaurant(@ModelAttribute RestaurantUploadRequest restaurantUploadRequest) {
        return restaurantService.uploadRestaurant(restaurantUploadRequest);
    }

    // api cập nhật restaurant bởi partner
    @PostMapping("restaurant/update")
    public BaseResponse updateRestaurant(@ModelAttribute RestaurantUploadRequest restaurantUploadRequest) {
        return restaurantService.updateRestaurant(restaurantUploadRequest);
    }

    // api thêm menu của  restaurant bởi partner
    @PostMapping("restaurant/menu/upload")
    public BaseResponse uploadMenuRestaurant(@ModelAttribute RestaurantMenuUploadBody restaurantMenuUploadBody) {
        restaurantService.uploadRestaurantMenu(restaurantMenuUploadBody);
        return BaseResponse.ok();
    }

    // api cập nhật menu restaurant bởi partner
    @PostMapping("restaurant/menu/update")
    public BaseResponse updateMenuRestaurant(@ModelAttribute RestaurantMenuUploadBody restaurantMenuUploadBody) {
        restaurantService.updateRestaurantMenu(restaurantMenuUploadBody);
        return BaseResponse.ok();
    }

    // api trả về list restaurant bởi partner
    @GetMapping("restaurant/list")
    public BaseResponse getListRestaurant(@RequestParam(value = "page", defaultValue = "0") Integer page,
                                          @RequestParam(value = "perPage", defaultValue = "5") Integer perPage) {
        return restaurantService.getListRestaurant(page, perPage);
    }

    // api thay đổi trạng thái book restaurant bởi partner
    @PostMapping("restaurant/booking/approve")
    public BaseResponse approveRestaurantBooking(@RequestBody RestaurantApproveBookingRequest restaurantApproveBookingRequest) {
        receiptRestaurantService.restaurantApproStatusRepository(restaurantApproveBookingRequest);
        return BaseResponse.ok();
    }

    // api trả về list  booking restaurant bởi partner
    @GetMapping("restaurant/booking/list")
    public BaseResponse getListRestaurantByPartner(@RequestParam(value = "status", defaultValue = "") BookingStatus status,
                                                   @RequestParam(value = "page", defaultValue = "0") Integer page,
                                                   @RequestParam(value = "perPage", defaultValue = "5") Integer perPage) {
        return receiptRestaurantService.getListRestaurantReceipt(status, page, perPage);
    }

    // xóa  restaurant
    @PostMapping("restaurant/delete/{restaurantCode}")
    public BaseResponse deleteRestaurant(@PathVariable String restaurantCode) {
        restaurantService.deleteRestaurant(restaurantCode);
        return BaseResponse.ok();
    }

    // xóa  menu restaurant
    @PostMapping("restaurant/menu/delete/{menuId}")
    public BaseResponse deleteRestaurantMenu(@PathVariable Long menuId) {
        restaurantService.deleteRestaurantMenu(menuId);
        return BaseResponse.ok();
    }

}
