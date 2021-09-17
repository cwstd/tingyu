package com.cwstd.controller;


import com.cwstd.pojo.PageResult;
import com.cwstd.pojo.Planner;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Controller
@RequestMapping("/planner")
public class PlannerController {
    @ResponseBody
    @RequestMapping("plannerInfo")
    public PageResult<Planner> plannerInfo(Integer page,Integer rows){
        PageResult<Planner> plannerPageResult = new PageResult<>();

        return plannerPageResult;
    }

}

