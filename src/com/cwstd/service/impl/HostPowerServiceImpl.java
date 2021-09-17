package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cwstd.pojo.HostPower;
import com.cwstd.mapper.HostPowerMapper;
import com.cwstd.service.IHostPowerService;
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
public class HostPowerServiceImpl extends ServiceImpl<HostPowerMapper, HostPower> implements IHostPowerService {

    @Autowired
    private HostPowerMapper hostPowerMapper;
    @Override
    public boolean updateHostPower(HostPower hostPower, String hostids) {
        System.out.println("updateHostPower方法");
        String[] split = hostids.split(",");
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.in("hostid",split);
        int delete = hostPowerMapper.delete(queryWrapper);
        System.out.println(delete);
        for(int i=0;i<split.length;i++){
            hostPower.setHostid(Integer.valueOf(split[i]));
            boolean insert = hostPower.insert();
            if(insert==false){
                return false;
            }
        }
        return true;
    }
}
