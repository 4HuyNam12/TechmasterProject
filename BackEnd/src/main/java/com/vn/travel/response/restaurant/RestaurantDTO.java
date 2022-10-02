package com.vn.travel.response.restaurant;

import com.vn.travel.common.RestaurantType;
import com.vn.travel.common.type.ApproveStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
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
public class RestaurantDTO {

    private String code;
    private String title;
    private String description;
    private String slug;
    @JsonProperty("restaurantType")
    private RestaurantType restaurantType;

    @JsonIgnore
    private List<Integer> feature;

    @JsonIgnore
    private List<Integer> menus;
    @JsonProperty("menus")
    private List<RestaurantMenuDTO> restaurantMenuDTOList;

    @JsonProperty("feature")
    private List<FacilityDTO> facilityDTOList;

    private String address;
    private String image;
    private boolean isFavor;
    private ApproveStatus approveStatus;

}
