package com.cwstd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.MarriedPerson;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IMarriedPersonService;
import com.cwstd.util.TenXunCloud;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

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
    @ResponseBody
    @RequestMapping("personLogin")
    public MarriedPerson personLogin(String phone,String ppwd ){
        QueryWrapper<MarriedPerson> queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone",phone);
        queryWrapper.eq("ppwd",ppwd);
        MarriedPerson one = iMarriedPersonService.getOne(queryWrapper);
        return one;
    }

    @ResponseBody
    @RequestMapping("reg")
    public HostResult reg(MarriedPerson marriedPerson,String code,HttpSession session){
        String rcode=(String)session.getAttribute("code");
        System.out.println(rcode);
        HostResult hostResult = new HostResult();
        if(code.equals(rcode)){
            marriedPerson.setRegdate(LocalDateTime.now());
            marriedPerson.setMarrydate(LocalDate.now());
            marriedPerson.setStatus("1");
            marriedPerson.insert();
            hostResult.setSuccess(true);
            hostResult.setMsg("成功！");
        }else {
            System.out.println("asdasdaasdasd");
            hostResult.setSuccess(false);
            hostResult.setMsg("失败！");
        }
        session.removeAttribute("code");
        return hostResult;
    }

    @ResponseBody
    @RequestMapping("personCode")
    public String personCode(String phonenumber, HttpSession session){
        String res="NO";
        TenXunCloud tenXunCloud = new TenXunCloud();
        String str="0123456789";
        StringBuilder sb=new StringBuilder(6);
        for(int i=0;i<6;i++)
        {
            char ch=str.charAt(new Random().nextInt(str.length()));
            sb.append(ch);
        }
        System.out.println(sb.toString());
        boolean b = tenXunCloud.sendCode(sb.toString(), phonenumber);
        if(b){
            session.setAttribute("code",sb.toString());
            res="OK";
        }

        return res;
    }
}

