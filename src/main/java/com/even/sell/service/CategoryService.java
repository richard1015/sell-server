package com.even.sell.service;

import com.even.sell.dataobject.ProductCategory;

import java.util.List;

/**
 * @author EVEN
 * 2018/4/14 21:12
 */
public interface CategoryService {

    ProductCategory findOne(Integer categoryId);

    List<ProductCategory> findAll();

    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);

    ProductCategory save(ProductCategory productCategory);

}
