package xyz.jfshare.car.system.shiro.realm;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import xyz.jfshare.car.system.entity.Permission;
import xyz.jfshare.car.system.entity.Role;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.PermissionService;
import xyz.jfshare.car.system.service.RoleService;
import xyz.jfshare.car.system.service.UserService;


import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class MyRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RoleService roleService;

    @Override
    public Class getAuthenticationTokenClass() {
        return UsernamePasswordToken.class;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    /**
     * 执行授权逻辑
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        User user = (User) principalCollection.getPrimaryPrincipal();
        List<Permission> allPerm = user.getAllPerm();
        String role = roleService.getById(user.getRoleId()).getName();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        Set<String> permissions = new HashSet<>();
        Set<String> roles = new HashSet<>();

        roles.add(role);
        if (!roles.isEmpty()) {
            simpleAuthorizationInfo.setRoles(roles);
        }


        for (Permission permission : allPerm) {
            permissions.add(permission.getUri());
        }
        if (!permissions.isEmpty()){
            simpleAuthorizationInfo.setStringPermissions(permissions);
        }
        return simpleAuthorizationInfo;
    }

    /**
     * 执行认证逻辑
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        String password = String.valueOf(token.getPassword());
        User user = userService.getOne(
                new QueryWrapper<User>()
                        .eq("username",username)
                        .eq("password",password)
        );

        Role role = roleService.getById(user.getRoleId());
        user.setRoleName(role.getDescription());

        List<Permission> menuPerm = permissionService.getMenu(role.getId());
        List<Permission> allPerm = permissionService.getAll(role.getId());

        user.setAllPerm(allPerm);
        user.setMenuPerm(menuPerm);
        //principal是认证的实体信息，也可以是username，也可以是的用户的实体类对象
        //credentials是密码
        //realmName是当前realm名字，调用getName()即可

//        ByteSource salt = ByteSource.Util.bytes(user.getSalt());
//        System.out.println("salt" + user.getSalt());
        return new SimpleAuthenticationInfo(user,user.getPassword(),getName());
    }
}
