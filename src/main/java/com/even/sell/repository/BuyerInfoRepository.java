package com.even.sell.repository;

import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.BuyerInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import javax.validation.Valid;

/**
 * @author EVEN
 * 2018/5/1 19:34
 */
public interface BuyerInfoRepository extends JpaRepository<BuyerInfo, String> {

    BuyerInfo findByUsername(String username);

    @Transactional
    @Modifying
    @Query("update BuyerInfo as c set c.tel = ?1,c.email=?2,c.sex = ?3 where c.id=?4")
    int updateById(String tel, String email, String sex, String id);



}
