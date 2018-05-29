package com.even.sell.service.impl;

import com.even.sell.dataobject.Cart;
import com.even.sell.repository.CartRepository;
import com.even.sell.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/22 0:44
 * @memo
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    public CartRepository cartRepository;

    @Override
    public List<Cart> findList(String buyerId) {
        return cartRepository.findCartsByBuyerId(buyerId);
    }
}
