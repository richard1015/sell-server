package com.even.sell.aspect;

import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * @author EVEN
 * 2018/5/1 20:18
 */
@Aspect
@Component
@Slf4j
public class BuyerAuthorizeAspect {


    @Pointcut("execution(public * com.even.sell.controller.BuyerCartController.add(..))"
            //+ "&& !execution(public * com.even.sell.controller.BuyerCartController.*(..))"
    )
    public void verify() {
    }

    @Around("verify()")
    public Object aroundMethod(ProceedingJoinPoint pjp) throws Throwable {
        Object result = null;
        String methodName = pjp.getSignature().getName();
        try {
            //前置通知
            System.out.println("The method " + methodName + " begins with " + Arrays.asList(pjp.getArgs()));
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();
            Cookie cookie = CookieUtil.get(request, "userId");
            if (cookie == null) {
                //未登录
                result = ResultVOUtil.error(-1, "未登陆");
            } else {
                //执行目标方法
                result = pjp.proceed();
            }
            //返回通知
            log.info("The method {} ends with {}", methodName, result);
        } catch (Throwable e) {
            //异常通知
            log.info("The method {} occurs exception: {}", methodName, e);
            throw new RuntimeException(e);
        }
        //后置通知
        log.info("The method {} ends", methodName);
        return result;
    }


}
