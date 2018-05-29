package com.even.sell.dto;

import lombok.Data;

import lombok.Data;

/**
 * 购物车
 * @author EVEN
 * 2018/4/15 0:42
 */
@Data
public class CartDTO {

    /** 商品Id. */
    private String productId;

    /** 数量. */
    private Integer productQuantity;

    public CartDTO(String productId, Integer productQuantity) {
        this.productId = productId;
        this.productQuantity = productQuantity;
    }
}
