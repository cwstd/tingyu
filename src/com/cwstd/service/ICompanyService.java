package com.cwstd.service;

import com.cwstd.pojo.Company;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cwstd.pojo.CompanyConfig;
import com.cwstd.pojo.PageResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface ICompanyService extends IService<Company> {

    public PageResult<Company> selInfo(Integer page, Integer rows, CompanyConfig companyConfig);

}
