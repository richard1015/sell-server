package com.even.sell.enums;

import lombok.Getter;

/**
 * 商品状态
 * @author EVEN
 * 2018/4/14 22:59
 */
@Getter
public enum ProductStatusEnum  implements CodeEnum {

    UP(0, "在架"),
    DOWN(1, "下架")
    ;

    private Integer code;

    private String message;

    ProductStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

}
