package com.cwstd.controller;


import com.cwstd.pojo.Admin;
import com.cwstd.pojo.TreeResult;
import com.cwstd.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService iMenuService;
    @ResponseBody
    @RequestMapping("menuInfo")
    public List<TreeResult> manuInfo(@RequestParam(defaultValue = "0") String id, HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        Integer aid = admin.getAid();
        List<TreeResult> list=iMenuService.selMenuInfoService(id,aid);
        return list;
    }
}

