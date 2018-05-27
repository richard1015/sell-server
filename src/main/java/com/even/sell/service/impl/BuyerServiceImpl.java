package com.even.sell.service.impl;

import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.repository.BuyerInfoRepository;
import com.even.sell.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
