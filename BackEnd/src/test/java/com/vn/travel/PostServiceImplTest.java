package com.vn.travel;

import com.vn.travel.entity.post.Post;
import com.vn.travel.repository.PostRepository;
import com.vn.travel.request.PostRequest;
import com.vn.travel.response.ApiResponse;
import com.vn.travel.response.post.PostResponse;
import com.vn.travel.service.impl.PostServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RunWith(PowerMockRunner.class)
public class PostServiceImplTest {


    @Mock
    PostRepository postRepository;

    @InjectMocks
    PostServiceImpl postServiceImpl;


    Post post = Post.builder()
            .id("1")
            .image("aaaaaaa.jpg")
            .title("aaa")
            .content("??p")
            .build();

    PostRequest postRequest = PostRequest.builder()
            .content("aaaaaaaa")
            .id(1L)
            .title("12")
            .build();

    List<Post> postList = Arrays.asList(post);

    @Test
    public void testSearchAll() {
        Mockito.when(postRepository.findAll()).thenReturn(postList);

        List<PostResponse> postResponses = new ArrayList<>();
        postList.forEach(post -> postResponses.add(convertPostResponse(post)));
        ApiResponse response = ApiResponse.builder().data(postResponses)
                .build();

        postServiceImpl.searchAll();
    }

    @Test
    public void testAdd() {
        Mockito.when(postRepository.save(post)).thenReturn(post);
        postServiceImpl.add(postRequest);
    }

    @Test
    public void testUpdate() {
        Mockito.when(postRepository.getPostById(Mockito.anyString())).thenReturn(java.util.Optional.ofNullable(post));
        Mockito.when(postRepository.save(post)).thenReturn(post);
        postServiceImpl.update( "1", postRequest);
    }

    @Test
    public void testGetById() {
        Mockito.when(postRepository.getPostById(Mockito.anyString())).thenReturn(java.util.Optional.ofNullable(post));
        postServiceImpl.getById("1");
    }

    @Test
    public void testdelete() {
        Mockito.doNothing().when(postRepository).delete(post);
        postServiceImpl.delete("1");


    }


    private PostResponse convertPostResponse(Post post) {
        PostResponse response = PostResponse.builder().build();
//        response.setContent(post.getContent());
        response.setImage(post.getImage());
        response.setTitle(post.getTitle());
        response.setId(post.getId());
        return response;
    }
}
