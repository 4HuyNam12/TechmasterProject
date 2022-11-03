package com.vn.travel;

import com.vn.travel.entity.account.Account;
import com.vn.travel.repository.SendEmailAccountRepository;
import com.vn.travel.service.impl.EmailServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.modules.junit4.PowerMockRunner;


@RunWith(PowerMockRunner.class)
public class EmailServiceImplTest {

    @Mock
    SendEmailAccountRepository sendEmailAccountRepository;

    @InjectMocks
    EmailServiceImpl emailServiceImpl;

    Account account = Account.builder()
            .id("1")
            .dob("2101/12/12")
            .email("nam.nguyen@gmail.com")
            .enabled(true)
            .name("nam")
            .gender(true)
            .password("123456")
            .role(1L)
            .image("aaaaaaaaaaaaa.jpg")
            .phone("0983302976")
            .password("123456")
            .resetPasswordToken("abc")
            .build();

    @Test
    public void testUpdateResetPasswordToken() {
        Mockito.when(sendEmailAccountRepository.findAccountByEmail(Mockito.any())).thenReturn(account);

        Mockito.when(sendEmailAccountRepository.save(Mockito.any())).thenReturn(account);
        emailServiceImpl.updateResetPasswordToken("abc" , "nam.nguyen@gmail.com");

    }

    @Test
    public void testGetByResetPasswordToken() {
        Mockito.when(sendEmailAccountRepository.findAccountByResetPasswordToken(Mockito.any())).thenReturn(account);
        emailServiceImpl.getByResetPasswordToken("abc");
    }


    @Test
    public void testUpdatePassWord() {
         String newPassword = "aaaaaaaaaa";
        Mockito.when(sendEmailAccountRepository.save(Mockito.any())).thenReturn(account);

        sendEmailAccountRepository.save(account);
        emailServiceImpl.updatePassWord(account ,newPassword);
    }

}
