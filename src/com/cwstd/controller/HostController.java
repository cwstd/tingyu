package com.cwstd.controller;


import com.cwstd.mapper.HostMapper;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.HostConfig;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Controller
@RequestMapping("/host")
public class HostController {
    @Autowired
    private IHostService iHostService;
    @ResponseBody
    @RequestMapping("hostInfo")
    public PageResult<Host> hostInfo(Integer rows, Integer page, HostConfig hostConfig){
        System.out.println(rows);
        System.out.println(hostConfig.toString());
        PageResult<Host> all = iHostService.seleFindAll(rows, page, hostConfig);
        System.out.printf(all.toString());
        return all;
    }
    @ResponseBody
    @RequestMapping("addhost")
    public HostResult addhost(String hname,String hpwd,String hphone){
        Host host = new Host();
        host.setHname(hname);
        host.setHpwd(hpwd);
        host.setHphone(hphone);
        host.setStarttime(LocalDateTime.now());
        host.setStatus("1");
        host.setStrong("20");
        host.setOrdernumber(0);
        boolean save = iHostService.save(host);
        HostResult hostResult = new HostResult();
        if(save){
            hostResult.setSuccess(save);
            hostResult.setMsg("添加成功！");

        }else {
            hostResult.setSuccess(save);
            hostResult.setMsg("添加失败！请重新添加");
        }
        return hostResult;
    }
    @ResponseBody
    @RequestMapping("changestatus")
    public boolean changestatus(String hids,String statuss){
        System.out.println(hids.split(","));
        return false;
    }
}

