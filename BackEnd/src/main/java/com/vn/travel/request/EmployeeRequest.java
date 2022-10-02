package com.vn.travel.request;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeRequest {

    private String name;
    private Boolean gender;
    private String dob;
    private String phoneNumber;
    private String email;
    private String identifyCard;
    private String currentAddress;
    private String homeTown;
    private Long position;

}
