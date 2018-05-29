package com.even.sell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 购物车
 * @author EVEN
 * 2018/4/15 0:42
 */
@Data
public class AddressVO {

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("recName")
    private String recName;

    @JsonProperty("streetName")
    private String streetName;

    @JsonProperty("postCode")
    private String postCode;

    @JsonProperty("tel")
    private String tel;

    @JsonProperty("isDefault")
    private boolean isDefault;


}
