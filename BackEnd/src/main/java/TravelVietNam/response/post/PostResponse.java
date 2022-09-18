package TravelVietNam.response.post;


import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostResponse {
    private String id;
    private String content;
    private String title;
    private String image;


}
