package com.vn.travel.entity.account;

import com.vn.travel.entity.BaseTimestamp;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "account")
public class Account extends BaseTimestamp implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "gender")
    private Boolean gender;

    @Column(name = "password")
    private String password;

    @Column(name = "image_link")
    private String image;

    @Column(name = "dob")
    private String dob;

    @Column(name = "enabled")
    private Boolean enabled;

//    @ManyToOne
//    @JoinColumn(name = "role_id")
    @Column(name = "role_id")
    private Long role;

    @Column(name = "reset_password_token")
    private String resetPasswordToken;
}
