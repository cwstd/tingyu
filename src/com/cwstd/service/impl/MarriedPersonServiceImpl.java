package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.mapper.MenuMapper;
import com.cwstd.pojo.MarriedPerson;
import com.cwstd.mapper.MarriedPersonMapper;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.IMarriedPersonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Service
public class MarriedPersonServiceImpl extends ServiceImpl<MarriedPersonMapper, MarriedPerson> implements IMarriedPersonService {
    @Autowired
    private MarriedPersonMapper mapper;
    @Override
    public PageResult<MarriedPerson> selectAll(Integer page, Integer rows, String pname, String phone) {
        PageResult<MarriedPerson> objectPageResult = new PageResult<>();
        IPage<MarriedPerson> iPage=new Page<>(page,rows);
        QueryWrapper<MarriedPerson> queryWrapper = new QueryWrapper();
        if(!"".equals(pname)&&pname!=null){
            queryWrapper.like("pname",pname);
        }
        if(!"".equals(phone)&&phone!=null)
        {
            queryWrapper.like("phone",phone);
        }
        IPage<MarriedPerson> iPage1 = mapper.selectPage(iPage,queryWrapper);
        objectPageResult.setTotal(iPage1.getTotal());
        objectPageResult.setRows(iPage1.getRecords());
        return objectPageResult;
    }
}
