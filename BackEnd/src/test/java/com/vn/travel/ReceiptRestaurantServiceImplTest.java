package com.vn.travel;

import com.vn.travel.common.RestaurantType;
import com.vn.travel.common.type.ApproveStatus;
import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.repository.AccountRepository;
import com.vn.travel.utils.AuthenticationUtils;
import com.vn.travel.utils.HelperUtils;
import com.vn.travel.utils.MappingUtils;
import com.vn.travel.entity.BookingContact;
import com.vn.travel.entity.account.Account;
import com.vn.travel.entity.account.Role;
import com.vn.travel.entity.restaurant.Restaurant;
import com.vn.travel.entity.restaurant.RestaurantBookingReceipt;
import com.vn.travel.entity.restaurant.RestaurantMenu;
import com.vn.travel.model.Contact;
import com.vn.travel.repository.FavoriteRepository;
import com.vn.travel.repository.restaurant.RestaurantBookingReceiptRepository;
import com.vn.travel.repository.restaurant.RestaurantImageRepository;
import com.vn.travel.repository.restaurant.RestaurantMenuRepository;
import com.vn.travel.repository.restaurant.RestaurantRepository;
import com.vn.travel.request.restaurant.BookingRestaurantRequest;
import com.vn.travel.request.restaurant.RestaurantApproveBookingRequest;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.response.restaurant.RestaurantBookingReceiptDTO;
import com.vn.travel.response.restaurant.RestaurantInfoDTO;
import com.vn.travel.response.restaurant.RestaurantMenuDTO;
import com.vn.travel.service.EmailService;
import com.vn.travel.service.impl.restaurant.ReceiptRestaurantServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.data.domain.PageRequest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class ReceiptRestaurantServiceImplTest {
    @Mock
    RestaurantRepository restaurantRepository;
    @Mock
    RestaurantImageRepository restaurantImageRepository;
    @Mock
    RestaurantMenuRepository restaurantMenuRepository;
    @Mock
    RestaurantBookingReceiptRepository restaurantBookingReceiptRepository;
    @Mock
    FavoriteRepository favoriteRepository;
    @Mock
    EmailService emailService;
    @Mock
    AccountRepository accountRepository;

    @InjectMocks
    ReceiptRestaurantServiceImpl receiptRestaurantServiceImpl;

    Integer[] feature = {1, 2};

    String userId = "1";

    Restaurant restaurant = new Restaurant("1", "restaurant-code", "nha han"
            , "ngon", "slug-restaurant", RestaurantType.NHA_HANG,
            feature, "a", userId, ApproveStatus.PENDING);

    Account account = new Account("1", "nam", "nam@gmail.com"
            , "0983302976", true, "123456", "abc.jpg",
            "05-06-99", true,1L, "a");

    Contact contact = new Contact("nam", "nguyen",
            "nam@123", "0983302922");

    BookingContact bookingContact = new BookingContact("1", "nam", "nguyen",
            "nam@123", "0983302922", userId);

    BookingRestaurantRequest bookingRestaurantRequest =
            new BookingRestaurantRequest("restaurant-code", contact,
                    21001212, "2200", 2, 3);
    String bookingId = HelperUtils.genBookingID();

    List<String> restaurantImages = Arrays.asList("aaaaaaaaaaaaaaa.jpg");

    @Test
    public void testBookingRestaurant() {
        PowerMockito.mockStatic(AuthenticationUtils.class);
        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(restaurantRepository.findFirstByCode(Mockito.anyString())).thenReturn(restaurant);

        Mockito.when(accountRepository.getAccountById(Mockito.anyString())).thenReturn(java.util.Optional.ofNullable(account));

        Mockito.when(restaurantImageRepository.findAllByRestaurantCode(Mockito.anyString())).thenReturn(restaurantImages);

        RestaurantInfoDTO restaurantInfoDTO = MappingUtils.map(restaurant, RestaurantInfoDTO.class);
        List<RestaurantMenu> restaurantMenuList = restaurantMenuRepository.findAllByRestaurantCode(restaurant.getCode());

        restaurantInfoDTO.setImagesList(restaurantImages);
        restaurantInfoDTO.setMenuDTOList(MappingUtils.map(restaurantMenuList, RestaurantMenuDTO.class));

        RestaurantBookingReceipt receipt = RestaurantBookingReceipt.builder()
                .bookingId(bookingId)
                .restaurantInfoDTO(restaurantInfoDTO)
                .contact(bookingContact)
                .userId(userId)
                .phonePartner(account.getPhone())
                .partnerId(restaurant.getUserId())
                .numberChild(bookingRestaurantRequest.getNumberChild())
                .numberAdult(bookingRestaurantRequest.getNumberAdult())
                .checkinDay(bookingRestaurantRequest.getCheckinDate())
                .checkinTime(bookingRestaurantRequest.getCheckinTime())
                .status(BookingStatus.BOOKING_PENDING)
                .build();

        receipt = restaurantBookingReceiptRepository.save(receipt);
        BaseResponse.ok(MappingUtils.map(receipt, RestaurantBookingReceiptDTO.class));

        receiptRestaurantServiceImpl.bookingRestaurant(bookingRestaurantRequest);

    }

    RestaurantInfoDTO restaurantInfoDTO = MappingUtils.map(restaurant, RestaurantInfoDTO.class);

    RestaurantBookingReceipt restaurantBookingReceipt = new
            RestaurantBookingReceipt("1", bookingId, bookingContact, BookingStatus.BOOKING_APPROVED,
            20211212, "2200", 2, 3, restaurantInfoDTO,
            account.getPhone(), "1", userId);

    List<RestaurantBookingReceipt> receiptList = Arrays.asList(restaurantBookingReceipt);
    int total = 0;

    //    BookingStatus status, Integer page, Integer perPage

    String partnerId = "2";

    @Test
    public void testGetListRestaurantReceipt() {
        PowerMockito.mockStatic(AuthenticationUtils.class);
        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(restaurantBookingReceiptRepository.findAllByPartnerIdOrderByCreatedAtDesc(userId, PageRequest.of(1, 5))).thenReturn(receiptList);
        Mockito.when(restaurantBookingReceiptRepository.countAllByPartnerId(Mockito.anyString())).thenReturn(total);

        Map<String, Integer> mapReturn = new HashMap<>();
        BaseResponse.ok(MappingUtils.map(receiptList, RestaurantBookingReceiptDTO.class), mapReturn);

        receiptRestaurantServiceImpl.getListRestaurantReceipt(null,1,5);
        receiptRestaurantServiceImpl.getListRestaurantReceipt(BookingStatus.BOOKING_APPROVED,1,5);

    }

    RestaurantApproveBookingRequest restaurantApproveBookingRequest = new
            RestaurantApproveBookingRequest(bookingId,BookingStatus.BOOKING_APPROVED);

    RestaurantBookingReceipt receipt = RestaurantBookingReceipt.builder()
            .bookingId(bookingId)
            .restaurantInfoDTO(restaurantInfoDTO)
            .contact(bookingContact)
            .userId(userId)
            .phonePartner(account.getPhone())
            .partnerId(restaurant.getUserId())
            .numberChild(bookingRestaurantRequest.getNumberChild())
            .numberAdult(bookingRestaurantRequest.getNumberAdult())
            .checkinDay(bookingRestaurantRequest.getCheckinDate())
            .checkinTime(bookingRestaurantRequest.getCheckinTime())
            .status(BookingStatus.BOOKING_PENDING)
            .build();

    @Test
    public void testRestaurantApproStatusRepositoryUserId() {


        Mockito.when(restaurantBookingReceiptRepository.findFirstByBookingId(Mockito.anyString())).thenReturn(receipt);
        Mockito.when(restaurantBookingReceiptRepository.save(receipt)).thenReturn(receipt);

         receiptRestaurantServiceImpl.restaurantApproStatusRepositoryUserId(restaurantApproveBookingRequest);

    }


    @Test
    public void testGetReceiptRestaurantDetail() {

        Mockito.when(restaurantBookingReceiptRepository.findFirstById(Mockito.anyString())).thenReturn(receipt);
         BaseResponse.ok(MappingUtils.map(receipt, RestaurantBookingReceiptDTO.class));

        receiptRestaurantServiceImpl.getReceiptRestaurantDetail("1");

    }

}
