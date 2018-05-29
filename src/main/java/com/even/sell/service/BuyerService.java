package com.even.sell.service;

import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.form.LoginForm;

import javax.validation.Valid;

/**
 * 买家用户
 *
 * @author EVEN
 * 2018/5/1 19:32
 */
public interface BuyerService {

    BuyerInfo findBuyerInfoById(String id);

    BuyerInfo findBuyerInfoByUsername(String unsername);

    ResultVO insert(@Valid BuyerInfo buyerInfo);
}
