package com.vn.travel;

import com.vn.travel.common.ActivitiesType;
import com.vn.travel.common.SQLQueryParam;
import com.vn.travel.common.type.ApproveStatus;
import com.vn.travel.utils.MappingUtils;
import com.vn.travel.entity.activities.Activities;
import com.vn.travel.entity.activities.ActivitiesGame;
import com.vn.travel.entity.activities.ActivitiesImage;
import com.vn.travel.repository.FavoriteRepository;
import com.vn.travel.repository.activities.ActivitiesGameRepository;
import com.vn.travel.repository.activities.ActivitiesImageRepository;
import com.vn.travel.repository.activities.ActivitiesRepository;
import com.vn.travel.request.FilterRequest;
import com.vn.travel.request.SearchRequest;
import com.vn.travel.request.activities.FilterRequestActivities;
import com.vn.travel.response.activities.ActivitiesDTO;
import com.vn.travel.response.activities.ActivitiesGameDTO;
import com.vn.travel.service.impl.ActivitiesSearchServiceImpl;
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
