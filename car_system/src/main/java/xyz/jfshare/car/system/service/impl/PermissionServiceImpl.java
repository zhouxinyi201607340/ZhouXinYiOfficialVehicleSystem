package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.jfshare.car.system.dao.PermissionMapper;
import xyz.jfshare.car.system.entity.Permission;
import xyz.jfshare.car.system.service.PermissionService;

import java.util.List;

/**
 * @author
 * Description: 权限
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> getMenu(Integer roleId) {
        return permissionMapper.getMenu(roleId);
    }

    @Override
    public List<Permission> getAll(Integer roleId) {
        return permissionMapper.getAll(roleId);
    }
}
