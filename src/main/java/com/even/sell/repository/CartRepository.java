package com.even.sell.repository;

import com.even.sell.dataobject.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author even
 * @description
 * @date 2018/5/22 0:40
 * @memo
 */
public interface CartRepository extends JpaRepository <Cart,String>,JpaSpecificationExecutor<Cart> {

    List<Cart> findCartsByBuyerId(String buyerId);

    @Transactional
    Integer deleteByBuyerIdAndProductId(String buyerId, String productId);

    Cart findByBuyerIdAndProductId(String buyerId, String productId);

    List<Cart> findAllByBuyerId(String buyerId);

    List<Cart> findByBuyerIdAndAndChecked(String buyerId, Integer checked);

}
