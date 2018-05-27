package com.even.sell.repository;

import com.even.sell.dataobject.BuyerInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author EVEN
 * 2018/5/1 19:34
 */
public interface BuyerInfoRepository extends JpaRepository<BuyerInfo, String> {
    BuyerInfo findByUsername(String username);
}
