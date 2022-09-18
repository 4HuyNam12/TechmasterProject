package TravelVietNam.service;

import TravelVietNam.request.PostRequest;
import TravelVietNam.response.ApiResponse;
import TravelVietNam.response.post.PostResponse;

public interface PostService {

    ApiResponse searchByTitle(String title , Integer page, Integer size);

    ApiResponse searchAll();

    void add(PostRequest postRequest);

    void update(String PostId, PostRequest postRequest);

    void delete(String id);

    PostResponse getById(String id);
}
