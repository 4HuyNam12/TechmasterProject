package TravelVietNam.response.hotel;

import TravelVietNam.common.HotelType;
import TravelVietNam.common.type.ApproveStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HotelInfoDTO {
    private String id;

    private String code;

    private String title;

    private String description;

    private String slug;

    private HotelType hotelType;

    private String phonePartner;

    private Double star;

    private Integer rank;

    private Integer[] amenities;

    private Double minPrice;

    private String address;

    private String userId;

    private ApproveStatus approveStatus;

    private List<String> imagesList;
}
