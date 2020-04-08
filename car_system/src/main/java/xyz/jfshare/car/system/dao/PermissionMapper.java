package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.Permission;

import java.util.List;

/**
 * @author
 * Description: 权限
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    List<Permission> getMenu(Integer roleId);
    List<Permission> getAll(Integer roleId);
}
