package com.vn.travel.controller;

import com.vn.travel.common.FavoriteType;
import com.vn.travel.exception.GeneralException;
import com.vn.travel.model.FavoriteDTO;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.service.FavoriteService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/favorite")
@AllArgsConstructor
public class FavoriteController {

    private final FavoriteService favoriteService;

    //api trả về list yêu thích
    @GetMapping("/list")
    public BaseResponse getListUserFavorite(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                            @RequestParam(value = "per_page", required = false, defaultValue = "15") Integer perPage) throws GeneralException {
        return this.favoriteService.getListFavoriteByUserId(page, perPage);
    }
    //api thêm yêu thích
    @PostMapping("/add")
    public BaseResponse addFavoriteActivity(@RequestBody() FavoriteDTO requestBody) throws GeneralException {
        return this.favoriteService.addFavorite(requestBody);
    }

    // xóa yêu thích
    @GetMapping("/delete")
    public BaseResponse removeFavoriteActivity(@RequestParam("slug") String slug,
                                               @RequestParam(value = "type", required = false) FavoriteType type) throws GeneralException {
        return this.favoriteService.removeFavorBySlug(slug, type);
    }


}
