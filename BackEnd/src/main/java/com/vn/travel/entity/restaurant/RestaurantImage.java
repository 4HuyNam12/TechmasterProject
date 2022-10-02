package com.vn.travel.entity.restaurant;

import com.vn.travel.common.type.ImageType;
import com.vn.travel.entity.BaseTimestamp;
import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "restaurant_image",
        indexes = {@Index(name = "restaurant_image_code_idx", columnList = "restaurant_code")})
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

// lưu các ảnh của khách sạn
public class RestaurantImage extends BaseTimestamp {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;

    @Column(name = "restaurant_code")
    private String restaurantCode;

    @Column(name = "caption", columnDefinition = "text")
    private String caption;

    @Column(name = "url")
    private String url;

    @Enumerated(EnumType.STRING)
    @Column(name = "image_type")
    private ImageType imageType;
}
