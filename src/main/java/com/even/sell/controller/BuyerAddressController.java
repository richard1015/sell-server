package com.even.sell.controller;

import com.even.sell.VO.AddressVO;
import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.BuyerAddress;
import com.even.sell.repository.BuyerAddressRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


/**
 * @author even
 * @description
 * @date 2018/5/22 1:55
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/address")
public class BuyerAddressController {

    @Autowired
    private BuyerService buyerService;

    @Autowired
    private BuyerAddressRepository buyerAddressRepository;

    /**
     * 列表
     *
     * @return
     */
    @GetMapping("/list")
    public ResultVO list(HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        List<BuyerAddress> buyerAddresses = buyerAddressRepository.findByBuyerId(buyerId);
        List<AddressVO> addressVOS = new ArrayList<>();
        for (BuyerAddress buyerAddress : buyerAddresses) {
            AddressVO addressVO = new AddressVO();
            BeanUtils.copyProperties(buyerAddress, addressVO);
            addressVOS.add(addressVO);
        }
        return ResultVOUtil.success(addressVOS);
    }

    /**
     * 设置默认地址
     *
     * @return
     */
    @GetMapping("/set_default")
    public ResultVO setDefault(@RequestParam(value = "addressId") Integer addressId, HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        List<BuyerAddress> buyerAddresses = buyerAddressRepository.findByBuyerId(buyerId);
        for (BuyerAddress buyerAddress : buyerAddresses) {
            if (buyerAddress.getId().equals(addressId)) {
                buyerAddress.setDefault(true);
            } else {
                buyerAddress.setDefault(false);
            }
            buyerAddressRepository.save(buyerAddress);
        }
        return ResultVOUtil.success();
    }

    /**
     * 删除地址
     *
     * @return
     */
    @GetMapping("/del")
    public ResultVO del(@RequestParam(value = "addressId") Integer addressId, HttpServletRequest request) {
        buyerAddressRepository.deleteById(addressId);
        return ResultVOUtil.success();
    }

    /**
     * 添加地址
     *
     * @return
     */
    @PostMapping("/add")
    public ResultVO add(@RequestBody BuyerAddress buyerAddress, HttpServletRequest request) {
        BuyerAddress buyerAddress1 = buyerAddressRepository.save(buyerAddress);
        return buyerAddress1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "修改失败");
    }

}
