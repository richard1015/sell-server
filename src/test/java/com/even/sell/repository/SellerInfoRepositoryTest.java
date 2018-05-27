package com.even.sell.repository;

import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.dataobject.SellerInfo;
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
 * @date 2018/5/18 1:17
 * @memo
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class SellerInfoRepositoryTest {

    @Autowired
    private SellerInfoRepository repository;

    @Test
    public void findByOpenid() {
        SellerInfo sellerInfo = repository.findByOpenid("123123");
        Assert.assertNotNull(sellerInfo);
    }
}