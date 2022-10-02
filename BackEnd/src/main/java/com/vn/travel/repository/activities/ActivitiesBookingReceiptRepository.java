package com.vn.travel.repository.activities;

import com.vn.travel.common.type.BookingStatus;
import com.vn.travel.entity.activities.ActivitiesBookingReceipt;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActivitiesBookingReceiptRepository extends JpaRepository<ActivitiesBookingReceipt, String> {

    ActivitiesBookingReceipt findFirstByBookingId(String bookingId);


    List<ActivitiesBookingReceipt> findAllByPartnerIdOrderByCreatedAtDesc(String partnerId, Pageable pageable);

    List<ActivitiesBookingReceipt> findAllByPartnerIdAndStatusOrderByCreatedAtDesc(String partnerId, BookingStatus status, Pageable pageable);

    int countAllByPartnerId(String partnerId);


    int countAllByPartnerIdAndStatus(String partnerId, BookingStatus status);

    ActivitiesBookingReceipt findFirstById(String receiptId);


    List<ActivitiesBookingReceipt> findAllByUserIdOrderByCreatedAtDesc(String userId, Pageable pageable);

    List<ActivitiesBookingReceipt> findAllByUserIdAndStatusOrderByCreatedAtDesc(String userId, BookingStatus status, Pageable pageable);

    int countAllByUserId(String userId);

    int countAllByUserIdAndStatus(String partnerId, BookingStatus status);
}
