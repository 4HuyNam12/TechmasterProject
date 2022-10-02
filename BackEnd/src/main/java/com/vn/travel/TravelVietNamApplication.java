package com.vn.travel;

import com.vn.travel.constant.RoleEnum;
import com.vn.travel.entity.account.Account;
import com.vn.travel.security.JwtTokenFilter;
import com.vn.travel.security.JwtTokenProvider;
import com.vn.travel.service.impl.AuditorAwareImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.Arrays;
import java.util.Collections;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
@EnableJpaRepositories
@EnableAsync
public class TravelVietNamApplication extends WebMvcConfigurationSupport {

    public static void main(String[] args) {
        SpringApplication.run(TravelVietNamApplication.class, args);
    }

    @Qualifier("accountServiceImpl")
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(12);
    }

    @Order(1)
    @Configuration
    public class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {
        @Bean
        @Override
        public AuthenticationManager authenticationManagerBean() throws Exception {
            return super.authenticationManagerBean();
        }

        @Override
        @Order(1)
        protected void configure(HttpSecurity http) throws Exception {
            http.cors().and().csrf().disable();
            http.authorizeRequests()
                    .antMatchers("/api/admin/**")
                    .hasAnyAuthority(RoleEnum.ROLE_ADMIN.name())
                    .antMatchers("/api/partner/**")
                    .hasAnyAuthority(RoleEnum.ROLE_ADMIN.name(), RoleEnum.ROLE_PARTNER.name())
                    .antMatchers("/api/employee/**")
                    .hasAnyAuthority(RoleEnum.ROLE_ADMIN.name(), RoleEnum.ROLE_EMPLOYEE.name())
                    .antMatchers("/api/member/**", "hotel/book", "/favorite/**")
                    .hasAnyAuthority(RoleEnum.ROLE_ADMIN.name(), RoleEnum.ROLE_CONTENT.name(), RoleEnum.ROLE_PARTNER.name(), RoleEnum.ROLE_MEMBER.name(), RoleEnum.ROLE_EMPLOYEE.name());
            http.addFilterBefore(new JwtTokenFilter(jwtTokenProvider), UsernamePasswordAuthenticationFilter.class);
        }
    }

    @Order(2)
    @Configuration
    public static class PrivateApiSecurityConfiguration extends WebSecurityConfigurerAdapter {
        @Override
        @Order(2)
        protected void configure(HttpSecurity http) throws Exception {
            http.requestMatchers()
                    .and()
                    .csrf()
                    .disable()
                    .authorizeRequests()
                    .antMatchers("/api/customer/**", "/api/login")
                    .permitAll()
                    .anyRequest()
                    .authenticated();

        }
    }

    @Bean
    public AuditorAware<Account> auditorAware() {
        return new AuditorAwareImpl();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Collections.singletonList("*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("authorization", "content-type", "x-auth-token"));
        configuration.setExposedHeaders(Collections.singletonList("x-auth-token"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
