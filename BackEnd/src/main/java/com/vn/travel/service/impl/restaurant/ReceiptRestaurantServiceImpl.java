package com.vn.travel.service.impl.restaurant;

import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.constant.StatusCode;
import com.vn.travel.entity.BookingContact;
import com.vn.travel.entity.account.Account;
import com.vn.travel.entity.restaurant.Restaurant;
import com.vn.travel.entity.restaurant.RestaurantBookingReceipt;
import com.vn.travel.entity.restaurant.RestaurantMenu;
import com.vn.travel.exception.ErrorCode;
import com.vn.travel.exception.GeneralException;
import com.vn.travel.exception.ResourceNotFoundException;
import com.vn.travel.exception.RestApiException;
import com.vn.travel.repository.AccountRepository;
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
import com.vn.travel.utils.AuthenticationUtils;
import com.vn.travel.utils.HelperUtils;
import com.vn.travel.utils.MappingUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
@Log4j2
@AllArgsConstructor

public class ReceiptRestaurantServiceImpl implements ReceiptRestaurantService {


    private RestaurantRepository restaurantRepository;
    private RestaurantImageRepository restaurantImageRepository;
    private RestaurantMenuRepository restaurantMenuRepository;
    private RestaurantBookingReceiptRepository restaurantBookingReceiptRepository;
    private FavoriteRepository favoriteRepository;
    private EmailService emailService;


    private AccountRepository accountRepository;


    @Override
    public BaseResponse bookingRestaurant(BookingRestaurantRequest bookingRestaurantRequest) {
        String userId = AuthenticationUtils.getUserId();
        if (userId == null) {
            throw new GeneralException(ErrorCode.UNAUTHORIZED);
        }
        try {

            String bookingId = HelperUtils.genBookingID();
            BookingContact contact = BookingContact.builder()
                    .customerId(userId)
                    .email(bookingRestaurantRequest.getContact().getEmail())
                    .firstName(bookingRestaurantRequest.getContact().getFirstName())
                    .lastName(bookingRestaurantRequest.getContact().getLastName())
                    .phone(bookingRestaurantRequest.getContact().getPhone())
                    .build();

            Restaurant restaurant = restaurantRepository.findFirstByCode(bookingRestaurantRequest.getRestaurantCode());

            Optional<Account> result = accountRepository.getAccountById(restaurant.getUserId());
            if (result.isPresent()) {
                Account account = result.get();
                List<String> restaurantImages = restaurantImageRepository.findAllByRestaurantCode(restaurant.getCode());
                RestaurantInfoDTO restaurantInfoDTO = MappingUtils.map(restaurant, RestaurantInfoDTO.class);
                List<RestaurantMenu> restaurantMenuList = restaurantMenuRepository.findAllByRestaurantCode(restaurant.getCode());

                restaurantInfoDTO.setImagesList(restaurantImages);
                restaurantInfoDTO.setMenuDTOList(MappingUtils.map(restaurantMenuList, RestaurantMenuDTO.class));

                RestaurantBookingReceipt receipt = RestaurantBookingReceipt.builder()
                        .bookingId(bookingId)
                        .restaurantInfoDTO(restaurantInfoDTO)
                        .contact(contact)
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
                return BaseResponse.ok(MappingUtils.map(receipt, RestaurantBookingReceiptDTO.class));
            } else {
                throw new RestApiException(StatusCode.ACCOUNT_NOT_EXIST);
            }
        } catch (Exception ex) {
            log.error("IOException:" + ex.getMessage(), ex);
            throw new GeneralException();
        }
    }


    @Override
    public BaseResponse getListRestaurantReceipt(BookingStatus status, Integer page, Integer perPage) {
        String userId = AuthenticationUtils.getUserId();
        if (userId == null) {
            throw new GeneralException(ErrorCode.UNAUTHORIZED);
        }
        List<RestaurantBookingReceipt> receiptList;
        Map<String, Integer> mapReturn = new HashMap<>();
        if (status == null) {
            receiptList = restaurantBookingReceiptRepository.findAllByPartnerIdOrderByCreatedAtDesc(userId, PageRequest.of(page, perPage));
            mapReturn.put("total", restaurantBookingReceiptRepository.countAllByPartnerId(userId));
        } else {
            receiptList = restaurantBookingReceiptRepository.findAllByPartnerIdAndStatusOrderByCreatedAtDesc(userId, status, PageRequest.of(page, perPage));
            mapReturn.put("total", restaurantBookingReceiptRepository.countAllByPartnerIdAndStatus(userId, status));
        }
        return BaseResponse.ok(MappingUtils.map(receiptList, RestaurantBookingReceiptDTO.class), mapReturn);
    }

    @Override
    public BaseResponse getListRestaurantReceiptByUserId(BookingStatus status, Integer page, Integer perPage) {
        String userId = AuthenticationUtils.getUserId();
        if (userId == null) {
            throw new GeneralException(ErrorCode.UNAUTHORIZED);
        }
        List<RestaurantBookingReceipt> receiptList;
        Map<String, Integer> mapReturn = new HashMap<>();
        if (status == null) {
            receiptList = restaurantBookingReceiptRepository.findAllByUserIdOrderByCreatedAtDesc(userId, PageRequest.of(page, perPage));
            mapReturn.put("total", restaurantBookingReceiptRepository.countAllByUserId(userId));
        } else {
            receiptList = restaurantBookingReceiptRepository.findAllByUserIdAndStatusOrderByCreatedAtDesc(userId, status, PageRequest.of(page, perPage));
            mapReturn.put("total", restaurantBookingReceiptRepository.countAllByUserIdAndStatus(userId, status));
        }
        return BaseResponse.ok(MappingUtils.map(receiptList, RestaurantBookingReceiptDTO.class), mapReturn);
    }

    @Override
    public BaseResponse getReceiptRestaurantDetail(String id) {
        RestaurantBookingReceipt receipt = restaurantBookingReceiptRepository.findFirstById(id);
        return BaseResponse.ok(MappingUtils.map(receipt, RestaurantBookingReceiptDTO.class));
    }

    @Override
    public void restaurantApproStatusRepository(RestaurantApproveBookingRequest restaurantApproveBookingRequest) {

        RestaurantBookingReceipt receipt = restaurantBookingReceiptRepository.findFirstByBookingId(restaurantApproveBookingRequest.getBookingId());
        if (receipt == null) {
            throw new ResourceNotFoundException();
        }
        if (restaurantApproveBookingRequest.getStatus().equals(BookingStatus.BOOKING_APPROVED)) {
            receipt.setStatus(restaurantApproveBookingRequest.getStatus());
            sendMailApproved(restaurantApproveBookingRequest, receipt);
        } else {
            receipt.setStatus(restaurantApproveBookingRequest.getStatus());
            sendMailReject(restaurantApproveBookingRequest, receipt);
        }

        restaurantBookingReceiptRepository.save(receipt);
    }

    public void restaurantApproStatusRepositoryUserId(RestaurantApproveBookingRequest restaurantApproveBookingRequest) {

        RestaurantBookingReceipt receipt = restaurantBookingReceiptRepository.findFirstByBookingId(restaurantApproveBookingRequest.getBookingId());
        if (receipt == null) {
            throw new ResourceNotFoundException();
        }

        receipt.setStatus(restaurantApproveBookingRequest.getStatus());
        restaurantBookingReceiptRepository.save(receipt);
    }


    private void sendMailApproved(RestaurantApproveBookingRequest restaurantApproveBookingRequest, RestaurantBookingReceipt receipt) {
        try {
            StringBuilder content = new StringBuilder();
            content.append("Xin Ch??o B???n ");
            content.append("<p> C???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i  </p>");
            content.append("<p> Y??u c???u c???a b???n ???? ??c ch??ng t???i ch???p nh???n   </p>");
            content.append("<p> L??m ??n ki???m tra , th??ng tin ?????t d???ch v??? c???a b???n ??? b??n d?????i </p>");
            content.append("<p> Ng??y  ?????t  :  \"" + formatDate(receipt.getCheckinDay()) + "\"   </p>");
            content.append("<p> Gi???  ?????t  :  \"" + receipt.getCheckinTime() + "\"   </p>");
            content.append("<p> S??? L?????ng Ng?????i L???n    :  \"" + receipt.getNumberAdult() + "\"   </p>");
            content.append("<p> S??? L?????ng Tr??? Em   :  \"" + receipt.getNumberChild() + "\"   </p>");
            content.append("<p> T??n Nh?? H??ng   :  \"" + receipt.getRestaurantInfoDTO().getTitle() + "\"   </p>");
            content.append("<p> ?????a Ch??? Nh?? H??ng   :  \"" + receipt.getRestaurantInfoDTO().getAddress() + "\"   </p>");
            String subject = "TravelVietNam ---TH??NG TIN D???CH V???";

            emailService.sendSimpleMessage(receipt.getContact().getEmail(), subject, content.toString());
        } catch (Exception e) {
            log.debug(e);
        }
    }


    private void sendMailReject(RestaurantApproveBookingRequest restaurantApproveBookingRequest, RestaurantBookingReceipt receipt) {
        try {
            StringBuilder content = new StringBuilder();
            content.append("Xin Ch??o B???n ");
            content.append("<p> C???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i  </p>");
            content.append("<p> Y??u c???u c???a b???n ???? b??? h???y  , do m???t s??? l?? do n??n y??u c???u c???a b???n k ???????c ch???p nh???n  </p>");
            content.append("<p  C?? ??i???u g?? th???c m???c xin li??n h??? v???i S??T c???a nh?? h??ng : \"" + receipt.getRestaurantInfoDTO().getPhonePartner() + "\"     </p>");
            content.append("<p> H???n G???p b???n v??o l???n sau     </p>");
            String subject = "TravelVietNam ---TH??NG TIN D???CH V???";

            emailService.sendSimpleMessage(receipt.getContact().getEmail(), subject, content.toString());
        } catch (Exception e) {
            log.debug(e);
        }
    }

    public static String formatDate(Integer checkinDay) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date = sdf.parse(checkinDay.toString());

        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd ");
        String strDate = dateFormat.format(date);
        return strDate;
    }

    public static void main(String[] args) throws ParseException {
        ReceiptRestaurantServiceImpl.formatDate(20211212);
    }

}




