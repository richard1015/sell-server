package com.even.sell.controller;

import com.even.sell.VO.CartVO;
import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.Cart;
import com.even.sell.dataobject.ProductInfo;
import com.even.sell.repository.CartRepository;
import com.even.sell.repository.ProductInfoRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.service.CartService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author even
 * @description
 * @date 2018/5/22 1:55
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/cart")
public class BuyerCartController {

    @Autowired
    private ProductInfoRepository productInfoRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartService cartService;

    @Autowired
    private BuyerService buyerService;

    /**
     * 加入购物车
     *
     * @param productId
     * @return
     */
    @GetMapping("/add")
    public ResultVO add(@RequestParam(value = "productId", defaultValue = "-1") String productId, HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        Cart cart = cartRepository.findByBuyerIdAndProductId(buyerId, productId);
        Cart status;
        if (cart == null) {
            cart = new Cart();
            cart.setBuyerId(buyerId);
            cart.setProductId(productId);
            cart.setProductQuantity(1);
            cart.setChecked(1);
            status = cartRepository.save(cart);
        } else {
            Integer productQuantity = cart.getProductQuantity() + 1;
            cart.setProductQuantity(productQuantity);
            status = cartRepository.save(cart);
        }
        if (status != null) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(-1, "加入购物车失败");
        }
    }

    /**
     * 列表
     *
     * @return
     */
    @GetMapping("/list")
    public ResultVO list(HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        List<Cart> carts = cartService.findList(buyerId);
        List<String> procudtIdList = carts.stream()
                .map(e -> e.getProductId())
                .collect(Collectors.toList());
        List<ProductInfo> productInfos = productInfoRepository.findAllByProductIdIn(procudtIdList);
        List<CartVO> cartVOS = new ArrayList<>();
        for (ProductInfo productInfo : productInfos) {
            CartVO cartVO = new CartVO();
            BeanUtils.copyProperties(productInfo, cartVO);
            for (Cart cart : carts) {
                if (productInfo.getProductId().equals(cart.getProductId())) {
                    cartVO.setProductQuantity(cart.getProductQuantity());
                    cartVO.setChecked(cart.getChecked());
                }
            }
            cartVOS.add(cartVO);
        }
        return ResultVOUtil.success(cartVOS);
    }

    /**
     * 从购物车中删除一个商品
     *
     * @param productId
     * @return
     */
    @GetMapping("/del")
    public ResultVO del(@RequestParam(value = "productId", defaultValue = "-1") String productId, HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        Integer delStatus = cartRepository.deleteByBuyerIdAndProductId(buyerId, productId);
        if (delStatus == 1) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(-1, "删除失败");
        }
    }

    /**
     * 编辑购物车
     *
     * @param productId
     * @param quantity
     * @param checked
     * @return
     */
    @GetMapping("/edit")
    public ResultVO edit(@RequestParam(value = "productId", defaultValue = "-1") String productId,
                         @RequestParam(value = "quantity", defaultValue = "-1") Integer quantity,
                         @RequestParam(value = "checked", defaultValue = "-1") Integer checked,
                         HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        Cart cart = cartRepository.findByBuyerIdAndProductId(buyerId, productId);
        if (cart == null) {
            return ResultVOUtil.error(-1, "该用户购物车中没有此商品");
        } else {
            cart.setProductQuantity(quantity);
            cart.setChecked(checked);
            Cart status = cartRepository.save(cart);
            if (status != null) {
                return ResultVOUtil.success();
            } else {
                return ResultVOUtil.error(-1, "编辑购物车失败");
            }
        }
    }

    /**
     * 编辑购物车
     *
     * @param checkAll
     * @return
     */
    @GetMapping("/edit_check_all")
    public ResultVO editCheckAll(@RequestParam(value = "checkAll") Boolean checkAll, HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        List<Cart> carts = cartRepository.findByBuyerIdAndAndChecked(buyerId, 1);
        ;
        if (checkAll) {
            for (Cart cart : carts) {
                cart.setChecked(1);
                cartRepository.save(cart);
            }
        } else {
            for (Cart cart : carts) {
                cart.setChecked(0);
                cartRepository.save(cart);
            }
        }
        return ResultVOUtil.success();
    }

}
