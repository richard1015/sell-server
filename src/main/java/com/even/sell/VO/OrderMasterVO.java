package com.even.sell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/26 17:34
 * @memo
 */
@Data
public class OrderMasterVO {

    @JsonProperty("orderId")
    private String orderId;

    @JsonProperty("buyerName")
    private String buyerName;

    @JsonProperty("buyerAddress")
    private String buyerAddress;

    @JsonProperty("buyerId")
    private String buyerId;

    @JsonProperty("orderAmount")
    private BigDecimal orderAmount;

    @JsonProperty("orderDetailVOS")
    private List<OrderDetailVO> orderDetailVOS;

}
