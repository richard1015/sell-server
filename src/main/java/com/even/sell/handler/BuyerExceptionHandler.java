package com.even.sell.handler;

import com.even.sell.VO.ResultVO;
import com.even.sell.exception.BuyerAuthorizeException;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author EVEN
 * 2018/5/1 20:18
 */
@ControllerAdvice
public class BuyerExceptionHandler {

//    @Autowired
//    private ProjectUrlConfig projectUrlConfig;

    //拦截登录异常
    @ExceptionHandler(value = BuyerAuthorizeException.class)
    public ResultVO handlerAuthorizeException() {
        return ResultVOUtil.error(-1,"未登陆");
    }
}
