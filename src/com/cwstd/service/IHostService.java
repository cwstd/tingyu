package com.cwstd.service;

import com.cwstd.pojo.Host;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cwstd.pojo.HostConfig;
import com.cwstd.pojo.PageResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface IHostService extends IService<Host> {
    public PageResult<Host> seleFindAll(Integer rows, Integer page, HostConfig hostConfig);
}
