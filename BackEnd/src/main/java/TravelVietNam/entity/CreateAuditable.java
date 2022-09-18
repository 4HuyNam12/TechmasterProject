package TravelVietNam.entity;

import TravelVietNam.entity.account.Account;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
@ToString
@RequiredArgsConstructor
// abstract k tạo đc đối tượng mà phải kế thừa
public abstract class CreateAuditable {

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;

    @CreatedBy
    @JoinColumn(name = "created_by")
    @ManyToOne(fetch = FetchType.LAZY)
    @ToString.Exclude
    private Account createdBy;


}
