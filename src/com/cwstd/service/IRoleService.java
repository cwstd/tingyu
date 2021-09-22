package com.cwstd.service;

import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface IRoleService extends IService<Role> {


    /***
     * 添加角色
     * @param role
     * @param mids
     * @return
     */
     public HostResult inserRole(Role role, String mids);

    /***
     * 更新角色信息
     * @param role
     * @param mids
     * @return
     */
    public HostResult updateRole(Role role,String mids);
}
