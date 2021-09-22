package com.cwstd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cwstd.mapper.AdminRoleMapper;
import com.cwstd.mapper.RoleMenuMapper;
import com.cwstd.pojo.*;
import com.cwstd.mapper.MenuMapper;
import com.cwstd.service.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    private AdminRoleMapper adminRoleMapper;
    @Autowired
    private RoleMenuMapper roleMenuMapper;
    @Override
    public List<TreeResult> selMenuInfoService(String id, Integer aid) {

        QueryWrapper<AdminRole> objectQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("aid",aid).select("rid");
        List<Object> rids = adminRoleMapper.selectObjs(objectQueryWrapper);

        QueryWrapper<RoleMenu> objectQueryWrapper1 = new QueryWrapper<>();
        objectQueryWrapper1.in("rid", rids).select("mid");
        List<Object> mids = roleMenuMapper.selectObjs(objectQueryWrapper1);

        QueryWrapper<Menu> objectQueryWrapper2 = new QueryWrapper<>();
        objectQueryWrapper2.in("mid",mids);
        objectQueryWrapper2.eq("pid",id);
        List<Menu> list = menuMapper.selectList(objectQueryWrapper2);
        List<TreeResult> listTreeResult=new ArrayList<>();
        for(Object e:list) {
            Menu e1 = (Menu) e;
            TreeResult treeResult = new TreeResult();
            treeResult.setId(e1.getMid());
            treeResult.setText(e1.getMname());
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("isparent",e1.getIsparent());
            hashMap.put("url",e1.getUrl());
            hashMap.put("mdesc",e1.getMdesc());
            System.out.println(hashMap.toString());
            treeResult.setMap(hashMap);
            if("1".equals(e1.getIsparent())){
                treeResult.setState("closed");
            }else{
                treeResult.setState("open");
            }
            listTreeResult.add(treeResult);
        }
        return listTreeResult;
    }

    @Override
    public List<TreeResult> selAllMenuInfoService(String id) {
        QueryWrapper<Menu> objectQueryWrapper2 = new QueryWrapper<>();
        objectQueryWrapper2.eq("pid",id);
        List<Menu> list = menuMapper.selectList(objectQueryWrapper2);
        List<TreeResult> listTreeResult=new ArrayList<>();
        for(Object e:list) {
            Menu e1 = (Menu) e;
            TreeResult treeResult = new TreeResult();
            treeResult.setId(e1.getMid());
            treeResult.setText(e1.getMname());
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("isparent",e1.getIsparent());
            hashMap.put("url",e1.getUrl());
            treeResult.setMap(hashMap);
            if("1".equals(e1.getIsparent())){
                treeResult.setState("closed");
            }else{
                treeResult.setState("open");
            }
            listTreeResult.add(treeResult);
        }
        return listTreeResult;
    }
}
