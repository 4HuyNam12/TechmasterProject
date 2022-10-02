package com.vn.travel.controller;

import com.vn.travel.constant.Constants;
import com.vn.travel.exception.JwtCustomException;
import com.vn.travel.model.UserPrincipal;
import com.vn.travel.request.account.LoginRequest;
import com.vn.travel.response.account.AccountResponse;
import com.vn.travel.response.token.TokenResponse;
import com.vn.travel.security.JwtTokenProvider;
import com.vn.travel.service.AccountService;
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
