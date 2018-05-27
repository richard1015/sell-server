package com.even.sell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * @author even
 * @description
 * @date 2018/5/18 1:41
 * @memo
 */
@Data
public class UserVO {

    @JsonProperty("userName")
    private String userName;

}
