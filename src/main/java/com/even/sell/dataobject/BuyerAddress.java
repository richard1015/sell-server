package com.even.sell.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * 买家地址
 * @author EVEN
 * 2018/5/1 19:33
 */
@Data
@Entity
public class BuyerAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String buyerId;

    private String recName;

    private String streetName;

    private String postCode;

    private String tel;

    private boolean isDefault;

    private Date createTime;

    private Date updateTime;

    public BuyerAddress() {
    }
}
