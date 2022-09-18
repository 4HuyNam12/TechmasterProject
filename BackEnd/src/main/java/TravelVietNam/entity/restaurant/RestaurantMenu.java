package TravelVietNam.entity.restaurant;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "restaurant_menu",
        indexes = {@Index(name = "r_m_restaurant_code_idx", columnList = "restaurant_code")})
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RestaurantMenu {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;

    @Column(name = "restaurant_code")
    private String restaurantCode;

    @Column(name = "price")
    private Double price;

    @Column(name = "currency")
    private String currency;

    @Column(name = "description")
    private String description;

    @Column(name = "name")
    private String name;

    @Column(name = "available")
    private Boolean available;

    @Column(name = "image")
    private String image;


}
