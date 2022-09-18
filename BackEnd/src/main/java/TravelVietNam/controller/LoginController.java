package TravelVietNam.controller;

import TravelVietNam.constant.Constants;
import TravelVietNam.exception.JwtCustomException;
import TravelVietNam.model.UserPrincipal;
import TravelVietNam.request.account.LoginRequest;
import TravelVietNam.response.account.AccountResponse;
import TravelVietNam.response.token.TokenResponse;
import TravelVietNam.sercurity.JwtTokenProvider;
import TravelVietNam.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*", maxAge = -1)
public class LoginController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private AccountService accountService;

    // api login
    @PostMapping(Constants.UrlPath.URL_API_LOGIN)
    public TokenResponse login(@RequestBody LoginRequest request) {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword()));
            return jwtTokenProvider.createToken(request.getUsername());
        } catch (AuthenticationException e) {
            throw new JwtCustomException("Invalid username/password supplied", HttpStatus.UNPROCESSABLE_ENTITY);
        }
    }
// api get profile
    @GetMapping(Constants.UrlPath.URL_API_PROFILE)
    public ResponseEntity<?> getAccount() {
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();

        AccountResponse accountResponse  = accountService.getById(currentUser.getId());
        return new ResponseEntity<>(accountResponse, HttpStatus.OK);
    }
}
