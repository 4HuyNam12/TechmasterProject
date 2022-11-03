package com.vn.travel.service.impl;

import com.vn.travel.constant.Constants;

import com.vn.travel.entity.account.Account;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.repository.SendEmailAccountRepository;
import com.vn.travel.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Objects;

@Component
@Transactional
public class EmailServiceImpl implements EmailService {

    @Autowired
    private SendEmailAccountRepository sendEmailAccountRepository;

    @Autowired
    JavaMailSender javaMailSender;


    @Override
    @Async
    public void sendSimpleMessage(String email, String subject, String text) throws MessagingException {

        MimeMessage message = javaMailSender.createMimeMessage();

        MimeMessageHelper helper   = new MimeMessageHelper(message , Constants.ENCODING_UTF8);
        helper.setFrom("travelsuptechmaster@gmail.com");
        helper.setTo(email);
        helper.setSubject(subject);
        helper.setText(text , true);
        javaMailSender.send(message);

    }

    @Override
    public void updateResetPasswordToken(String token ,String email) {
        Account account = sendEmailAccountRepository.findAccountByEmail(email);
        if (Objects.isNull(account)) {
            throw new RestApiException(4,"Could not find any customer with the email : " + email);
        }

            account.setResetPasswordToken(token);
            sendEmailAccountRepository.save(account);
    }

    @Override
    public Account getByResetPasswordToken(String token) {
        return sendEmailAccountRepository.findAccountByResetPasswordToken(token);
    }

    @Override
    public void updatePassWord(Account account, String newPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        account.setPassword(encodedPassword);

        account.setResetPasswordToken(null);
        sendEmailAccountRepository.save(account);

    }
}
