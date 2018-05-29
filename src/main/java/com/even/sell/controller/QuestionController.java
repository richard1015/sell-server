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
import org.springframework.data.domain.Pageable;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import java.util.Date;
import java.util.List;

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
    public ResultVO insert(@Valid @RequestBody Question question) {
        question.setCreateTime(new Date());
        question.setStatus(0);
       Question question1 = questionRepository.save(question);
       return question1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "保存失败");
    }

    /**
     * 卖家回复问题
     *
     * @param  question
     * @return
     */
    @PostMapping("/reply")
    public ResultVO reply(@Valid @RequestBody Question question) {
        question.setUpdateTime(new Date());
        int codeRes = questionRepository.updateById(question.getSellerId(),question.getReply(),question.getStatus(),question.getUpdateTime(),question.getId());
        return codeRes >0 ? ResultVOUtil.success() : ResultVOUtil.error(50000, "回复失败");
    }

    /**
     * 根据买家id查询问题
     *
     * @param  question
     * @return
     */
    @PostMapping("/findAllByBuyerId")
    public ResultVO findAllByBuyerId(@Valid @RequestBody Question question) {
        question.setCreateTime(new Date());
        List<Question> questionList = questionRepository.findByBuyerId(question.getBuyerId());
        return questionList.size() >0 ? ResultVOUtil.success(questionList) : ResultVOUtil.error(50000, "回复失败");
    }

    /**
     * \根据卖家Id进行查询问题
     * @param question
     * @return
     */
    @PostMapping("/findAllBySellerId")
    public ResultVO findAllBySellerId(@Valid @RequestBody Question question) {
        question.setCreateTime(new Date());
        List<Question> questionList = questionRepository.findBySellerId(question.getSellerId());
        return questionList.size() >0 ? ResultVOUtil.success(questionList) : ResultVOUtil.error(50000, "回复失败");
    }



}

