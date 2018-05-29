package com.even.sell.service;

import com.even.sell.dataobject.SellerInfo;

/**
 * 卖家端
 * @author EVEN
 * 2018/5/1 19:32
 */
public interface SellerService {

    /**
     * 通过openid查询卖家端信息
     * @param openid
     * @return
     */
    SellerInfo findSellerInfoByOpenid(String openid);

}
