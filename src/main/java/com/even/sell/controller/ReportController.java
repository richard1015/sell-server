package com.even.sell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;
@Controller
@RequestMapping("/seller/report")
public class ReportController {
    /**
     * 查询列表
     *
     *
     * @return
     */
    @GetMapping("/list")
    public ModelAndView list(Map<String, Object> map) {
        map.put("list", "");
        map.put("list", "");
        map.put("list", "");
        return new ModelAndView("report/list", map);
    }
}
