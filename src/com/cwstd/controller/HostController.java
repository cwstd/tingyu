package com.cwstd.controller;


import com.cwstd.mapper.HostMapper;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.HostConfig;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IHostService;
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
}

