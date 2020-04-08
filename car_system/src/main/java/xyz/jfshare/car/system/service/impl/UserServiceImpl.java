package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.jfshare.car.system.dao.UserMapper;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.UserService;

import java.util.List;


/**
 * @author
 * Description: 用户
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getByUsername(String username) {
        return userMapper.getByUsername(username);
    }

    @Override
    public User getByUserId(Integer userId) {
        return userMapper.getByUserId(userId);
    }

    @Override
    public List<User> listUser(User user) {
        return userMapper.listUser(user);
    }

    @Override
    public Integer countUser(User user) {
        return userMapper.countUser(user);
    }
}
