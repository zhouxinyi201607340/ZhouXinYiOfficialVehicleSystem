package xyz.jfshare.car.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import xyz.jfshare.car.system.entity.Permission;

import java.util.List;

/**
 * @author
 * Description: 权限
 */
public interface PermissionService extends IService<Permission> {
    List<Permission> getMenu(Integer roleId);
    List<Permission> getAll(Integer roleId);
}
