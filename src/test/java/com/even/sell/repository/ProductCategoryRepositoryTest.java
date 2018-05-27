package com.even.sell.repository;

import com.even.sell.dataobject.ProductCategory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Arrays;


/**
 * @author EVEN
 * 2018/4/30 16:00
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductCategoryRepositoryTest {

    @Autowired
    private ProductCategoryRepository repository;

    @Test
    public void findOneTest() {
        ProductCategory productCategory = repository.findById(3).get();
        System.out.println(productCategory.toString());
    }

    @Test
    @Transactional
    //与service中的不同，在测试中是完全回滚，在service中是遇到异常时回滚
    public void saveTest() {
        ProductCategory productCategory = new ProductCategory("大主宰12", 7);
        ProductCategory result = repository.save(productCategory);
        System.out.println(result.getCategoryId());
        Assert.assertNotNull(result);
    }

    @Test
    public void findByCategoryTypeInTest() {
        List<Integer> list = Arrays.asList(2,3,4);

        List<ProductCategory> result = repository.findByCategoryTypeIn(list);
        Assert.assertNotEquals(0, result.size());
    }

    @Test
    public void updateTest() {
        ProductCategory productCategory = repository.findById(2).get();
        productCategory.setCategoryName("女生最爱");
        ProductCategory result = repository.save(productCategory);
        Assert.assertEquals(productCategory, result);
    }
}