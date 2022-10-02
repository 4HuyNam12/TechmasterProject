package com.vn.travel;


import com.vn.travel.common.FavoriteType;
import com.vn.travel.model.FavoriteDTO;
import com.vn.travel.utils.AuthenticationUtils;
import com.vn.travel.entity.Favorite;
import com.vn.travel.exception.GeneralException;
import com.vn.travel.repository.FavoriteRepository;
import com.vn.travel.service.impl.FavoriteServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class FavoriteServiceImplTest {

    @InjectMocks
    FavoriteServiceImpl favoriteServiceImpl;

    @Mock
    FavoriteRepository favoriteRepository;


    @Test
    public void testAddFavorite() throws GeneralException {

        String userId = "2";
        PowerMockito.mockStatic(AuthenticationUtils.class);

        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        FavoriteDTO favoriteDTO = FavoriteDTO.builder()
                .imageUrl("abc.jpg")
                .slug("slug-abc")
                .type(FavoriteType.valueOf("HOTEL"))
                .title("oki")
                .build();

        Favorite favorite = Favorite.builder()
                .userId(userId)
                .imageUrl(favoriteDTO.getImageUrl())
                .slug("ssss")
                .title(favoriteDTO.getTitle())
                .type(favoriteDTO.getType())
                .build();

        List<Favorite> listUserFavor = Arrays.asList(favorite);

        Mockito.when(favoriteRepository.findAllByUserId(Mockito.anyString())).thenReturn(listUserFavor);

        Mockito.when(favoriteRepository.save(favorite)).thenReturn(favorite);

        favoriteServiceImpl.addFavorite(favoriteDTO);


    }


    @Test
    public void removeFavorBySlug() {

        String userId = "1";
        PowerMockito.mockStatic(AuthenticationUtils.class);

        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        FavoriteDTO favoriteDTO = FavoriteDTO.builder()
                .imageUrl("abc.jpg")
                .slug("slug-abc")
                .type(FavoriteType.valueOf("HOTEL"))
                .title("oki")
                .build();

        Favorite favorite = Favorite.builder()
                .userId(userId)
                .imageUrl(favoriteDTO.getImageUrl())
                .slug(favoriteDTO.getSlug())
                .title(favoriteDTO.getTitle())
                .type(favoriteDTO.getType())
                .build();

        Mockito.when(favoriteRepository.findByUserIdAndSlug(Mockito.anyString(), Mockito.anyString()))
                .thenReturn(Optional.ofNullable(favorite));

        Mockito.doNothing().when(favoriteRepository).delete(favorite);

    }



}
