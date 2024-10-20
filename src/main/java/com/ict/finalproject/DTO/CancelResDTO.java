package com.ict.finalproject.DTO;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CancelResDTO {
    private String mId;
    private String lastTransactionKey;
    private String paymentKey;
    private String orderId;
    private String orderName;
    private String status;
    private String requestedAt;
    private String approvedAt;
    private boolean useEscrow;
    private boolean cultureExpense;

    private CardInfo card;  // Card 관련 정보를 위한 내부 클래스
    private List<CancelInfo> cancels;  // 부분 취소 정보
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class CardInfo {
    private String issuerCode;
    private String acquirerCode;
    private String number;
    private int amount;
    private boolean useCardPoint;
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class CancelInfo {
    private String transactionKey;
    private String cancelReason;
    private int cancelAmount;
    private String canceledAt;
    private String cancelStatus;
}
