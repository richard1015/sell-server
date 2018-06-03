package com.even.sell.controller;

import com.even.sell.VO.ResultVO;
import com.even.sell.constant.CookieConstant;
import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.dataobject.ProductCategory;
import com.even.sell.dataobject.SellerInfo;
import com.even.sell.enums.ResultEnum;
import com.even.sell.exception.SellException;
import com.even.sell.form.CategoryForm;
import com.even.sell.repository.SellerInfoRepository;
import com.even.sell.service.SellerService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.*;

/**
 * 卖家用户
 *
 * @author EVEN
 * 2018/5/1 19:29
 */
@Controller
@RequestMapping("/sell/seller")
public class SellerUserController {

    @Autowired
    private SellerService sellerService;

    @Autowired
    private SellerInfoRepository sellerInfoRepository;

//    @Autowired
//    private StringRedisTemplate redisTemplate;

//    @Autowired
//    private ProjectUrlConfig projectUrlConfig;



    @PostMapping("/login")
    @ResponseBody
    public ResultVO login(
            HttpServletResponse response, @RequestBody SellerInfo sellerInfo) {

        //1. openid去和数据库里的数据匹配
        SellerInfo sellerInfo1 = sellerInfoRepository.findByUsernameAndPassword(sellerInfo.getUsername(), sellerInfo.getPassword());
//        if (sellerInfo == null) {
//            map.put("msg", ResultEnum.LOGIN_FAIL.getMessage());
//            map.put("url", "/sell/seller/order/list");
//            return new ModelAndView("common/error");
//        }
//
//        //2. 设置token至redis
        String token = UUID.randomUUID().toString();
////        Integer expire = RedisConstant.EXPIRE;
////
////        redisTemplate.opsForValue().set(String.format(RedisConstant.TOKEN_PREFIX, token), openid, expire, TimeUnit.SECONDS);
//
//        //3. 设置token至cookie
//        CookieUtil.set(response, CookieConstant.TOKEN, token, EXPIRE);
        return sellerInfo1 != null ? ResultVOUtil.success(sellerInfo1) : ResultVOUtil.error(50000, "失败");
//        //return new ModelAndView("redirect:" + projectUrlConfig.getSell() + "/sell/seller/order/list");
//        return new ModelAndView("redirect:" + "/sell/seller/order/list");
    }

    @GetMapping("/findAll")
    @ResponseBody
    public ResultVO findAll(HttpServletResponse response) {

        //1. openid去和数据库里的数据匹配
        List<SellerInfo> sellerInfoList = sellerInfoRepository.findAll();
        return sellerInfoList.size() > 0 ? ResultVOUtil.success(sellerInfoList) : ResultVOUtil.error(50000, "失败");
    }


    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request,
                               HttpServletResponse response,
                               Map<String, Object> map) {
        //1. 从cookie里查询
        Cookie cookie = CookieUtil.get(request, CookieConstant.TOKEN);
        if (cookie != null) {
//            //2. 清除redis
//            redisTemplate.opsForValue().getOperations().delete(String.format(RedisConstant.TOKEN_PREFIX, cookie.getValue()));

            //3. 清除cookie
            CookieUtil.set(response, CookieConstant.TOKEN, null, 0);
        }

//        map.put("msg", ResultEnum.LOGOUT_SUCCESS.getMessage());
//        map.put("url", "/sell/seller/login");
        return new ModelAndView("login/login");
    }


    @GetMapping("/toLogin")
    public ModelAndView toLogin() {
        return new ModelAndView("login/login");
    }


    /**
     * 修改
     *
     * @return
     */
    @PostMapping("/update")
    @ResponseBody
    public ResultVO update(HttpServletRequest request, @Valid @RequestBody SellerInfo sellerInfo) {
        sellerInfo.setUpdateTime(new Date());
        int res = sellerInfoRepository.updateById(sellerInfo.getTel(), sellerInfo.getEmail(), sellerInfo.getUpdateTime(),sellerInfo.getPassword(),sellerInfo.getUsername(), sellerInfo.getId());
        return res > 0 ? ResultVOUtil.success() : ResultVOUtil.error(50000, "修改失败");
    }

    /**
     *
     *
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public ResultVO register(HttpServletRequest request, @Valid @RequestBody SellerInfo sellerInfo) {
        if (sellerInfo.getId() == null|| "".equals(sellerInfo.getId())) {
            sellerInfo.setId("id_" + sellerInfo.getUsername());
        }
        SellerInfo sellerInfo0 = sellerInfoRepository.findByUsername(sellerInfo.getUsername());
        if (sellerInfo0 == null) {
            SellerInfo sellerInfo1 = sellerInfoRepository.save(sellerInfo);
            return sellerInfo1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "添加失败");
        } else {
            return ResultVOUtil.error(50001, "该用户名已经注册过了");
        }
    }

    /**
     * 获取用户列表
     **/
    @GetMapping("/user/list")
    public ModelAndView logout(Map<String, Object> map) {
        List<SellerInfo> sellerInfoList = sellerInfoRepository.findAll();
        map.put("userList", sellerInfoList);
        return new ModelAndView("user/list", map);
    }

    /**
     * 展示
     *
     * @param id
     * @param map
     * @return
     */
    @GetMapping("/user/index")
    public ModelAndView index(@RequestParam(value = "id", required = false) String id, Map<String, Object> map) {
        if (id != null) {
            Optional<SellerInfo> sellerInfoOptional = sellerInfoRepository.findById(id);
            SellerInfo sellerInfo = sellerInfoOptional.get();
            map.put("user", sellerInfo);
        } else {
            map.put("user", new SellerInfo());
        }
        return new ModelAndView("user/index", map);
    }
}
