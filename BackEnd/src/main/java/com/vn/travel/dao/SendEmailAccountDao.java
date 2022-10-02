package com.vn.travel.dao;

import com.vn.travel.entity.account.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SendEmailAccountDao extends JpaRepository<Account, Long> {


    @Query("SELECT a FROM Account a WHERE a.email = ?1")
    Account findAccountByEmail(String email);

    @Query("SELECT a FROM Account a where a.resetPasswordToken= ?1")
    Account findAccountByResetPasswordToken(String token);

}
