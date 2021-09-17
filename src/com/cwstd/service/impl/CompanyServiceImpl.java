package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cwstd.pojo.Company;
import com.cwstd.mapper.CompanyMapper;
import com.cwstd.pojo.CompanyConfig;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.PageResult;
import com.cwstd.service.ICompanyService;
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
public class CompanyServiceImpl extends ServiceImpl<CompanyMapper, Company> implements ICompanyService {
    @Autowired
    private CompanyMapper companyMapper;
    @Override
    public PageResult<Company> selInfo(Integer page, Integer rows, CompanyConfig companyConfig) {
        IPage<Company> objectIPage = new Page<>(page,rows);
        IPage<Company> hostIPage = companyMapper.selectAll(objectIPage, companyConfig);
        PageResult<Company> result = new PageResult<>();
        result.setTotal(hostIPage.getTotal());
        result.setRows(hostIPage.getRecords());
        return result;
    }
}
