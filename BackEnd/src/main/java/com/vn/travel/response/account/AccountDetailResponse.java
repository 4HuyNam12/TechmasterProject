package com.vn.travel.response.account;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class AccountDetailResponse {
    private String name;
    private Boolean gender;
    private String dob;
    private String phone;
    private String email;
    private String identityCard;
    private String blockName;
    private String roomNumber;
    private String currentAddress;
    private String homeTown;

}
