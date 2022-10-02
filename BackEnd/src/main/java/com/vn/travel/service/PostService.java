package com.vn.travel.service;

import com.vn.travel.request.PostRequest;
import com.vn.travel.response.ApiResponse;
import com.vn.travel.response.post.PostResponse;

public interface PostService {

    ApiResponse searchByTitle(String title , Integer page, Integer size);

    ApiResponse searchAll();

    void add(PostRequest postRequest);

    void update(String PostId, PostRequest postRequest);

    void delete(String id);

    PostResponse getById(String id);
}
