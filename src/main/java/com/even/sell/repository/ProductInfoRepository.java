package com.even.sell.repository;

import com.even.sell.dataobject.ProductInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @author EVEN
 * 2018/4/14 22:07
 */
public interface ProductInfoRepository extends JpaRepository<ProductInfo, String>,JpaSpecificationExecutor<ProductInfo> {
    List<ProductInfo> findByProductStatus(Integer productStatus);

    List<ProductInfo> findByProductIdIn(List<String> productIdList);

    List<ProductInfo> findAllByProductIdIn(List<String> productIdList);

}
