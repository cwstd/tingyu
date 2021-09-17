package com.cwstd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cwstd.pojo.Company;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cwstd.pojo.CompanyConfig;
import com.cwstd.pojo.Host;
import com.cwstd.pojo.PageResult;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface CompanyMapper extends BaseMapper<Company> {

    public IPage<Company> selectAll(IPage<Company> iPage, @Param("companyConfig") CompanyConfig companyConfig);
}
