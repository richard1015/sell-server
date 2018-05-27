package com.even.sell.form;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author even
 * @description
 * @date 2018/5/26 20:19
 * @memo
 */
@Data
public class CartInfo {

    private String id;

    /** 名字. */
    private String name;

    /** 单价. */
    private BigDecimal price;

    /** 库存. */
    private Integer quantity;

    /** 小图. */
    private String icon;

    private Integer checked;

}
