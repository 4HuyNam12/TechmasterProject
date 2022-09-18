package TravelVietNam;


import TravelVietNam.dao.AccountDAO;
import TravelVietNam.model.AccountDTO;
import TravelVietNam.utils.FileStore;
import TravelVietNam.constant.Constants;
import TravelVietNam.entity.account.Account;
import TravelVietNam.entity.account.Role;
import TravelVietNam.request.account.AccountRequest;
import TravelVietNam.response.ApiResponse;
import TravelVietNam.response.account.AccountResponse;
import TravelVietNam.service.EmailService;
import TravelVietNam.service.impl.AccountServiceImpl;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.data.domain.Page;

import java.util.ArrayList;
import java.util.List;

@RunWith(PowerMockRunner.class)
public class AccountServiceImplTest {

    @InjectMocks
    AccountServiceImpl accountServiceImpl;

    @Mock
    AccountDAO accountDAO;

    @Mock
    private EmailService emailService;

    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();



    Account account = Account.builder()
            .id("1")
            .dob("2021/12/12")
            .email("TravelVietNam@gmail.com")
            .enabled(true)
            .name("trav")
            .gender(true)
            .password("123456")
            .role(new Role(1L, "ROLE_ADMIN"))
            .image("aaaaaaaaaaaaa.jpg")
            .phone("0983302976")
            .password("123456")
            .build();

    AccountRequest request = AccountRequest.builder()
            .id("1")
            .dob("2101/12/12")
            .email("TravelVietNam@gmail.com")
            .enabled(true)
            .name("nam")
            .gender(true)
//                .role(new Role(1L , "ROLE_ADMIN"))
            .role("ROLE_MEMBER")
            .roleId(1L)
            .image("aaaaaaaaaaaaa.jpg")
            .phone("0983302976")
            .password("123456")
            .build();

    AccountDTO accountDTO1 = AccountDTO.builder()
            .id("1")
            .name("nguyen huy nam")
            .dob("2000/12/12")
            .email("nam.nguyen@ekoios.vn")
            .enabled(true)
            .phone("0983302976")
            .roleId(5L)
            .enabled(true)
            .build();
    AccountDTO accountDTO2 = AccountDTO.builder()
            .id("1234")
            .name("nguyen huy nam ekoios")
            .dob("2000/12/12")
            .email("nam.nguyen@ekoios.vn")
            .enabled(true)
            .phone("0983302977")
            .roleId(4L)
            .role("ROLE_ADMIN")
            .enabled(true)
            .build();


    @Test
    public void testGetAccount() {

        List<AccountDTO> listAccount = new ArrayList<>();
        listAccount.add(accountDTO1);
        listAccount.add(accountDTO2);

        ApiResponse apiResponse = ApiResponse.builder()
                .data(listAccount)
                .totalElement((long) listAccount.size())
                .build();

        Page<Account> accounts = Mockito.mock(Page.class);

        Mockito.when(accountDAO.searchAccountByNameEmailRole(Mockito.anyString(), Mockito.anyString(), Mockito.any(), Mockito.any())).thenReturn(accounts);
        Mockito.when(accountDAO.countAccountByNameAndEmailAndRole(Mockito.anyString(), Mockito.anyString(), Mockito.any())).thenReturn(1L);

        ApiResponse apiResponse1 = accountServiceImpl.searchByNameEmailRole("travalar", "TravelVietNam@gmail.com", "ROLE_ADMIN", 1, 2);

        MatcherAssert.assertThat(apiResponse1.getTotalElement(), Matchers.is(1L));
    }

    @Test
    public void testGetById() {

        AccountResponse accountResponse1 = convert(account);
        Mockito.when(accountDAO.getAccountById(Mockito.anyString())).thenReturn(account);
        accountResponse1 = accountServiceImpl.getById("1");
        MatcherAssert.assertThat(accountResponse1.getId(), Matchers.is("1"));
    }

    @Test
    public void testGetByEmail() {

        AccountResponse accountResponse1 = convert(account);

        Mockito.when(accountDAO.getAccountByEmail(Mockito.anyString())).thenReturn(account);

        accountResponse1 = accountServiceImpl.getByEmail("TravelVietNam@gmail.com");

        MatcherAssert.assertThat(accountResponse1.getEmail(), Matchers.is("TravelVietNam@gmail.com"));

    }

    @Test
    public void testDelete() {

        Mockito.doNothing().when(accountDAO).deleteAllById("1");
        accountServiceImpl.delete("1");
        MatcherAssert.assertThat(account.getId(), Matchers.is("1"));
    }


    @Test
    public void testRegister() {


        Mockito.when(accountDAO.save(account)).thenReturn(account);

        accountServiceImpl.register(request);

    }


    @Test
    public void testAddAccount() {

        Mockito.when(accountDAO.save(account)).thenReturn(account);

        accountServiceImpl.add(request);

        MatcherAssert.assertThat(request.getEmail(), Matchers.is("TravelVietNam@gmail.com"));

    }

    @Test
    public void testUpdateAccount() {


        Mockito.when(accountDAO.getAccountById(Mockito.any())).thenReturn(account);
        accountServiceImpl.update(request, "1");
        MatcherAssert.assertThat(request.getId(), Matchers.is("1"));
        MatcherAssert.assertThat(request.getRole(), Matchers.is("ROLE_MEMBER"));

    }


    @Test
    public void testUpdateProfileAccount() {


        Mockito.when(accountDAO.getAccountById(Mockito.any())).thenReturn(account);
        accountServiceImpl.update(request, "1");
        MatcherAssert.assertThat(request.getId(), Matchers.is("1"));
        MatcherAssert.assertThat(request.getRole(), Matchers.is("ROLE_MEMBER"));

    }

    @Test
    public void testUpdateProfile() {



        Mockito.when(accountDAO.getAccountById(Mockito.any())).thenReturn(account);

        String image1 = FileStore.getFilePath(request.getMultipartFile(), "-user");
        if (image1 != null) {
            request.setImage(image1);
        }

        account.setPhone(request.getPhone());
        account.setName(request.getName());
        account.setDob(request.getDob());
        account.setEmail(request.getEmail());
        account.setGender(request.getGender());
        if (image1 != null) {
            if (account.getImage() != null) {
                String image = account.getImage();
                FileStore.deleteFile(image);
            }
            account.setImage(request.getImage());
        }
        account.setDob(request.getDob());

        Mockito.when(accountDAO.save(account)).thenReturn(account);
        accountServiceImpl.updateProfile(request, "1");


    }

    public AccountResponse convert(Account account) {
        AccountResponse accountResponse = AccountResponse.builder().build();
        accountResponse.setId(account.getId());
        accountResponse.setDob(account.getDob());
        accountResponse.setEmail(account.getEmail());
        accountResponse.setImage(account.getImage());
        accountResponse.setRoleId(account.getRole().getId());
        accountResponse.setRoleName(account.getRole().getName());
        accountResponse.setName(account.getName());

        String gender;
        if (account.getGender() == true) {
            gender = Constants.AccountGender.GENDER_MALE;
        } else {
            gender = Constants.AccountGender.GENDER_FEMALE;
        }
        accountResponse.setGender(gender);
        accountResponse.setPhone(account.getPhone());
        accountResponse.setPassword(account.getPassword());
        return accountResponse;
    }


}
