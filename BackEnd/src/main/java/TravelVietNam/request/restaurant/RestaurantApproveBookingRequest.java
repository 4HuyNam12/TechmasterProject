package TravelVietNam.request.restaurant;

import TravelVietNam.common.type.BookingStatus;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class RestaurantApproveBookingRequest {
    private String bookingId;
    private BookingStatus status;
}
