package com.cwstd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.MarriedPerson;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IMarriedPersonService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/marriedPerson")
public class MarriedPersonController {
    @Autowired
    private IMarriedPersonService iMarriedPersonService;
    @ResponseBody
    @RequestMapping("marriedPersonInfo")
    public PageResult<MarriedPerson> marriedPersonInfo(Integer page,Integer rows,String pname,String phone){
        PageResult<MarriedPerson> result = new PageResult<>();
        PageResult<MarriedPerson> marriedPersonPageResult = iMarriedPersonService.selectAll(page, rows, pname, phone);
        return marriedPersonPageResult;
    }

}

