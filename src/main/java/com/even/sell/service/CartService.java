package com.even.sell.service;

import com.even.sell.dataobject.Cart;

import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/22 0:44
 * @memo
 */
public interface CartService {

    List<Cart> findList (String buyerId);

}
