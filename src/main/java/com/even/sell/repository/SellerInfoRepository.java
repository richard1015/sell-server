package com.even.sell.repository;

import com.even.sell.dataobject.SellerInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.Date;

/**
 * @author EVEN
 * 2018/5/1 19:34
 */
public interface SellerInfoRepository extends JpaRepository<SellerInfo, String> {
    SellerInfo findByOpenid(String openid);

    SellerInfo findByUsernameAndPassword(String username, String password);

    @Transactional
    @Modifying
    @Query("update SellerInfo as s set s.tel = ?1,s.email=?2,s.updateTime=?3 where s.id=?4")
    int updateById(String tel, String email, Date updateTime, String id);
}
