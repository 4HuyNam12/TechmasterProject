package TravelVietNam.exception;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ApiError {
    private Integer statusCode;
    private String message;
}
