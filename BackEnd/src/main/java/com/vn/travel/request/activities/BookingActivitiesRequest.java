/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vn.travel.request.activities;

import com.vn.travel.model.Contact;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingActivitiesRequest {

    private String activitiesCode;

    private Contact contact;

    private Integer travelDate;

    private Integer numberTicketChild;

    private Integer numberTicketAdult;

}
