package com.vn.travel;

import com.vn.travel.common.ActivitiesType;
import com.vn.travel.common.type.ApproveStatus;
import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.common.type.RoomType;
import com.vn.travel.dao.AccountDAO;
import com.vn.travel.entity.BookingContact;
import com.vn.travel.entity.account.Account;
import com.vn.travel.entity.account.Role;
import com.vn.travel.model.Contact;
import com.vn.travel.service.EmailService;
import com.vn.travel.utils.AuthenticationUtils;
import com.vn.travel.utils.HelperUtils;
import com.vn.travel.utils.MappingUtils;
import com.vn.travel.entity.activities.Activities;
import com.vn.travel.entity.activities.ActivitiesBookingReceipt;
import com.vn.travel.entity.activities.ActivitiesGame;
import com.vn.travel.entity.hotel.Hotel;
import com.vn.travel.entity.hotel.HotelBookableItem;
import com.vn.travel.entity.hotel.HotelBookingReceipt;
import com.vn.travel.repository.FavoriteHotelRepository;
import com.vn.travel.repository.HotelBookItemRepository;
import com.vn.travel.repository.HotelBookingReceiptRepository;
import com.vn.travel.repository.HotelImageRepository;
import com.vn.travel.repository.HotelRepository;
import com.vn.travel.repository.activities.ActivitiesBookingReceiptRepository;
import com.vn.travel.repository.activities.ActivitiesGameRepository;
import com.vn.travel.repository.activities.ActivitiesImageRepository;
import com.vn.travel.repository.activities.ActivitiesRepository;
import com.vn.travel.request.activities.BookingActivitiesRequest;
import com.vn.travel.request.hotel.BookingRequest;
import com.vn.travel.response.BaseResponse;
import com.vn.travel.response.activities.ActivitiesBookingReceiptDTO;
import com.vn.travel.response.activities.ActivitiesGameDTO;
import com.vn.travel.response.activities.ActivitiesInfoDTO;
import com.vn.travel.response.hotel.HotelBookingReceiptDTO;
import com.vn.travel.response.hotel.HotelInfoDTO;
import com.vn.travel.response.hotel.PackageDTO;
import com.vn.travel.service.impl.ReceiptServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@RunWith(PowerMockRunner.class)
@PrepareForTest(AuthenticationUtils.class)
public class ReceiptServiceImplTest {


    @Mock
    AccountDAO accountDAO;
    @Mock
    HotelRepository hotelRepository;

    @Mock
    HotelImageRepository hotelImageRepository;

    @Mock
    HotelBookItemRepository hotelBookItemRepository;
    @Mock
    FavoriteHotelRepository favoriteHotelRepository;
    @Mock
    HotelBookingReceiptRepository hotelBookingReceiptRepository;

    @Mock
    ActivitiesBookingReceiptRepository activitiesBookingReceiptRepository;
    @Mock
    ActivitiesRepository activitiesRepository;
    @Mock
    ActivitiesImageRepository activitiesImageRepository;
    @Mock
    ActivitiesGameRepository activitiesGameRepository;
    @Mock
    EmailService emailService;

    @InjectMocks
    ReceiptServiceImpl receiptServiceImpl;

    String userId = "1";
    Account account = Account.builder()
            .id("1")
            .dob("2101/12/12")
            .email("nam.nguyen@gmail.com")
            .enabled(true)
            .name("nam")
            .gender(true)
            .password("123456")
            .role(new Role(1L, "ROLE_ADMIN"))
            .image("aaaaaaaaaaaaa.jpg")
            .phone("0983302976")
            .password("123456")
            .build();

    Contact contact = Contact.builder()
            .email("a@123")
            .firstName("nam")
            .phone("098330021")
            .lastName("namNaem")
            .build();

    BookingRequest bookingRequest = BookingRequest.builder()
            .packageId("1")
            .checkinDate(20211212)
            .hotelCode("hotel-code")
            .checkoutDate(21121212)
            .contact(contact)
            .build();

    String bookingId = HelperUtils.genBookingID();

    BookingContact bookingContact = BookingContact.builder()
            .customerId(userId)
            .email(bookingRequest.getContact().getEmail())
            .firstName(bookingRequest.getContact().getFirstName())
            .lastName(bookingRequest.getContact().getLastName())
            .phone(bookingRequest.getContact().getPhone())
            .build();

    Hotel hotel = Hotel.builder()
            .approveStatus(ApproveStatus.APPROVED)
            .userId(userId)
            .code("hotel-code")
            .description("bbbb")
            .address("aaa")
            .rank(5)
            .slug("slug-hotel")
            .title("title-hotel")
            .build();
    Activities activities = Activities.builder()
            .activitiesType(ActivitiesType.IN_DOOR)
            .childTicketPrice(111D)
            .adultTicketPrice(222D)
            .slug("slug-ac")
            .code("ac-code")
            .title("khu vui choi")
            .star(5)
            .duration(3)
            .approveStatus(ApproveStatus.APPROVED)
            .address("aaaa")
            .description("aaaaaaaaaaa")
            .userId(userId)
            .id("1")
            .build();


    @Test
    public void testBookingHotel() {

        PowerMockito.mockStatic(AuthenticationUtils.class);

        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(hotelRepository.findFirstByCode(Mockito.anyString())).thenReturn(hotel);

        Mockito.when(accountDAO.getAccountById(Mockito.anyString())).thenReturn(java.util.Optional.ofNullable(account));

        List<String> hotelImages = Collections.singletonList("aaaaaaaaaaaaa.jpg");

        Mockito.when(hotelImageRepository.findAllHotelByCode(Mockito.anyString())).thenReturn(hotelImages);
        HotelInfoDTO hotelInfoDTO = MappingUtils.map(hotel, HotelInfoDTO.class);
        hotelInfoDTO.setImagesList(hotelImages);

        HotelBookableItem hotelPackage = HotelBookableItem.builder()
                .hotelCode("hotel-code")
                .image("aaaa.jpg")
                .available(true)
                .price(1111D)
                .roomType(RoomType.SINGLE)
                .hotelOptionCode("aaa")
                .currency("VND")
                .build();

        Mockito.when(hotelBookItemRepository.findFirstById(Mockito.any())).thenReturn(hotelPackage);

        HotelBookingReceipt receipt = HotelBookingReceipt.builder()
                .hotelInfoDTO(hotelInfoDTO)
                .packageInfo(MappingUtils.map(hotelPackage, PackageDTO.class))
                .contact(bookingContact)
                .userId(userId)
                .phonePartner(account.getPhone())
                .checkin(bookingRequest.getCheckinDate())
                .checkout(bookingRequest.getCheckoutDate())
                .bookingId(bookingId)
                .totalNights(2)
                .status(BookingStatus.BOOKING_PENDING)
                .partnerId(hotel.getUserId())
                .build();
        receipt.setPrice(receipt.getTotalNights() * hotelPackage.getPrice());
        Mockito.when(hotelBookingReceiptRepository.save(Mockito.any())).thenReturn(receipt);

        BaseResponse.ok(MappingUtils.map(receipt, HotelBookingReceiptDTO.class));

        receiptServiceImpl.bookingHotel(bookingRequest);
    }

    BookingActivitiesRequest bookingActivitiesRequest = BookingActivitiesRequest.builder()
            .activitiesCode("ac-code")
            .contact(contact)
            .travelDate(3)
            .numberTicketAdult(111)
            .numberTicketChild(222)
            .build();


    @Test
    public void testBookingActivities() {

        PowerMockito.mockStatic(AuthenticationUtils.class);

        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Mockito.when(activitiesRepository.findFirstByCode(Mockito.anyString())).thenReturn(activities);

        Mockito.when(accountDAO.getAccountById(Mockito.anyString())).thenReturn(Optional.ofNullable(account));


            List<String> activitiesImageList = activitiesImageRepository.findAllActivitiesCode(activities.getCode());

            List<ActivitiesGame> activitiesGameList = activitiesGameRepository.findAllByActivitiesCode(activities.getCode());
            ActivitiesInfoDTO activitiesInfoDTO = MappingUtils.map(activities, ActivitiesInfoDTO.class);
            activitiesInfoDTO.setImagesList(activitiesImageList);
            activitiesInfoDTO.setGameDTOList(MappingUtils.map(activitiesGameList, ActivitiesGameDTO.class));

            ActivitiesBookingReceipt receipt = ActivitiesBookingReceipt.builder()
                    .activitiesInfoDTO(activitiesInfoDTO)
                    .contact(bookingContact)
                    .userId(userId)
                    .phonePartner(account.getPhone())
                    .travelDate(bookingActivitiesRequest.getTravelDate())
                    .numberTicketChild(bookingActivitiesRequest.getNumberTicketChild())
                    .numberTicketAdult(bookingActivitiesRequest.getNumberTicketAdult())
                    .bookingId(bookingId)
                    .status(BookingStatus.BOOKING_PENDING)
                    .partnerId(activities.getUserId())
                    .price(activities.getAdultTicketPrice() * bookingActivitiesRequest.getNumberTicketAdult() + activities.getChildTicketPrice() * bookingActivitiesRequest.getNumberTicketChild())
                    .build();
            receipt = activitiesBookingReceiptRepository.save(receipt);
             BaseResponse.ok(MappingUtils.map(receipt, ActivitiesBookingReceiptDTO.class));

        receiptServiceImpl.bookingActivities(bookingActivitiesRequest);
    }


    @Test
    public void testGetListHotelReceipt() {

        String userId = "1";
        PowerMockito.mockStatic(AuthenticationUtils.class);

        Mockito.when(AuthenticationUtils.getUserId()).thenReturn(userId);

        Account account = Account.builder()
                .id("1")
                .dob("2101/12/12")
                .email("nam.nguyen@gmail.com")
                .enabled(true)
                .name("nam")
                .gender(true)
                .password("123456")
                .role(new Role(1L, "ROLE_ADMIN"))
                .image("aaaaaaaaaaaaa.jpg")
                .phone("0983302976")
                .password("123456")
                .build();

        Contact contact = Contact.builder()
                .email("a@123")
                .firstName("nam")
                .phone("098330021")
                .lastName("namNaem")
                .build();

        BookingRequest bookingRequest = BookingRequest.builder()
                .packageId("1")
                .checkinDate(20211212)
                .hotelCode("hotel-code")
                .checkoutDate(21121212)
                .contact(contact)
                .build();

        String bookingId = HelperUtils.genBookingID();

        BookingContact bookingContact = BookingContact.builder()
                .customerId(userId)
                .email(bookingRequest.getContact().getEmail())
                .firstName(bookingRequest.getContact().getFirstName())
                .lastName(bookingRequest.getContact().getLastName())
                .phone(bookingRequest.getContact().getPhone())
                .build();

        Hotel hotel = Hotel.builder()
                .approveStatus(ApproveStatus.APPROVED)
                .userId(userId)
                .code("hotel-code")
                .description("bbbb")
                .address("aaa")
                .rank(5)
                .slug("slug-hotel")
                .title("title-hotel")
                .build();

        Mockito.when(hotelRepository.findFirstByCode(Mockito.anyString())).thenReturn(hotel);

        Mockito.when(accountDAO.getAccountById(Mockito.anyString())).thenReturn(Optional.ofNullable(account));

        List<String> hotelImages = Arrays.asList("aaaaaaaaaaaaa.jpg");

        Mockito.when(hotelImageRepository.findAllHotelByCode(Mockito.anyString())).thenReturn(hotelImages);
        HotelInfoDTO hotelInfoDTO = MappingUtils.map(hotel, HotelInfoDTO.class);
        hotelInfoDTO.setImagesList(hotelImages);

        HotelBookableItem hotelPackage = HotelBookableItem.builder()
                .hotelCode("hotel-code")
                .image("aaaa.jpg")
                .available(true)
                .price(1111D)
                .roomType(RoomType.SINGLE)
                .hotelOptionCode("aaa")
                .currency("VND")
                .build();

        Mockito.when(hotelBookItemRepository.findFirstById(Mockito.any())).thenReturn(hotelPackage);

        HotelBookingReceipt receipt = HotelBookingReceipt.builder()
                .hotelInfoDTO(hotelInfoDTO)
                .packageInfo(MappingUtils.map(hotelPackage, PackageDTO.class))
                .contact(bookingContact)
                .userId(userId)
                .phonePartner(account.getPhone())
                .checkin(bookingRequest.getCheckinDate())
                .checkout(bookingRequest.getCheckoutDate())
                .bookingId(bookingId)
                .totalNights(2)
                .status(BookingStatus.BOOKING_PENDING)
                .partnerId(hotel.getUserId())
                .build();

        List<HotelBookingReceipt> receiptList = Arrays.asList(receipt);

        int total = 1;

        Mockito.when(hotelBookingReceiptRepository.findAllByPartnerId(userId , PageRequest.of(1, 5) )).thenReturn(receiptList);

        Mockito.when(hotelBookingReceiptRepository.countAllByPartnerId(userId )).thenReturn(total);

        Map<String, Integer> mapReturn = new HashMap<>();

        BaseResponse baseResponse = BaseResponse
                .ok(MappingUtils.map(receiptList, HotelBookingReceiptDTO.class), mapReturn)
                .builder(). build();

        receiptServiceImpl.getListHotelReceipt(BookingStatus.BOOKING_PENDING , 1 ,5);
    }


}
