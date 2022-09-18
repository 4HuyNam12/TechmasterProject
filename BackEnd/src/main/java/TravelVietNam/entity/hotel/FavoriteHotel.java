package TravelVietNam.entity.hotel;

import TravelVietNam.entity.BaseTimestamp;
import TravelVietNam.response.hotel.FavoriteHotelDTO;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;
import java.io.Serializable;

@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
@Table(name = "favorite_hotel")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteHotel extends BaseTimestamp implements Serializable {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "user_id")
    public String userId;

    @Column(name = "product_code")
    public String productCode;

    @Column(name = "slug")
    public String slug;

    @Type(type = "jsonb")
    @Column(name = "hotel_data", columnDefinition = "jsonb")
    public FavoriteHotelDTO favoriteHotelDTO;

}
