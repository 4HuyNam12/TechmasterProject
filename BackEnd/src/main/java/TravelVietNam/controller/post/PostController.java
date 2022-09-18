package TravelVietNam.controller.post;


import TravelVietNam.request.PostRequest;
import TravelVietNam.response.ApiResponse;
import TravelVietNam.response.post.PostResponse;
import TravelVietNam.service.PostService;
import TravelVietNam.utils.FileStore;
import TravelVietNam.utils.HelperUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*", maxAge = -1)
@Log4j2
@AllArgsConstructor
public class PostController {

    private PostService postService;

    // trả về list bởi customer
    @GetMapping("/customer/post/search")
    public ResponseEntity<?> searchPost(@RequestParam(name = "page", required = false, defaultValue = "0") Integer pageNo,
                                        @RequestParam(name = "title", required = false, defaultValue = "") String title) {
        log.debug("searchEmployee request : " + title);
        Integer pageSize = 5;

        title = HelperUtils.unAccent(title);

        ApiResponse apiResponse = postService.searchByTitle(title.trim(), pageNo, pageSize);
        ResponseEntity<ApiResponse> response = new ResponseEntity<>(apiResponse, HttpStatus.OK);

        log.debug("searchPost response : " + title);
        return response;
    }

    // trả về list tất cả post
    @GetMapping("/customer/post/search/all")
    public ResponseEntity<?> searchPostAll() {
        ApiResponse apiResponse = postService.searchAll();
        return new ResponseEntity<>(apiResponse, HttpStatus.OK);
    }

    // thêm bài viết
    @PostMapping("/content/post/add")
    public ResponseEntity<?> addPost(@ModelAttribute PostRequest postRequest) {
        postRequest.setImage(FileStore.getFilePath(postRequest.getMultipartFile(), "-post"));
        postService.add(postRequest);
        return new ResponseEntity<>("Add post thành công", HttpStatus.OK);
    }

    // update bài viết
    @PutMapping("/content/post/update")
    public ResponseEntity<?> updatePost(@ModelAttribute PostRequest postRequest,
                                        @RequestParam(name = "postId") String postId) {
        postRequest.setImage(FileStore.getFilePath(postRequest.getMultipartFile(), "-post"));
        postService.update(postId, postRequest);
        return new ResponseEntity<>("update post thành công", HttpStatus.OK);
    }

    // get detail bài viết
    @GetMapping("/customer/post/detail")
    public ResponseEntity<?> updatePost(
            @RequestParam(name = "postId") String postId) {
        PostResponse postResponse = postService.getById(postId);
        return new ResponseEntity<>(postResponse, HttpStatus.OK);
    }

    // delete  bài viết
    @DeleteMapping("/content/post/delete")
    public ResponseEntity<?> deletePost(@RequestParam(name = "postId") String postId) {
        postService.delete(postId);
        return new ResponseEntity<>("delete post thành công", HttpStatus.OK);
    }
}
