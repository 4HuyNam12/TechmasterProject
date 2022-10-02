/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vn.travel.request.restaurant;

import com.vn.travel.model.Contact;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingRestaurantRequest {

    private String restaurantCode;

    private Contact contact;

    private Integer checkinDate;

    private String checkinTime;

    private Integer numberChild;

    private Integer numberAdult;

}
