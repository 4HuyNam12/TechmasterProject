package com.vn.travel.request.activities;


import com.vn.travel.common.type.BookingStatus;
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
public class ActivitiesApproveBookingRequest {
    private String bookingId;
    private BookingStatus status;
}
