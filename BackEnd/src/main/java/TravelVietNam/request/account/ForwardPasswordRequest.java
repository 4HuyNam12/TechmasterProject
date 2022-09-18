package TravelVietNam.request.account;


import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ForwardPasswordRequest {

    private String token;
    private String password;
}
