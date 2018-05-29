package com.even.sell.repository;

import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.dataobject.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

/**
 * @author EVEN
 * 2018/5/1 19:34
 */
public interface QuestionRepository extends JpaRepository<Question, String> {


    @Transactional
    @Modifying
    @Query("update Question as q set q.sellerId = ?1,q.reply=?2,q.status = ?3,q.updateTime=?4 where q.id=?5")
    int updateById(String sellId, String reply, int status, Date updateTime, int id);

    public List<Question> findByBuyerId(String buyerId);

    public List<Question> findBySellerId(String sellerId);


  /*  @Modifying
    @Query("update buyer_info as c set c.name = ?1 where c.userid=?2")
    BuyerInfo updateByUsername(@Valid BuyerInfo buyerInfo);*/
}
