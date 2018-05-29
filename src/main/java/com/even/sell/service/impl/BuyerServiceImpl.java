package com.even.sell.service.impl;

import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.repository.BuyerInfoRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.Valid;

/**
 * @author EVEN
 * 2018/5/1 19:38
 */
@Service
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private BuyerInfoRepository repository;

    @Override
    public BuyerInfo findBuyerInfoById(String id) {
        return repository.findById(id).get();
    }

    @Override
    public BuyerInfo findBuyerInfoByUsername(String username) {
        return repository.findByUsername(username);
    }

    @Override
    public ResultVO insert(BuyerInfo buyerInfo) {
        BuyerInfo buyerInfo1 = repository.save(buyerInfo);
        return buyerInfo1!=null? ResultVOUtil.success():ResultVOUtil.error(50000,"注册失败");
    }

}
