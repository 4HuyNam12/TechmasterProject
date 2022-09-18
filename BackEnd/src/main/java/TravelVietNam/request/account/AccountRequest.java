package TravelVietNam.request.account;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class AccountRequest {
    private String id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private Boolean enabled;
    private Boolean gender;
    private String role;
    private String image;
    private String dob;
    private Long roleId;

    @JsonIgnore
    private MultipartFile multipartFile;

}
