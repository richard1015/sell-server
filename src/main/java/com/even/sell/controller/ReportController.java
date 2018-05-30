package com.even.sell.controller;

import com.even.sell.dataobject.ProductToji;
import com.even.sell.dataobject.Question;
import com.even.sell.repository.OrderDetailRepository;
import com.even.sell.repository.OrderMasterRepository;
import com.even.sell.repository.QuestionRepository;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/seller/report")
public class ReportController {


    @Autowired
    private OrderMasterRepository orderMasterRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private QuestionRepository questionRepository;

    /**
     * 查询列表
     *
     * @return
     */
    @GetMapping("/list")
    public ModelAndView list(Map<String, Object> map) {

        Gson gson = new Gson();
        List<Object[]> objectList0 = orderDetailRepository.findGroupByProductName();
        ProductToji productToji0 = new ProductToji();
        List<String> rows = new ArrayList<>();
        List<String> names = new ArrayList<>();
        for (Object[] object : objectList0) {
            names.add((String) object[1]);
            rows.add(((Long) object[0]).toString());
        }

        productToji0.setNames(names);
        productToji0.setRows(rows);

        map.put("shopsList", gson.toJson(productToji0));


        List<Object[]> objectList1 = orderMasterRepository.findGroupBuyerAddress();
        ProductToji productToji1 = new ProductToji();
        rows = new ArrayList<>();
        names = new ArrayList<>();
        for (Object[] object : objectList1) {
            names.add((String) object[1]);
            rows.add(((Long) object[0]).toString());
        }
        productToji1.setNames(names);
        productToji1.setRows(rows);

        map.put("citysList", gson.toJson(productToji1));


        List<Object[]> objectList2 = questionRepository.findGroupByUsername();
        ProductToji productToji2 = new ProductToji();
        rows = new ArrayList<>();
        names = new ArrayList<>();
        for (Object[] object : objectList2) {
            names.add((String) object[1]);
            rows.add(((Long) object[0]).toString());
        }
        productToji2.setNames(names);
        productToji2.setRows(rows);
        String sss = gson.toJson(productToji2).toString();
        map.put("nameList", gson.toJson(productToji2).toString());
        return new ModelAndView("report/list", map);
    }
}
