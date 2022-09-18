package TravelVietNam;


import TravelVietNam.model.UserPrincipal;
import TravelVietNam.utils.AuthenticationUtils;
import TravelVietNam.entity.account.Account;
import TravelVietNam.service.impl.AuditorAwareImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class AuditorAwareImplTest {


    @InjectMocks
    AuditorAwareImpl  auditorAwareImpl;


    @Test
    public void testGetCurrentAuditor() {
        if (SecurityContextHolder.getContext().getAuthentication() != null
                && !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
             Optional.of(Account.builder()
                    .id(currentUser.getId())
                    .build());
        }
         Optional.ofNullable(null);

        auditorAwareImpl.getCurrentAuditor();

        }





//    @Override
//    public Optional<Account> getCurrentAuditor() {
//        if (SecurityContextHolder.getContext().getAuthentication() != null
//                && !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
//            UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
//                    .getPrincipal();
//            return Optional.of(Account.builder()
//                    .id(currentUser.getId())
//                    .build());
//        }
//        return Optional.ofNullable(null);
//    }
}
