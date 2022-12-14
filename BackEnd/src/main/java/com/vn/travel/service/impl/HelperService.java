package com.vn.travel.service.impl;

import com.vn.travel.repository.FavoriteRepository;
import com.vn.travel.utils.AuthenticationUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
@Log4j2
public class HelperService {

    private FavoriteRepository favoriteRepository;

    public boolean checkFavorite(String slug) {
        String userId = AuthenticationUtils.getUserId();
        if (userId != null) {
            return favoriteRepository.findByUserIdAndSlug(userId, slug).isPresent();
        }
        return false;
    }

}
