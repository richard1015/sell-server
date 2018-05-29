package com.even.sell.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author EVEN
 * 2018/5/1 19:33
 */
@Data
@Entity
public class BuyerInfo {
    @Id
    private String id;

    private String username;

    private String password;

    private String tel;
    private String sex;
    private String email;

}
