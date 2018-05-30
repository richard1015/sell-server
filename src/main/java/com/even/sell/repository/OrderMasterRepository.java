package com.even.sell.repository;

import com.even.sell.dataobject.OrderMaster;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author EVEN
 * 2018/4/14 19:40
 */
public interface OrderMasterRepository extends JpaRepository<OrderMaster, String> {

    Page<OrderMaster> findByBuyerOpenid(String buyerOpenid, Pageable pageable);

    List<OrderMaster> findByOrderId(String orderId);

    @Query(value="select count (om.orderId) as count,om.buyerAddress  from OrderMaster as om GROUP by om.buyerAddress")
    List<Object[]> findGroupBuyerAddress();
}
