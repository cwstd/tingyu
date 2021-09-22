package com.cwstd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.PageResult;
import com.cwstd.pojo.Role;
import com.cwstd.pojo.RoleMenu;
import com.cwstd.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;
    @ResponseBody
    @RequestMapping("roleInfo")
    public PageResult<Role> roleInfo(Integer page,Integer rows){
        IPage<Role> iPage=new Page<>(page,rows);
        PageResult<Role> objectPageResult = new PageResult<>();
        Role role = new Role();
        IPage<Role> roleIPage = role.selectPage(iPage, null);
        List<Role> list=roleIPage.getRecords();
        for(Role role1:list){
            QueryWrapper<RoleMenu> queryWrapper = new QueryWrapper();
            queryWrapper.select("mid");
            queryWrapper.eq("rid",role1.getRid());
            RoleMenu roleMenu = new RoleMenu();
            List<RoleMenu> roleMenus = roleMenu.selectList(queryWrapper);
            List<Integer> list1=new ArrayList<>();
            for(RoleMenu r:roleMenus){
                list1.add(r.getMid());
            }
            role1.setList(list1);
        }
        objectPageResult.setTotal(roleIPage.getTotal());
        objectPageResult.setRows(list);
        System.out.println(list);
        return objectPageResult;
    }

    @ResponseBody
    @RequestMapping("addRole")
    public HostResult addRole(Role role,String mids){
        System.out.println(role);
        System.out.println(mids);
        HostResult hostResult = roleService.inserRole(role, mids);
        return hostResult;
    }

    @ResponseBody
    @RequestMapping("updateRole")
    public HostResult updateRole(Role role,String mids){
        System.out.println(role);
        System.out.println(mids);
        HostResult hostResult = roleService.updateRole(role, mids);
        return hostResult;
    }

    @ResponseBody
    @RequestMapping("deleteRole")
    public HostResult deleteRole(Integer rid){
        HostResult hostResult = new HostResult();
        Role role = new Role();
        role.setRid(rid);
        boolean b = role.deleteById();
        QueryWrapper <RoleMenu> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("rid",rid);
        RoleMenu roleMenu = new RoleMenu();
        boolean delete = roleMenu.delete(queryWrapper);
        if(delete && b){
            hostResult.setSuccess(true);
            hostResult.setMsg("清除角色信息成功!");
            return hostResult;
        }
        hostResult.setSuccess(false);
        hostResult.setMsg("清除角色信息失败!");
        return hostResult;
    }
}

