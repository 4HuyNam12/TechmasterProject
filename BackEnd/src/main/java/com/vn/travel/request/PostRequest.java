package com.vn.travel.request;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostRequest {

    private Long id;
    private String content;
    private String title;
    private String image;

    @JsonIgnore
    private MultipartFile multipartFile;

}
