package TravelVietNam;

import TravelVietNam.common.ActivitiesType;
import TravelVietNam.common.SQLQueryParam;
import TravelVietNam.common.type.ApproveStatus;
import TravelVietNam.utils.MappingUtils;
import TravelVietNam.entity.activities.Activities;
import TravelVietNam.entity.activities.ActivitiesGame;
import TravelVietNam.entity.activities.ActivitiesImage;
import TravelVietNam.repository.FavoriteRepository;
import TravelVietNam.repository.activities.ActivitiesGameRepository;
import TravelVietNam.repository.activities.ActivitiesImageRepository;
import TravelVietNam.repository.activities.ActivitiesRepository;
import TravelVietNam.request.FilterRequest;
import TravelVietNam.request.SearchRequest;
import TravelVietNam.request.activities.FilterRequestActivities;
import TravelVietNam.response.activities.ActivitiesDTO;
import TravelVietNam.response.activities.ActivitiesGameDTO;
import TravelVietNam.service.impl.ActivitiesSearchServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.data.domain.PageRequest;

import javax.persistence.EntityManager;
import java.util.*;
import java.util.stream.Collectors;

@RunWith(PowerMockRunner.class)
public class ActivitiesSearchServiceImplTest {
    @InjectMocks
    ActivitiesSearchServiceImpl activitiesSearchService;

    @Mock
    ActivitiesRepository activitiesRepository;
    @Mock
    EntityManager entityManager;
    @Mock
    ActivitiesGameRepository activitiesGameRepository;
    @Mock
    ActivitiesImageRepository activitiesImageRepository;
    @Mock
    FavoriteRepository favoriteRepository;


    @Test
    public void testSearchFilter() {

        Activities activities = Activities.builder()
                .id("1")
                .activitiesType(ActivitiesType.IN_DOOR)
                .address("hanoi")
                .adultTicketPrice(1000D)
                .childTicketPrice(2000D)
                .approveStatus(ApproveStatus.APPROVED)
                .code("AC-CODE1")
                .description("vui")
                .userId("1")
                .duration(1)
                .build();

        ActivitiesImage activitiesImage = ActivitiesImage.builder()
                .activitiesCode("AC-CODE1")
                .caption("anh ??p")
                .url("aaaaaaaaaaaaaaaa")
                .id(1)
                .build();

        ActivitiesGame activitiesGame = ActivitiesGame.builder()
                .activitiesCode("AC-CODE1")
                .description("hay")
                .id(1)
                .name("xinh du")
                .image("111111111111.jpg")
                .build();


        List<Activities> activitiesList = Collections.singletonList(activities);
        List<ActivitiesImage> activitiesImageList = Collections.singletonList(activitiesImage);
        List<ActivitiesGame> activitiesGameList = Collections.singletonList(activitiesGame);

        List<ActivitiesDTO> activitiesDTOS = MappingUtils.map(activitiesList, ActivitiesDTO.class);

        Map<String, Object> sqlParams = new HashMap<>();

        SQLQueryParam productCodeRequest = SQLQueryParam.builder()
                .sql("select * from activities order by created_at")
                .params(sqlParams)
                .build();

        FilterRequestActivities filterRequestActivities =FilterRequestActivities.builder()
                .type("IN_DOOR")
                .build();

        SearchRequest searchRequest = SearchRequest.builder()
                .page(1)
                .perPage(15)
                .q("ha noi")
                .build();

        FilterRequest filterRequest = null;


        List<String> productCodes = Collections.singletonList("AC-CODE1");


        Mockito.when(activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes, PageRequest.of(searchRequest.getPage() - 1, searchRequest.getPerPage()))).thenReturn(activitiesList);

        Mockito.when(activitiesRepository.findByCodeInOrderByCreatedAtDesc(productCodes, PageRequest.of(searchRequest.getPage() - 1, searchRequest.getPerPage()))).thenReturn(activitiesList);

        Mockito.when(activitiesImageRepository.findUniqueImage(productCodes)).thenReturn(activitiesImageList);

        Mockito.when(activitiesGameRepository.findAllByActivitiesCodeIn(activitiesDTOS.stream().map(ActivitiesDTO::getCode).collect(Collectors.toList()))).thenReturn(activitiesGameList);

        Map<String, String> mapImage = activitiesImageList.stream().collect(Collectors.toMap(ActivitiesImage::getActivitiesCode, ActivitiesImage::getUrl));

        Map<String, List<ActivitiesGameDTO>> gameMaps = new HashMap<>();
        activitiesGameList.forEach(activitiesGame1 -> {
            ActivitiesGameDTO gameDTO = MappingUtils.map(activitiesGame1, ActivitiesGameDTO.class);
            if (gameMaps.get(activitiesGame1.getActivitiesCode()) == null || gameMaps.get(activitiesGame1.getActivitiesCode()).isEmpty()) {
                List<ActivitiesGameDTO> dtoList = new ArrayList<>();
                dtoList.add(gameDTO);
                gameMaps.put(activitiesGame1.getActivitiesCode(), dtoList);
            } else {
                List<ActivitiesGameDTO> dtoList = gameMaps.get(activitiesGame1.getActivitiesCode());
                dtoList.add(gameDTO);
                gameMaps.put(activitiesGame.getActivitiesCode(), dtoList);
            }
        });

        activitiesDTOS.forEach(activities1 -> {
            String imageUrl = mapImage.get(activities1.getCode());
            if (imageUrl != null) {
                activities1.setImage(imageUrl);
            }
            activities1.setActivitiesGameDTOS(gameMaps.get(activities.getCode()));
        });


    }




}
