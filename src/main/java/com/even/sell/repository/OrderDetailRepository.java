package com.even.sell.repository;

import com.even.sell.dataobject.OrderDetail;
import com.even.sell.dataobject.ProductToji;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author EVEN
 * 2018/4/14 19:40
 */
public interface OrderDetailRepository extends JpaRepository<OrderDetail, String> {

    List<OrderDetail> findByOrderId(String orderId);

    @Query(value="select count (od.orderId) as count,od.productName  from OrderDetail as od GROUP by od.productName")
    List<Object[]> findGroupByProductName();
}
