package TravelVietNam.response.token;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TokenResponse {

    private String accessToken;
    private Long expirationTime;
    private String accountId;
    private Long roleId;
    private String roleName;

}
