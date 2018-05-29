package com.even.sell.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author even
 * @description Vue登录页面demo信息对象实体
 * @date 2018/5/5 21:06
 * @memo
 */
@Data
public class LoginForm {

    @NotNull(message="用户名不允许为空")
    private String userName;

    @NotNull(message="密码不允许为空")
    private String userPwd;

}
