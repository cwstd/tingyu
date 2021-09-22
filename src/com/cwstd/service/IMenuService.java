package com.cwstd.service;

import com.cwstd.pojo.Menu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cwstd.pojo.TreeResult;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
public interface IMenuService extends IService<Menu> {
    List<TreeResult> selMenuInfoService(String id,Integer aid);

    /**
     * 查找所有菜单信息
     * @param id
     * @return
     */
    List<TreeResult> selAllMenuInfoService(String id);
}
