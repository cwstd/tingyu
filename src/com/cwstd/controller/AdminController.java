package com.cwstd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cwstd.pojo.Admin;
import com.cwstd.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService iadminService;
    @RequestMapping("userLogin")
    public String userLogin(String aname, String apwd, HttpSession session){
        //创建条件构造器
        QueryWrapper<Admin> objectQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("aname",aname);
        objectQueryWrapper.eq("apwd",apwd);

        Admin one = iadminService.getOne(objectQueryWrapper);
        if(one==null){
            session.setAttribute("msg","loginFail");
            return"redirect:/login.jsp";
        }else{
            session.setAttribute("admin",one);
        }
        return"redirect:/main.jsp";
    }
}

