package TravelVietNam.controller.acount;

import TravelVietNam.constant.Constants;
import TravelVietNam.constant.PropertyKeys;
import TravelVietNam.dao.SendEmailAccountDao;
import TravelVietNam.entity.account.Account;
import TravelVietNam.exception.RestApiException;
import TravelVietNam.model.UserPrincipal;
import TravelVietNam.request.account.AccountRequest;
import TravelVietNam.request.account.ChangePasswordRequest;
import TravelVietNam.request.account.ForwardPasswordRequest;
import TravelVietNam.service.AccountService;
import TravelVietNam.service.EmailService;
import TravelVietNam.utils.PropertiesReader;
import TravelVietNam.utils.RandomNumber;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*", maxAge = -1)
@AllArgsConstructor
public class AccountController {

    private SendEmailAccountDao sendEmailAccountDao;

    private EmailService emailService;

    private AccountService accountService;


    // api update profile
    @PostMapping("/member/update/profile")
    public ResponseEntity<?> updateAccountProfile(@ModelAttribute AccountRequest accountRequest) {

        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();

        accountService.updateProfile(accountRequest, currentUser.getId());
        return new ResponseEntity<>("Update profile success", HttpStatus.OK);
    }

    // api forward-password
    @PostMapping(Constants.UrlPath.URL_API_FORWARD_PASSWORD)
    public ResponseEntity<?> sendEmail(HttpServletRequest request,
                                       @RequestParam(name = "email", required = false, defaultValue = "") String email) throws MessagingException {

        String token = RandomNumber.getRandomNumberString();
        emailService.updateResetPasswordToken(token, email);

        String resetPassWordLink = "http://localhost:3000/forward-password";

        try {
            String content = "Hello" +
                    "<p>You have requested to reset your password </p>" +
                    "<p>Click the link below to change your password </p>" +
                    "<p><b><a href=\"" + resetPassWordLink + "\"> Change my Password </a><b></p>" +
                    "<p> Ignore this email if you do remember your password , or you have not made the request</p>" +
                    "<p>   your token  is :   \"" + token + "\"   </p>";


            emailService.sendSimpleMessage(email, PropertiesReader.getProperty(PropertyKeys.SEND_EMAIL), content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>("Send Link  Forward Password Success", HttpStatus.OK);
    }

    // api reset password
    @PostMapping(Constants.UrlPath.URL_API_Reset_PassWord)
    public ResponseEntity<?> resetPassword(HttpServletRequest request,
                                           @RequestBody ForwardPasswordRequest forwardPasswordRequest) {
        String token = forwardPasswordRequest.getToken();
        Account account = sendEmailAccountDao.findAccountByResetPasswordToken(token);
        if (Objects.isNull(account)) {
            throw new RestApiException(400, "token false");
        }
        emailService.updatePassWord(account, forwardPasswordRequest.getPassword());
        return new ResponseEntity<>("Reset Password Success", HttpStatus.OK);
    }

    // api thay đổi pass word
    @PostMapping(Constants.UrlPath.URL_API_Change_PassWord)
    public ResponseEntity<?> changePassword(@RequestBody ChangePasswordRequest changePasswordRequest) {

        accountService.changePassword(changePasswordRequest);

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    // api đăng ký tài khoản
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AccountRequest accountRequest) {
        accountService.register(accountRequest);
        return new ResponseEntity<>(" Register Success", HttpStatus.OK);
    }


}
