package TravelVietNam;

import TravelVietNam.common.FavoriteType;
import TravelVietNam.model.FavoriteDTO;
import TravelVietNam.utils.AuthenticationUtils;
import TravelVietNam.entity.Favorite;
import TravelVietNam.repository.FavoriteRepository;
import TravelVietNam.service.impl.HelperService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.Optional;

@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class HelperServiceImplTest {

    @Mock
    FavoriteRepository favoriteRepository;

    @InjectMocks
    HelperService helperService;

    @Test
    public void checkFavorite() {

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

         Mockito.when(favoriteRepository.findByUserIdAndSlug(userId , "aaaaa")).thenReturn(Optional.ofNullable(favorite));

        helperService.checkFavorite("aaaaa");
    }


}
