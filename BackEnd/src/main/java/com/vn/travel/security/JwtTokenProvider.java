package com.vn.travel.security;

import com.vn.travel.constant.StatusCode;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.entity.account.Account;
import com.vn.travel.exception.JwtCustomException;
import com.vn.travel.repository.RoleRepository;
import com.vn.travel.repository.AccountRepository;
import com.vn.travel.response.token.TokenResponse;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Base64;
import java.util.Date;
import java.util.Optional;

@Service
public class JwtTokenProvider {

    @Value("${security.jwt.token.secret-key:secret-key}")
    private String secretKey;

    @Value("${security.jwt.token.expire-length:3600000}")
    private long validityInMilliseconds = 3600000; // 1h

    @Qualifier("accountServiceImpl")
    @Autowired
    private UserDetailsService myUserDetails;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private RoleRepository roleRepository;

    @PostConstruct
    protected void init() {
        secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
    }

    public TokenResponse createToken(String username) {
        Optional<Account> result = accountRepository.getAccountByEmail(username);

        if (result.isPresent()) {
            Account account = result.get();
            String roleName =  roleRepository.getNameById(account.getRole());
            Claims claims = Jwts.claims().setSubject(username);
            Date now = new Date();
            Date validity = new Date(now.getTime() + validityInMilliseconds);
            String accessToken = Jwts.builder()
                    .setClaims(claims)
                    .setIssuedAt(now)
                    .setExpiration(validity)
                    .signWith(SignatureAlgorithm.HS256, secretKey)
                    .compact();
            TokenResponse authenDTO = new TokenResponse();
            authenDTO.setExpirationTime(validityInMilliseconds);
            authenDTO.setAccessToken(accessToken);
            authenDTO.setAccountId(account.getId());
            authenDTO.setRoleId(account.getRole());
            authenDTO.setRoleName(roleName);
            return authenDTO;
        }
        throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
    }

    public Authentication getAuthentication(String token) {
        UserDetails userDetails = myUserDetails.loadUserByUsername(getUsername(token));
        return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
    }

    public String getUsername(String token) {
        return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
    }

    public String resolveToken(HttpServletRequest req) {
        String bearerToken = req.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    public boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
            return true;
        } catch (JwtException | IllegalArgumentException e) {
            throw new JwtCustomException("Expired or invalid JWT token", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
