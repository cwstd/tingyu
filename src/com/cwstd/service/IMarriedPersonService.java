package com.cwstd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cwstd.pojo.MarriedPerson;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cwstd.pojo.PageResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface IMarriedPersonService extends IService<MarriedPerson> {

    public PageResult<MarriedPerson> selectAll(Integer page,Integer rows,String pname,String phone);
}
