package com.vn.travel.entity.post;

import com.vn.travel.entity.BaseTimestamp;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "post")
public class Post extends BaseTimestamp {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    //columnDefinition giúp cấu hình kiểu dữ liệu ở trong mysql
    @Column(name = "content", columnDefinition = "text")
    private String content;

    @Column(name = "title")
    private String title;

    @Column(name = "image")
    private String image;

}
