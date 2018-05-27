package com.even.sell.controller;

import com.even.sell.VO.ProductVO;
import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.ProductInfo;
import com.even.sell.service.CategoryService;
import com.even.sell.service.ProductService;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.data.domain.PageRequest.of;

/**
 * @author EVEN
 * 2018/4/14 23:16
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/product")
public class BuyerProductController {

    @Autowired
    private ProductService productService;

    /**
     * 列表
     *
     * @param categoryType
     * @param page
     * @param size
     * @param sort
     * @return
     */
    @GetMapping("/list")
    public ResultVO list(@RequestParam(value = "categoryType", defaultValue = "-1") Integer categoryType,
                         @RequestParam(value = "page", defaultValue = "1") Integer page,
                         @RequestParam(value = "size", defaultValue = "8") Integer size,
                         @RequestParam(value = "sort", defaultValue = "1") Integer sort
    ) {
        Sort sortx = new Sort(Sort.Direction.DESC, "productPrice");
        if (sort == 1) {
            sortx = new Sort(Sort.Direction.ASC, "productPrice");
        }
        Page<ProductInfo> productInfoPage = productService.findAll(of(page - 1, size, sortx), categoryType);
        //1. 查询所有的上架商品
        List<ProductInfo> productInfoList = productInfoPage.getContent();
        //2. 数据拼装
        List<ProductVO> productVOList = new ArrayList<>();
        for (ProductInfo productInfo : productInfoList) {
            ProductVO productVO = new ProductVO();
            BeanUtils.copyProperties(productInfo, productVO);
            productVOList.add(productVO);
        }
        return ResultVOUtil.success(productVOList);
    }

    /**
     * 购物车
     *
     * @return
     */
    @GetMapping("/add_cart")
    public ResultVO addCart(@RequestParam(value = "productId", defaultValue = "1") String productId
    ) {
        return ResultVOUtil.success();
    }

}
