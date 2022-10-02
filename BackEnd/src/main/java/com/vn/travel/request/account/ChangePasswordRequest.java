package com.vn.travel.request.account;


import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChangePasswordRequest {

    private String id;
    private String password;
    private String newPassword;
}
