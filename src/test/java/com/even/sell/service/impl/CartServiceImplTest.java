package com.even.sell.service.impl;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author even
 * @description
 * @date 2018/5/22 2:00
 * @memo
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CartServiceImplTest {

    @Autowired
    private CartServiceImpl cartService;

    @Test
    public void findList() {
        List a = cartService.findList("id_even");
        System.out.println(a.size());
        Assert.assertNotNull(a);
    }
}