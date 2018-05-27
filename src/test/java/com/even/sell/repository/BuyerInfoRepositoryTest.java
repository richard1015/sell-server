package com.even.sell.repository;

import com.even.sell.dataobject.BuyerInfo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @author even
 * @description
 * @date 2018/5/18 1:02
 * @memo
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class BuyerInfoRepositoryTest {

    @Autowired
    private BuyerInfoRepository repository;

    @Test
    public void findByUsername() {
        BuyerInfo buyerInfo = repository.findByUsername("musw");
        System.out.println(buyerInfo);
        Assert.assertNotNull(buyerInfo);
    }
}