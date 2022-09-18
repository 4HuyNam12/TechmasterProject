package TravelVietNam;


import TravelVietNam.dao.SendEmailAccountDao;
import TravelVietNam.entity.account.Account;
import TravelVietNam.entity.account.Role;
import TravelVietNam.service.impl.EmailServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.modules.junit4.PowerMockRunner;


@RunWith(PowerMockRunner.class)
public class EmailServiceImplTest {

    @Mock
    SendEmailAccountDao sendEmailAccountDao;

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
            .role(new Role(1L, "ROLE_ADMIN"))
            .image("aaaaaaaaaaaaa.jpg")
            .phone("0983302976")
            .password("123456")
            .resetPasswordToken("abc")
            .build();

    @Test
    public void testUpdateResetPasswordToken() {
        Mockito.when(sendEmailAccountDao.findAccountByEmail(Mockito.any())).thenReturn(account);

        Mockito.when(sendEmailAccountDao.save(Mockito.any())).thenReturn(account);
        emailServiceImpl.updateResetPasswordToken("abc" , "nam.nguyen@gmail.com");

    }

    @Test
    public void testGetByResetPasswordToken() {
        Mockito.when(sendEmailAccountDao.findAccountByResetPasswordToken(Mockito.any())).thenReturn(account);
        emailServiceImpl.getByResetPasswordToken("abc");
    }


    @Test
    public void testUpdatePassWord() {
         String newPassword = "aaaaaaaaaa";
        Mockito.when(sendEmailAccountDao.save(Mockito.any())).thenReturn(account);

        sendEmailAccountDao.save(account);
        emailServiceImpl.updatePassWord(account ,newPassword);
    }

}
