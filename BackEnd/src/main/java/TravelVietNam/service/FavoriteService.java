package TravelVietNam.service;


import TravelVietNam.common.FavoriteType;
import TravelVietNam.exception.GeneralException;
import TravelVietNam.model.FavoriteDTO;
import TravelVietNam.response.BaseResponse;

public interface FavoriteService {

    BaseResponse addFavorite(FavoriteDTO favoriteDTO) throws GeneralException;

    BaseResponse getListFavoriteByUserId(Integer page, Integer perPage) throws GeneralException;

    BaseResponse removeFavorBySlug(String activitySlug, FavoriteType type) throws GeneralException;

}
