package com.even.sell.controller;

import com.even.sell.VO.ResultVO;
import com.even.sell.VO.UserVO;
import com.even.sell.dataobject.BuyerInfo;
import com.even.sell.dataobject.Question;
import com.even.sell.enums.ResultEnum;
import com.even.sell.form.LoginForm;
import com.even.sell.repository.BuyerInfoRepository;
import com.even.sell.repository.QuestionRepository;
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

import java.util.Date;

import static com.even.sell.constant.CookieConstant.EXPIRE;


/**
 * @author even
 * @description
 * @date 2018/5/18 0:48
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/buyer/question")
public class QuestionController {


    @Autowired
    private QuestionRepository questionRepository;

    /**
     * 保存问题
     *
     * @param  question
     * @return
     */
    @PostMapping("/insert")
    public ResultVO login(@Valid @RequestBody Question question) {
        question.setCreateTime(new Date());
       Question question1 = questionRepository.save(question);
       return question1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "保存失败");
    }



}

