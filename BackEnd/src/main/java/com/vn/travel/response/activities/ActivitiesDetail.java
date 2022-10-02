package com.vn.travel.response.activities;

import com.vn.travel.response.hotel.ImageDTO;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActivitiesDetail {
    private String id;
    private String code;
    private String slug;
    private String title;
    private String description;
    private List<ImageDTO> images;
    private String address;
    private Double childPrice;
    private Double adultPrice;
    private boolean isFavorite;
    private Integer duration;
    @JsonProperty("games")
    private List<ActivitiesGameDTO> activitiesGameDTOS;
}
