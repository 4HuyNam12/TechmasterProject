package com.vn.travel.service.impl;

import com.vn.travel.constant.StatusCode;
import com.vn.travel.entity.post.Post;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.repository.PostRepository;
import com.vn.travel.request.PostRequest;
import com.vn.travel.response.ApiResponse;
import com.vn.travel.response.post.PostResponse;
import com.vn.travel.service.PostService;
import com.vn.travel.utils.FileStore;
import com.vn.travel.utils.HelperUtils;
import com.vn.travel.utils.MappingUtils;
import lombok.AllArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Transactional
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {

    private PostRepository postRepository;

    // trả về list danh sách bài viết
//    @Override
    public ApiResponse searchByTitle(String title, Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        List<PostResponse> postResponses;
        if (StringUtils.isBlank(title)) {
            List<Post> posts = postRepository.findAllByOrderByCreatedAtDesc(pageable);
            postResponses = MappingUtils.map(posts, PostResponse.class);

        } else {
            title = "%" + title + "%";
            List<Post> posts = postRepository.searchByTitle(title.toLowerCase(), pageable);
            postResponses = MappingUtils.map(posts, PostResponse.class);
        }
        title = HelperUtils.unAccent(title);
        Long totalPage = postRepository.countAllByContent(title);

        Map<String, PostResponse> mapPost = postResponses.stream().collect(Collectors.toMap(PostResponse::getId, Function.identity()));

        return ApiResponse.builder().data(mapPost).totalElement(totalPage)
                .build();
    }

    //    @Override
    public ApiResponse searchAll() {
        List<Post> postList = postRepository.findAll();
        List<PostResponse> postResponses = MappingUtils.map(postList, PostResponse.class);

        return ApiResponse.builder().data(postResponses)
                .build();
    }

    //  thêm bài viết
//    @Override
    public void add(PostRequest postRequest) {
        Post post = new Post();
        post.setContent(postRequest.getContent());
        post.setImage(postRequest.getImage());
        post.setTitle(postRequest.getTitle());
        postRepository.save(post);
    }

    //  update bài viết
    @Override
    public void update(String postId, PostRequest postRequest) {

        Optional<Post> postOptional = postRepository.getPostById(postId);
        if (postOptional.isPresent()) {
            Post post = postOptional.get();
            String image1 = FileStore.getFilePath(postRequest.getMultipartFile(), "-user");
            if (image1 != null) {
                postRequest.setImage(image1);
            }

            if (postRequest.getTitle() != null) post.setTitle(postRequest.getTitle());
            if (postRequest.getContent() != null) post.setContent(postRequest.getContent());
            if (image1 != null) {
                if (post.getImage() != null) {
                    String image = post.getImage();
                    FileStore.deleteFile(image);
                }
                post.setImage(postRequest.getImage());
            }
            postRepository.save(post);
            return;
        }

        throw new RestApiException(StatusCode.POST_NOT_EXIST);
    }

    //xóa bài viết
    @Override
    public void delete(String postId) {
        if (StringUtils.isEmpty(postId)) {
            throw new RestApiException(StatusCode.DATA_EMPTY);
        }
        postRepository.deleteAllById(postId);
    }

    // trả về 1 bài viết theo id
    @Override
    public PostResponse getById(String postId) {
        Optional<Post> postOptional = postRepository.getPostById(postId);
        if (postOptional.isPresent()) {
            Post post = postOptional.get();
            return MappingUtils.map(post, PostResponse.class);
        }
        throw new RestApiException(StatusCode.DATA_EMPTY);
    }

}
