package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xyz.jfshare.car.system.dao.RoleMapper;
import xyz.jfshare.car.system.entity.Role;
import xyz.jfshare.car.system.service.RoleService;

/**
 * @author
 * Description: 角色
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
}
