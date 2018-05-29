package com.even.sell.controller;

import com.even.sell.VO.OrderMasterVO;
import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.BuyerAddress;
import com.even.sell.dataobject.Cart;
import com.even.sell.dataobject.OrderDetail;
import com.even.sell.dataobject.OrderMaster;
import com.even.sell.dto.OrderDTO;
import com.even.sell.enums.ResultEnum;
import com.even.sell.form.CartForm;
import com.even.sell.form.CartInfo;
import com.even.sell.form.OrderForm;
import com.even.sell.repository.BuyerAddressRepository;
import com.even.sell.repository.CartRepository;
import com.even.sell.repository.OrderDetailRepository;
import com.even.sell.repository.OrderMasterRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.service.OrderService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.KeyUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/26 17:29
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/order")
public class BuyerOrderController {

    @Autowired
    private BuyerService buyerService;

    @Autowired
    private OrderMasterRepository orderMasterRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private BuyerAddressRepository buyerAddressRepository;

    /**
     * 列表
     *
     * @param
     * @return
     */
    @GetMapping("/order_total")
    public ResultVO orderTotal(@RequestParam(value = "orderId") String orderId) {
        List<OrderMaster> orderMasters = orderMasterRepository.findByOrderId(orderId);
        OrderMasterVO orderMasterVO = new OrderMasterVO();
        for (OrderMaster orderMaster : orderMasters) {
            BeanUtils.copyProperties(orderMaster, orderMasterVO);
        }
        return ResultVOUtil.success(orderMasterVO);
    }


    /**
     * 列表
     *
     * @param orderId
     * @return
     */
    @GetMapping("/list")
    public ResultVO orderTotal1(  @RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", defaultValue = "8") Integer size,
                                  @RequestParam(value = "sort", defaultValue = "1") Integer sort,
                                  @RequestParam(value = "buyerOpenid", defaultValue = "1") String buyerOpenid) {
        PageRequest pageRequest = new PageRequest(page-1,size);
        Page<OrderDTO> page1= orderService.findList("id_even",pageRequest);

        return ResultVOUtil.success(page1);
    }

    /**
     * 新订单
     *
     * @param
     * @param
     * @return
     */
    @PostMapping("/new")
    public ResultVO newOrder(@Valid @RequestBody CartForm cartForm, HttpServletRequest request, BindingResult bindingResult) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        BuyerAddress buyerAddress = buyerAddressRepository.findById(cartForm.getAddressId());
        OrderMaster orderMaster = new OrderMaster();
        String orderId = KeyUtil.genUniqueKey();
        orderMaster.setOrderId(orderId);
        orderMaster.setBuyerName(buyerAddress.getRecName());
        orderMaster.setBuyerPhone(buyerAddress.getTel());
        orderMaster.setBuyerAddress(buyerAddress.getStreetName());
        orderMaster.setBuyerOpenid(buyerId);
        BigDecimal amount = new BigDecimal(0);
        for (CartInfo cartInfo : cartForm.getCartInfos()) {
            if (cartInfo.getChecked() == 1) {
                amount = amount.add(cartInfo.getPrice().multiply(new BigDecimal(cartInfo.getQuantity())));
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setDetailId(KeyUtil.genUniqueKey());
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(cartInfo.getId());
                orderDetail.setProductName(cartInfo.getName());
                orderDetail.setProductIcon(cartInfo.getIcon());
                orderDetail.setProductPrice(cartInfo.getPrice());
                orderDetail.setProductQuantity(cartInfo.getQuantity());
                orderDetailRepository.save(orderDetail);
            }
        }
        orderMaster.setOrderAmount(amount);
        orderMaster.setPayStatus(0);
        orderMaster.setPayStatus(1);
        orderMasterRepository.save(orderMaster);
        return ResultVOUtil.success(orderMaster);
    }

}
