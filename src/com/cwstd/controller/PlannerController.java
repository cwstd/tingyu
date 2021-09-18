package com.cwstd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.PageResult;
import com.cwstd.pojo.Planner;
import com.cwstd.service.IPlannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    @Autowired
    private IPlannerService iPlannerService;
    @ResponseBody
    @RequestMapping("plannerInfo")
    public PageResult<Planner> plannerInfo(Integer cid){
        System.out.println(cid);
        PageResult<Planner> objectPageResult = new PageResult<>();
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("cid",cid);
        List<Planner> list = iPlannerService.list(queryWrapper);
        objectPageResult.setTotal(0L);
        objectPageResult.setRows(list);
        return objectPageResult;
    }


}

