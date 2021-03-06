package com.cwstd.controller;


import com.cwstd.pojo.*;
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
    @ResponseBody
    @RequestMapping("menuAllInfo")
    public List<TreeResult> menuAllInfo(@RequestParam(defaultValue = "0") String id){
        List<TreeResult> list=iMenuService.selAllMenuInfoService(id);
        return list;
    }
    @ResponseBody
    @RequestMapping("menuAllInfo2")
    public List<TreeResult> menuAllInfo2(@RequestParam(defaultValue = "0") String id){
        List<TreeResult> list=iMenuService.selAllMenuInfoService2(id);
        System.out.println(list);
        return list;
    }
    @ResponseBody
    @RequestMapping("addMenu")
    public HostResult addMenu(Menu menu){
        HostResult hostResult = new HostResult();
        menu.setIsparent("0");
        menu.setStatus("0");
        Menu pmenu = new Menu();
        pmenu.setMid(menu.getPid());
        pmenu.setIsparent("1");
        boolean b = pmenu.updateById();
        boolean insert = menu.insert();

        if(b && insert){
            hostResult.setSuccess(true);
            hostResult.setMsg("增加菜单成功！");
        }else{
            hostResult.setSuccess(false);
            hostResult.setMsg("增加菜单失败！");
        }
        return hostResult;
    }
    @ResponseBody
    @RequestMapping("changeMenu")
    public HostResult changeMenu(Menu menu){
        System.out.println(menu);
        HostResult hostResult = new HostResult();
        boolean b = menu.updateById();
        hostResult.setSuccess(b);
        if(b){
            hostResult.setMsg("修改菜单信息成功！");
        }else{
            hostResult.setMsg("修改菜单信息失败！");
        }
        return hostResult;
    }
    @ResponseBody
    @RequestMapping("deleMenu")
    public HostResult deleMenu( Integer mid){
        HostResult hostResult = new HostResult();
        Menu menu = new Menu();
        menu.setMid(mid);
        boolean b = menu.deleteById();
        hostResult.setSuccess(b);
        if(b){
            hostResult.setMsg("删除菜单成功！");
        }else{
            hostResult.setMsg("删除菜单失败！");
        }
        return hostResult;
    }
}

