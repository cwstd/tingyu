package com.cwstd.controller;


import com.cwstd.pojo.HostPower;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IHostPowerService;
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
@RequestMapping("/hostPower")
public class HostPowerController {
@Autowired
private IHostPowerService iHostPowerService;
    @ResponseBody
    @RequestMapping("addhostpower")
 public HostResult addHostPower(HostPower hostPower){
        boolean b=false;
        System.out.println(hostPower);
        HostResult hostResult = new HostResult();
        if(hostPower.getHpid()==null){
            b = hostPower.insert();
            hostResult.setMsg("添加主持人权限成功！");
        }else {
            b = hostPower.updateById();
            hostResult.setMsg("更新主持人权限成功！");
        }
        if(b){
            hostResult.setSuccess(b);


        }else {
            hostResult.setSuccess(b);
            hostResult.setMsg("添加失败！请重新添加");
        }
        return hostResult;
 }
}

