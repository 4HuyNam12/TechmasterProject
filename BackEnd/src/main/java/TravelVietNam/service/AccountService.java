package TravelVietNam.service;

import TravelVietNam.request.account.AccountRequest;
import TravelVietNam.request.account.ChangePasswordRequest;
import TravelVietNam.response.ApiResponse;
import TravelVietNam.response.account.AccountResponse;

public interface AccountService {

    void register(AccountRequest accountRequest);

    void add(AccountRequest accountRequest);

    void update(AccountRequest accountRequest , String id);

    void changePassword(ChangePasswordRequest changePasswordRequest );

    void updateProfile(AccountRequest accountRequest , String id);

    void delete(String id);

    AccountResponse getById(String id);

    AccountResponse getByEmail(String  email);

    ApiResponse searchByNameEmailRole(String name , String email, String role  , Integer page, Integer size);

    void changeAccountLock(String id);

}
