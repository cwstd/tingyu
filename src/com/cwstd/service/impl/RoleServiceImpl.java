package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import com.cwstd.pojo.HostResult;
import com.cwstd.pojo.Role;
import com.cwstd.mapper.RoleMapper;
import com.cwstd.pojo.RoleMenu;
import com.cwstd.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    public HostResult inserRole(Role role, String mids) {
        HostResult hostResult = new HostResult();
        boolean insert = role.insert();
        String[] split = mids.split(",");
        RoleMenu roleMenu = new RoleMenu();
        for(int i=0;i<split.length;i++){
            roleMenu.setRid(role.getRid());
            roleMenu.setMid(Integer.valueOf(split[i]));
            boolean insert1 = roleMenu.insert();
            if(!insert1){
                hostResult.setSuccess(false);
                hostResult.setMsg("添加角色失败！");
                return hostResult;
            }
        }
        hostResult.setSuccess(true);
        hostResult.setMsg("添加角色成功！");
        return hostResult;
    }

    @Override
    public HostResult updateRole(Role role, String mids) {
        HostResult hostResult = new HostResult();
        String[] split = mids.split(",");
        RoleMenu roleMenu = new RoleMenu();

        QueryWrapper<RoleMenu> queryWrapper = new QueryWrapper();
        queryWrapper.eq("rid",role.getRid());
        boolean delete = roleMenu.delete(queryWrapper);
        if(!(delete)) {
            hostResult.setSuccess(false);
            hostResult.setMsg("更新角色失败！");
            return hostResult;
        }


        boolean b = role.updateById();
        for(int i=0;i<split.length;i++){
            roleMenu.setRid(role.getRid());
            roleMenu.setMid(Integer.valueOf(split[i]));
            boolean b1 = roleMenu.insert();
            if(!(b1)){
                hostResult.setSuccess(false);
                hostResult.setMsg("更新角色失败！");
                return hostResult;
            }
        }
        hostResult.setSuccess(true);
        hostResult.setMsg("更新角色成功！");
        return hostResult;
    }
}
