package com.even.sell.dataobject;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

/**
 * @author EVEN
 * 2018/5/1 19:33
 */
@Data
@Entity
public class SellerInfo {
    @Id
    private String id;

    private String username;

    private String password;

    private String openid;
}
