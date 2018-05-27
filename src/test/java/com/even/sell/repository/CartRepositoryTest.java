package com.even.sell.repository;

import com.even.sell.dataobject.Cart;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

/**
 * @author even
 * @description
 * @date 2018/5/22 23:44
 * @memo
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CartRepositoryTest {

    @Autowired
    private CartRepository cartRepository;

    @Test
    @Transactional
    public void deleteByBuyerIdAndProductId() {
        int a = cartRepository.deleteByBuyerIdAndProductId("id_even1", "1525089344212659275");
        System.out.println(a);
        Assert.assertNotNull(a);
    }

    @Test
    public void add() {
        Cart cart = new Cart();
        cart.setCartId(1);
        cart.setBuyerId("musw");
        cart.setProductId("produce");
        cart.setProductQuantity(10);
        cart.setChecked(1);
        Cart a = cartRepository.save(cart);
        System.out.println(a);
        Assert.assertNotNull(a);
    }
}