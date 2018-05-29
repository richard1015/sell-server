package com.even.sell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 购物车
 * @author EVEN
 * 2018/4/15 0:42
 */
@Data
public class CartVO {

    @JsonProperty("id")
    private String productId;

    @JsonProperty("quantity")
    private Integer productQuantity;

    @JsonProperty("name")
    private String productName;

    @JsonProperty("icon")
    private String productIcon;

    @JsonProperty("price")
    private BigDecimal productPrice;

    @JsonProperty("checked")
    private Integer checked;

}
