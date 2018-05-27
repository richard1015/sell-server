package com.even.sell.dataobject;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;


/**
 * @author EVEN
 * 2018/4/14 19:35
 */
@Entity
@DynamicUpdate
@Data
public class Cart {

    /**
     * 类目id.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cartId;

    private String buyerId;

    private String productId;

    private Integer productQuantity;

    private Integer checked;

    private Date createTime;

    private Date updateTime;

    public Cart() {
    }

    public Cart(String buyerId, String productId) {
        this.buyerId = buyerId;
        this.productId = productId;
    }
}
