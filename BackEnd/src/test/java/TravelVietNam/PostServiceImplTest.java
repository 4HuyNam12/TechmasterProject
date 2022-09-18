package TravelVietNam;

import TravelVietNam.dao.PostDAO;
import TravelVietNam.entity.post.Post;
import TravelVietNam.request.PostRequest;
import TravelVietNam.response.ApiResponse;
import TravelVietNam.response.post.PostResponse;
import TravelVietNam.service.impl.PostServiceImpl;
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
    PostDAO postDAO;

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
        Mockito.when(postDAO.findAll()).thenReturn(postList);

        List<PostResponse> postResponses = new ArrayList<>();
        postList.forEach(post -> postResponses.add(convertPostResponse(post)));
        ApiResponse response = ApiResponse.builder().data(postResponses)
                .build();

        postServiceImpl.searchAll();
    }

    @Test
    public void testAdd() {
        Mockito.when(postDAO.save(post)).thenReturn(post);
        postServiceImpl.add(postRequest);
    }

    @Test
    public void testUpdate() {
        Mockito.when(postDAO.getPostById(Mockito.anyString())).thenReturn(post);
        Mockito.when(postDAO.save(post)).thenReturn(post);
        postServiceImpl.update( "1", postRequest);
    }

    @Test
    public void testGetById() {
        Mockito.when(postDAO.getPostById(Mockito.anyString())).thenReturn(post);
        postServiceImpl.getById("1");
    }

    @Test
    public void testdelete() {
        Mockito.doNothing().when(postDAO).delete(post);
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
