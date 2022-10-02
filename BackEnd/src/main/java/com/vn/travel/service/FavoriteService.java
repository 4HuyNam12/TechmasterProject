package com.vn.travel.service;


import com.vn.travel.common.FavoriteType;
import com.vn.travel.exception.GeneralException;
import com.vn.travel.model.FavoriteDTO;
import com.vn.travel.response.BaseResponse;

public interface FavoriteService {

    BaseResponse addFavorite(FavoriteDTO favoriteDTO) throws GeneralException;

    BaseResponse getListFavoriteByUserId(Integer page, Integer perPage) throws GeneralException;

    BaseResponse removeFavorBySlug(String activitySlug, FavoriteType type) throws GeneralException;

}
