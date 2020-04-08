package xyz.jfshare.car.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import xyz.jfshare.car.system.entity.User;


import java.util.List;

/**
 * @author
 * Description: 用户
 */
public interface UserService extends IService<User> {
    /**
     * 根据用户名查询
     * @param username
     * @return 用户
     */
    User getByUsername(String username);
    /**
     * 根据用户ID查询
     * @param userId
     * @return 用户
     */
    User getByUserId(Integer userId);

    List<User> listUser(User user);

    Integer countUser(User user);
}
