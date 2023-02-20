package com.vn.travel.service.impl;

import com.vn.travel.constant.Constants;
import com.vn.travel.constant.RoleEnum;
import com.vn.travel.constant.StatusCode;
import com.vn.travel.entity.account.Account;
import com.vn.travel.entity.account.Role;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.model.UserPrincipal;
import com.vn.travel.repository.AccountRepository;
import com.vn.travel.repository.RoleRepository;
import com.vn.travel.request.account.AccountRequest;
import com.vn.travel.request.account.ChangePasswordRequest;
import com.vn.travel.response.ApiResponse;
import com.vn.travel.response.account.AccountResponse;
import com.vn.travel.service.AccountService;
import com.vn.travel.service.EmailService;
import com.vn.travel.utils.FileStore;
import com.vn.travel.utils.PasswordGenerator;
import com.vn.travel.utils.ValidateUtil;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.*;

@Transactional
@Service
@Log4j2
@AllArgsConstructor
public class AccountServiceImpl implements AccountService, UserDetailsService {

    private AccountRepository accountRepository;

    private EmailService emailService;

    private RoleRepository roleRepository;

    @Override
    public void add(AccountRequest request) {
        if (Objects.isNull(request) || StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getDob()) || StringUtils.isEmpty(request.getPhone())) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }

        Optional<Account> response = accountRepository.getAccountByEmail(request.getEmail());
        if (!response.isPresent()) {
            if (!ValidateUtil.isEmail(request.getEmail())) {
                throw new RestApiException(StatusCode.EMAIL_NOT_RIGHT_FORMAT);
            }
            if (!ValidateUtil.isPhoneNumber(request.getPhone())) {
                throw new RestApiException(StatusCode.PHONE_NUMBER_NOT_RIGHT_FORMAT);
            }

            Account account = new Account();
            account.setEmail(request.getEmail());
            account.setDob(request.getDob());
            account.setEnabled(true);
            account.setImage(FileStore.getDefaultAvatar());
            account.setPassword(PasswordGenerator.getHashString("123@123aB"));
            account.setPhone(request.getPhone());
            account.setRole(request.getRoleId());
            account.setName(request.getName());
            account.setGender(request.getGender());
            accountRepository.save(account);

            //send mail
            sendMail(request.getEmail());
        } else {
            throw new RestApiException(StatusCode.ACCOUNT_REGISTER);
        }

    }

    @Override
    public void register(AccountRequest request) {
        if (Objects.isNull(request) || StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getDob()) || StringUtils.isEmpty(request.getPhone())) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        Optional<Account> response = accountRepository.getAccountByEmail(request.getEmail());
        if (!response.isPresent()) {
            if (!ValidateUtil.isEmail(request.getEmail())) {
                throw new RestApiException(StatusCode.EMAIL_NOT_RIGHT_FORMAT);
            }
            if (!ValidateUtil.isPhoneNumber(request.getPhone())) {
                throw new RestApiException(StatusCode.PHONE_NUMBER_NOT_RIGHT_FORMAT);
            }

            Account account = new Account();
            account.setEmail(request.getEmail());
            account.setDob(request.getDob());
            account.setEnabled(true);
            account.setImage(FileStore.getDefaultAvatar());
            account.setPassword(PasswordGenerator.getHashString(request.getPassword()));
            account.setPhone(request.getPhone());
            account.setRole(5L);
            account.setName(request.getName());
            account.setGender(request.getGender());
            accountRepository.save(account);
        } else {
            throw new RestApiException(StatusCode.ACCOUNT_REGISTER);
        }
    }


    private void sendMail(String email) {
        try {
            StringBuilder content = new StringBuilder();
            content.append("Xin Chào");
            content.append("<p> tài khoản của bạn là  \"" + email + "\"   </p>");
            content.append("<p>mật khẩu của bạn là : 123@123aB  </p>");
            content.append("<p>Yêu Cầu bạn đổi mật khẩu khi đăng nhập vào hệ thống  </p>");

            String subject = "com.vn.travel ---THÔNG TIN TÀI KHOẢN";
            emailService.sendSimpleMessage(email, subject, content.toString());
        } catch (Exception e) {
            log.debug(e);
        }
    }

    @Override
    public void update(AccountRequest request, String id) {
        if (Objects.isNull(request) || StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getDob()) || StringUtils.isEmpty(request.getPhone())) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        if (!ValidateUtil.isEmail(request.getEmail())) {
            throw new RestApiException(StatusCode.EMAIL_NOT_RIGHT_FORMAT);
        }
        if (!ValidateUtil.isPhoneNumber(request.getPhone())) {
            throw new RestApiException(StatusCode.PHONE_NUMBER_NOT_RIGHT_FORMAT);
        }
        Optional<Account> result = accountRepository.getAccountById(id);
        if (result.isPresent()) {
            Account account = result.get();
            String roleName = roleRepository.getNameById(request.getRoleId());
            account.setEmail(request.getEmail());
            account.setDob(request.getDob());
            account.setPhone(request.getPhone());
            if (account.getRole() != null) {
                account.setRole(request.getRoleId());
            }
            account.setName(request.getName());
            account.setGender(request.getGender());
            accountRepository.save(account);
        } else {
            throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
        }

    }

    @Override
    public void changePassword(ChangePasswordRequest changePasswordRequest) {

        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();

        Optional<Account> result = accountRepository.getAccountById(currentUser.getId());

        if (result.isPresent()) {
            Account account = result.get();
            if (ValidateUtil.isPassword(changePasswordRequest.getNewPassword())) {
                if (PasswordGenerator.checkHashStrings(changePasswordRequest.getPassword(), account.getPassword())) {
                    if (PasswordGenerator.checkHashStrings(changePasswordRequest.getNewPassword(), account.getPassword())) {
                        throw new RestApiException(1, "Mật Khẩu Mới Trùng Mật Khẩu Cũ");
                    }
                    account.setPassword(PasswordGenerator.getHashString(changePasswordRequest.getNewPassword()));
                    accountRepository.save(account);
                } else {
                    throw new RestApiException(1, "wrong password");
                }
                accountRepository.save(account);
            } else {
                throw new RestApiException(1, "Mật Khẩu Không Đúng Định Dạng");
            }

        }
    }


    @Override
    public void updateProfile(AccountRequest request, String id) {
        if (Objects.isNull(request) || StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getDob())
                || StringUtils.isEmpty(request.getPhone()) || StringUtils.isEmpty(request.getName())) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }

        if (!ValidateUtil.isEmail(request.getEmail())) {
            throw new RestApiException(StatusCode.EMAIL_NOT_RIGHT_FORMAT);
        }
        if (!ValidateUtil.isPhoneNumber(request.getPhone())) {
            throw new RestApiException(StatusCode.PHONE_NUMBER_NOT_RIGHT_FORMAT);
        }
        Optional<Account> result = accountRepository.getAccountById(id);
        if (result.isPresent()) {
            Account account = result.get();
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
            accountRepository.save(account);
        } else {
            throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
        }


    }

    @Override
    public void delete(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        accountRepository.deleteAllById(id);
    }


    @Override
    public ApiResponse searchByNameEmailRole(String name, String email, String role, Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);

        List<String> roles;
        if (role.isEmpty()) {
            roles = Arrays.asList(RoleEnum.ROLE_ADMIN.name(), RoleEnum.ROLE_PARTNER.name(),
                    RoleEnum.ROLE_MEMBER.name(), RoleEnum.ROLE_EMPLOYEE.name(), RoleEnum.ROLE_CONTENT.name());
        } else {
            roles = Collections.singletonList(role);
        }


        Long totalPage = accountRepository.countAccountByNameAndEmailAndRole(name, email, roles);
        Page<Account> accounts = accountRepository.searchAccountByNameEmailRole(name, email, roles, pageable);

        List<AccountResponse> accountResponses = new ArrayList<>();
        accounts.forEach(account -> accountResponses.add(convert(account)));

        return ApiResponse.builder().data(accountResponses).totalElement(totalPage)
                .build();
    }

    @Override
    public AccountResponse getById(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        Optional<Account> result = accountRepository.getAccountById(id);
        if (result.isPresent()) {
            Account account = result.get();
            return convert(account);
        }
        throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
    }

    @Override
    public AccountResponse getByEmail(String email) {
        if (StringUtils.isEmpty(email)) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        Optional<Account> result = accountRepository.getAccountByEmail(email);
        if (result.isPresent()) {
            Account account = result.get();
            return convert(account);
        }
        throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);

    }

    @Override
    public void changeAccountLock(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        Optional<Account> result = accountRepository.getAccountById(id);
        if (result.isPresent()) {
            Account account = result.get();
            account.setEnabled(!account.getEnabled());
            accountRepository.save(account);
        } else {
            throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
        }

    }


    public AccountResponse convert(Account account) {
        AccountResponse accountResponse = AccountResponse.builder().build();
        String roleName = roleRepository.getNameById(account.getRole());

        accountResponse.setId(account.getId());
        accountResponse.setDob(account.getDob());
        accountResponse.setEmail(account.getEmail());
        accountResponse.setImage(account.getImage());
        accountResponse.setRoleId(account.getRole());
        accountResponse.setRoleName(roleName);
        accountResponse.setName(account.getName());

        String gender;
        if (account.getGender()) {
            gender = Constants.AccountGender.GENDER_MALE;
        } else {
            gender = Constants.AccountGender.GENDER_FEMALE;
        }
        accountResponse.setGender(gender);
        accountResponse.setPhone(account.getPhone());
        accountResponse.setPassword(account.getPassword());
        accountResponse.setEnabled(account.getEnabled());
        return accountResponse;
    }


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Account> response = accountRepository.getAccountByEmail(email);
        if (response.isPresent()) {
            Account account = response.get();
            String roleName = roleRepository.getNameById(account.getRole());
            List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority(roleName));
            UserPrincipal accountDTO = new UserPrincipal(account.getEmail(), account.getPassword(), account.getEnabled(), true, true,
                    true, authorities);
            accountDTO.setId(account.getId());
            accountDTO.setName(account.getName());
            accountDTO.setRoleId(account.getRole());
            return accountDTO;
        }
        throw new UsernameNotFoundException("not found");
    }
}
