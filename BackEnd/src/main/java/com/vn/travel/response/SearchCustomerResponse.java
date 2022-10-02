package com.vn.travel.response;

import com.vn.travel.response.activities.ActivitiesDTO;
import com.vn.travel.response.hotel.HotelDTO;
import com.vn.travel.response.restaurant.RestaurantDTO;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Builder
public class SearchCustomerResponse {
    private List<HotelDTO> hotels;
    private List<RestaurantDTO> restaurants;
    private List<ActivitiesDTO> activities;
}
