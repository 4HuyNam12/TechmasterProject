package com.vn.travel.entity.hotel;

import com.vn.travel.common.type.ImageType;
import com.vn.travel.entity.BaseTimestamp;
import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "hotel_image",
        indexes = {@Index(name = "hotel_image_hotel_code_idx", columnList = "hotel_code")})
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HotelImage extends BaseTimestamp {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;

    @Column(name = "hotel_code")
    private String hotelCode;

    @Column(name = "caption", columnDefinition = "text")
    private String caption;

    @Column(name = "url")
    private String url;

    @Enumerated(EnumType.STRING)
    @Column(name = "image_type")
    private ImageType imageType;
}
