package com.even.sell.form;

import lombok.Data;

import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/26 20:20
 * @memo
 */
@Data
public class CartForm {

    private Integer addressId;

    private List<CartInfo> cartInfos;

}
