package com.vn.travel.entity.restaurant;

import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.entity.BaseTimestamp;
import com.vn.travel.entity.BookingContact;
import com.vn.travel.response.restaurant.RestaurantInfoDTO;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.*;


@Builder
@Getter
@Setter
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "restaurant_receipt")
public class RestaurantBookingReceipt extends BaseTimestamp {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "booking_id")
    private String bookingId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "contact_id")
    private BookingContact contact;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private BookingStatus status;

    @Column(name = "checkin_day")
    private Integer checkinDay;

    @Column(name = "checkin_time")
    private String checkinTime;

    @Column(name = "number_child")
    private Integer numberChild;

    @Column(name = "number_adult")
    private Integer numberAdult;

    @Type(type = "jsonb")
    @Column(name = "restaurant_info", columnDefinition = "jsonb")
    private RestaurantInfoDTO restaurantInfoDTO;

    @Column(name = "phone_partner")
    private String phonePartner;

    @Column(name = "partner_id")
    private String partnerId;

    @Column(name = "user_id")
    private String userId;

}
