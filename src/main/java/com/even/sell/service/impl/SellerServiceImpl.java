package com.even.sell.service.impl;

import com.even.sell.dataobject.SellerInfo;
import com.even.sell.repository.SellerInfoRepository;
import com.even.sell.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author EVEN
 * 2018/5/1 19:38
 */
@Service
public class SellerServiceImpl implements SellerService {

    @Autowired
    private SellerInfoRepository repository;

    @Override
    public SellerInfo findSellerInfoByOpenid(String openid) {
        return repository.findByOpenid(openid);
    }
}
