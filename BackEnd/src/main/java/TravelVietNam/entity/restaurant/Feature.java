package TravelVietNam.entity.restaurant;

import lombok.*;

import javax.persistence.*;


@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "feature")
// lưu các danh mục của khách sạn
public class Feature {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NonNull
    private Integer id;

    @Column(name = "name", columnDefinition = "text")
    private String name;

}
