package com.even.sell.controller;

import com.even.sell.VO.CategoryVO;
import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.ProductCategory;
import com.even.sell.dataobject.ProductInfo;
import com.even.sell.service.CategoryService;
import com.even.sell.service.ProductService;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @author even
 * @description
 * @date 2018/5/16 22:08
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/category")
public class BuyerCategoryController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/list")
    public ResultVO list() {
        //1. 查询所有的上架商品
        List<ProductInfo> productInfoList = productService.findUpAll();
        //2. 查询类目(一次性查询)
        //精简方法(java8, lambda)
        List<Integer> categoryTypeList = productInfoList.stream()
                .map(e -> e.getCategoryType())
                .collect(Collectors.toList());
        List<ProductCategory> productCategoryList = categoryService.findByCategoryTypeIn(categoryTypeList);
        //3. 数据拼装
        List<CategoryVO> categoryVOList = new ArrayList<>();
        for (ProductCategory productCategory: productCategoryList) {
            CategoryVO categoryVO = new CategoryVO();
            categoryVO.setCategoryType(productCategory.getCategoryType());
            categoryVO.setCategoryName(productCategory.getCategoryName());
            categoryVOList.add(categoryVO);
        }
        return ResultVOUtil.success(categoryVOList);
    }

}
