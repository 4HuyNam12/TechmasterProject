package TravelVietNam.response.restaurant;

import TravelVietNam.common.type.BookingStatus;
import lombok.*;


@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantBookingReceiptDTO {

    private String id;

    private String createdAt;

    private String updatedAt;

    private String bookingId;

    private BookingContactDTO contact;

    private BookingStatus status;

    private Integer checkinDay;

    private String checkinTime;

    private RestaurantInfoDTO restaurantInfoDTO;

    private String partnerId;
}
