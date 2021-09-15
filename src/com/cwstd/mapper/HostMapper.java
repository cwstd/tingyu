package com.cwstd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Host;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cwstd.pojo.HostConfig;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface HostMapper extends BaseMapper<Host> {
    public IPage<Host> select1(IPage<Host> ipage,@Param("hostConfig") HostConfig hostConfig);
}
