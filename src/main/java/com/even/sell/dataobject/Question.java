package com.even.sell.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * @author EVEN
 * 2018/5/1 19:33
 */
@Data
@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    private String comment;

    private String reply;

    private Date createTime;

    private Date updateTime;

}
