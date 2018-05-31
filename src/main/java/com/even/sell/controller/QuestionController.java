package com.even.sell.controller;

import com.even.sell.VO.ResultVO;
import com.even.sell.dataobject.Question;
import com.even.sell.repository.QuestionRepository;
import com.even.sell.service.BuyerService;
import com.even.sell.utils.CookieUtil;
import com.even.sell.utils.ResultVOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author even
 * @description
 * @date 2018/5/18 0:48
 * @memo
 */
@CrossOrigin
@RestController
@RequestMapping("/sell/buyer/question")
public class QuestionController {


    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private BuyerService buyerService;

    /**
     * 保存问题
     *
     * @param question
     * @return
     */
    @PostMapping("/insert")
    public ResultVO insert(HttpServletRequest request,@Valid @RequestBody Question question) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        question.setCreateTime(new Date());
        question.setStatus(0);
        question.setBuyerId(buyerId);
        Question question1 = questionRepository.save(question);
        return question1 != null ? ResultVOUtil.success() : ResultVOUtil.error(50000, "保存失败");
    }

    /**
     * 卖家回复问题
     *
     * @param question
     * @return
     */
    @PostMapping("/reply")
    public ResultVO reply(@Valid @RequestBody Question question) {
        question.setUpdateTime(new Date());
        question.setStatus(1);
        int codeRes = questionRepository.updateById(question.getSellerId(), question.getReply(), question.getStatus(), question.getUpdateTime(), question.getId());
        return codeRes > 0 ? ResultVOUtil.success() : ResultVOUtil.error(50000, "回复失败");
    }

    /**
     * 根据买家id查询问题
     *
     * @param
     * @return
     */
    @PostMapping("/findAllByBuyerId")
    public ResultVO findAllByBuyerId(HttpServletRequest request) {
        Cookie cookie = CookieUtil.get(request, "userId");
        String buyerId = buyerService.findBuyerInfoById(cookie.getValue()).getId();
        List<Question> questionList = questionRepository.findByBuyerId(buyerId);
        return questionList.size() > 0 ? ResultVOUtil.success(questionList) : ResultVOUtil.error(50000, "回复失败");
    }

    /**
     * \根据卖家Id进行查询问题
     *
     * @param question
     * @return
     */
    @PostMapping("/findAllBySellerId")
    public ResultVO findAllBySellerId(@Valid @RequestBody Question question) {
        question.setCreateTime(new Date());
        List<Question> questionList = questionRepository.findBySellerId(question.getSellerId());
        return questionList.size() > 0 ? ResultVOUtil.success(questionList) : ResultVOUtil.error(50000, "回复失败");
    }

    /**
     * \根据卖家Id进行查询问题
     *
     *
     * @return
     */
    @GetMapping("/list")
    public ModelAndView findAllBySellerId(Map<String, Object> map) {
        List<Question> questionList = questionRepository.findAll();
        map.put("questionList", questionList);
        return new ModelAndView("feedback/list", map);
    }

    /**
     * 展示
     * @param questionId
     * @param map
     * @return
     */
    @PostMapping("/findById")
    public ResultVO index(@RequestParam(value = "questionId", required = false) String questionId,
                              Map<String, Object> map) {
        if (questionId != null) {
            Question question1 =  questionRepository.findById(Integer.valueOf(questionId));
            return ResultVOUtil.success(question1);
        }else{
            return ResultVOUtil.error(50000,"id不能为空");
        }
    }

}

