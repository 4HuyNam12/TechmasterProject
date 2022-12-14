package com.vn.travel.service.impl;

import com.vn.travel.entity.account.Account;
import com.vn.travel.model.UserPrincipal;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

public class AuditorAwareImpl implements AuditorAware<Account> {

    @Override
    public Optional<Account> getCurrentAuditor() {
        if (SecurityContextHolder.getContext().getAuthentication() != null
                && !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            return Optional.of(Account.builder()
                    .id(currentUser.getId())
                    .build());
        }
        return Optional.empty();
    }

}
