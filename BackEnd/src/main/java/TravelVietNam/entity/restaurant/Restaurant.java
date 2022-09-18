package TravelVietNam.entity.restaurant;

import TravelVietNam.common.RestaurantType;
import TravelVietNam.common.type.ApproveStatus;
import TravelVietNam.entity.BaseTimestamp;
import com.vladmihalcea.hibernate.type.array.IntArrayType;
import com.vladmihalcea.hibernate.type.array.StringArrayType;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;


@Builder
@Getter
@Setter
@TypeDefs({
        @TypeDef(name = "string-array", typeClass = StringArrayType.class),
        @TypeDef(name = "int-array", typeClass = IntArrayType.class),
        @TypeDef(name = "json", typeClass = JsonStringType.class),
        @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "restaurant")
public class Restaurant extends BaseTimestamp {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "code")
    private String code;

    @Column(name = "title", length = 1000)
    private String title;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "slug", length = 1000)
    private String slug;

    @Enumerated(EnumType.STRING)
    @Column(name = "restaurant_type")
    private RestaurantType restaurantType;

    // tiện ích của nhà hàng
    @Type(type = "int-array")
    @Column(name = "feature", columnDefinition = "integer[]")
    private Integer[] feature;

    @Column(name = "address")
    private String address;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "approve_status")
    @Enumerated(EnumType.STRING)
    private ApproveStatus approveStatus;

}
