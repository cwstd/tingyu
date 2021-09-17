package com.cwstd.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Company;
import com.cwstd.pojo.CompanyConfig;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
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
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    private ICompanyService iCompanyService;
    @ResponseBody
    @RequestMapping("companyInfo")
    public PageResult<Company> companyInfo(Integer page, Integer rows, CompanyConfig companyConfig){

        System.out.println(companyConfig);
        PageResult<Company> companyPageResult = iCompanyService.selInfo(page, rows, companyConfig);
        System.out.println(companyPageResult.toString());
        return companyPageResult ;
    }
    @ResponseBody
    @RequestMapping("addCompany")
    public HostResult addCompany(Company company){
        HostResult hostResult = new HostResult();
        company.setStarttime(LocalDateTime.now());
        company.setStatus("1");
        boolean insert = company.insert();
        hostResult.setSuccess(insert);
        if(insert){
            hostResult.setMsg("添加公司信息成功！");
        }else{
            hostResult.setMsg("添加公司信息失败！");
        }
        return hostResult;
    }
    @ResponseBody
    @RequestMapping("changeStatus")
    public HostResult changeStatus(String cids,String status){
        HostResult hostResult = new HostResult();
        String[] split = cids.split(",");
        Company company = new Company();
        company.setStatus(status);
        for(int i=0;i<split.length;i++){
            company.setCid(Integer.valueOf(split[i]));
            boolean b = company.updateById();
            if(b=false){
                hostResult.setSuccess(false);
                hostResult.setMsg("修改公司状态失败！");
                return hostResult;
            }
        }
        hostResult.setSuccess(true);
        hostResult.setMsg("修改公司状态成功！");
        return hostResult;
    }
}

