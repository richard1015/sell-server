package com.even.sell.controller;

import com.even.sell.VO.ResultVO;
import com.even.sell.VO.UserVO;
import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.enums.ResultEnum;
import com.even.sell.form.LoginForm;
import com.even.sell.repository.BuyerInfoRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import static com.even.sell.constant.CookieConstant.EXPIRE;


/**
 * @author even
 * @description
 * @date 2018/5/18 0:48
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer")
public class BuyerUserController {

    @Autowired
    private BuyerService buyerService;

    @Autowired
    private BuyerInfoRepository buyerInfoRepository;

    /**
     * 买家登陆
     *
     * @param loginForm
     * @return
     */
    @PostMapping("/login")
    public ResultVO login(@Valid @RequestBody LoginForm loginForm, HttpServletResponse response, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            String message = String.format("登陆失败，详细信息[%s]。", bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(ResultEnum.LOGIN_FAIL.getCode(), message);
        }
        BuyerInfo buyerInfo = buyerService.findBuyerInfoByUsername(loginForm.getUserName());
        if (buyerInfo == null) {
            return ResultVOUtil.error(ResultEnum.LOGIN_FAIL.getCode(), ResultEnum.LOGIN_FAIL.getMessage());
        } else {
            UserVO userVO = new UserVO();
            userVO.setUserName(buyerInfo.getUsername());
            if (buyerInfo.getPassword().equals(loginForm.getUserPwd())) {
                CookieUtil.set(response, "userId", buyerInfo.getId(), EXPIRE);
                return ResultVOUtil.success(buyerInfo);
            } else {
                return ResultVOUtil.error(ResultEnum.LOGIN_FAIL.getCode(), ResultEnum.LOGIN_FAIL.getMessage());
            }
        }
    }

    /**
     * 买家登出
     *
     * @return
     */
    @GetMapping("/logout")
    public ResultVO logout(HttpServletRequest request,
                           HttpServletResponse response) {
        //1. 从cookie里查询
        Cookie cookie = CookieUtil.get(request, "userId");
        if (cookie != null) {
            //2. 清除cookie
            CookieUtil.set(response, "userId", null, 0);
        }
        return ResultVOUtil.success();
    }

    /**
     * 买家检查登陆状态
     *
     * @return
     */
    @GetMapping("/check_login")
    public ResultVO checkLogin(HttpServletRequest request) {
        //1. 从cookie里查询
        Cookie cookie = CookieUtil.get(request, "userId");
        if (cookie != null) {
            UserVO userVO = new UserVO();
            userVO.setUserName(buyerService.findBuyerInfoById(cookie.getValue()).getUsername());
            return ResultVOUtil.success(userVO);
        } else {
            return ResultVOUtil.error(-1, "未登录");
        }
    }

    /**
     * 买家检查登陆状态
     *
     * @return
     */
    @PostMapping("/register")
    public ResultVO register(HttpServletRequest request, @Valid @RequestBody BuyerInfo buyerInfo) {
        //1. 从cookie里查询
        if (buyerInfo.getId() == null) {
            buyerInfo.setId("id_" + buyerInfo.getUsername());
        }
        BuyerInfo buyerInfo0 = buyerInfoRepository.findByUsername(buyerInfo.getUsername());
        if (buyerInfo0 == null) {
            BuyerInfo buyerInfo1 = buyerInfoRepository.save(buyerInfo);
            return buyerInfo1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "注册失败");
        } else {
            return ResultVOUtil.error(50001, "该用户名已经注册过了");
        }

    }


    /**
     * 修改
     *
     * @return
     */
    @PostMapping("/update")
    public ResultVO update(HttpServletRequest request, @Valid @RequestBody BuyerInfo buyerInfo) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        int res = buyerInfoRepository.updateById(buyerInfo.getTel(), buyerInfo.getEmail(), buyerInfo.getSex(), buyerId);
        return res > 0 ? ResultVOUtil.success() : ResultVOUtil.error(50000, "注册失败");
    }

}

