package com.even.sell.repository;

import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.dataobject.Question;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author EVEN
 * 2018/5/1 19:34
 */
public interface QuestionRepository extends JpaRepository<Question, String> {



  /*  @Modifying
    @Query("update buyer_info as c set c.name = ?1 where c.userid=?2")
    BuyerInfo updateByUsername(@Valid BuyerInfo buyerInfo);*/
}
