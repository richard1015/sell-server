package com.even.sell.repository;

import com.even.sell.dataobject.BuyerAddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/24 0:45
 * @memo
 */
public interface BuyerAddressRepository extends JpaRepository<BuyerAddress, String> {

    List<BuyerAddress> findByBuyerId(String buyerId);

    BuyerAddress findById(Integer Id);

    @Transactional
    void deleteById(Integer id);

}
