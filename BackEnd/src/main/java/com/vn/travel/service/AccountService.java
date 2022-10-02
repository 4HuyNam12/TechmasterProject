package com.vn.travel.service;

import com.vn.travel.request.account.AccountRequest;
import com.vn.travel.request.account.ChangePasswordRequest;
import com.vn.travel.response.ApiResponse;
import com.vn.travel.response.account.AccountResponse;

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
