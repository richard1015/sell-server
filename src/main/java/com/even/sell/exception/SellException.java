package com.even.sell.exception;

import com.even.sell.enums.ResultEnum;

/**
 * @author EVEN
 * 2018/4/15 1:32
 */
public class SellException extends RuntimeException{

    private Integer code;

    public SellException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());

        this.code = resultEnum.getCode();
    }

    public SellException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}
