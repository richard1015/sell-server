package com.even.sell.enums;

import lombok.Getter;

/**
 * @author EVEN
 * 2018/4/14 23:39
 */
@Getter
public enum PayStatusEnum  implements CodeEnum {

    WAIT(0, "等待支付"),
    SUCCESS(1, "支付成功"),

    ;

    private Integer code;

    private String message;

    PayStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

}
