package com.even.sell.repository;

import com.even.sell.dataobject.ProductInfo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @author EVEN
 * 2018/4/30 15:50
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductInfoRepositoryTest {

    @Autowired
    private ProductInfoRepository repository;

    @Test
    @Transactional
    public void saveTest() {
        ProductInfo productInfo = new ProductInfo();
        productInfo.setProductId("0000001");
        productInfo.setProductName("蕾丝连衣裙2018春装新款长袖韩版时尚气质中长款收腰修身缕空裙子");
        productInfo.setProductPrice(new BigDecimal(168.00));
        productInfo.setProductStock(100);
        productInfo.setProductDescription("连衣裙2018春装");
        productInfo.setProductIcon("https://gd2.alicdn.com/imgextra/i4/727928363/TB2MzipbuGSBuNjSspbXXciipXa_!!727928363.jpg");
        productInfo.setProductStatus(0);
        productInfo.setCategoryType(3);

        ProductInfo result = repository.save(productInfo);
        Assert.assertNotNull(result);
    }

    @Test
    public void findByProductStatus() throws Exception {

        List<ProductInfo> productInfoList = repository.findByProductStatus(0);
        Assert.assertNotEquals(0, productInfoList.size());
    }
}