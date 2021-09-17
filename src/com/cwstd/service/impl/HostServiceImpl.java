package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Host;
import com.cwstd.mapper.HostMapper;
import com.cwstd.pojo.HostConfig;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IHostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Service
public class HostServiceImpl extends ServiceImpl<HostMapper, Host> implements IHostService {

    @Autowired
    private HostMapper hostMapper;
    @Override
    public PageResult<Host> seleFindAll(Integer rows, Integer page, HostConfig hostConfig) {
        IPage<Host> ipage=new Page<>(page,rows);
        IPage<Host> hosts = hostMapper.select1(ipage, hostConfig);
        PageResult<Host> pageResult = new PageResult<>();
        pageResult.setTotal(hosts.getTotal());
        pageResult.setRows(hosts.getRecords());
        return pageResult;
    }
}
