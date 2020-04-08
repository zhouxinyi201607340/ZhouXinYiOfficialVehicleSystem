package xyz.jfshare.car.system.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.UserService;
import xyz.jfshare.car.system.util.MD5Utils;
import xyz.jfshare.car.system.util.RandomUtil;

import java.util.Map;

@Controller
@RequestMapping("/auth/")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("login")
    public String login(String username, String password, Model model){
        User user = userService.getByUsername(username);
        if (user == null){
            model.addAttribute("msg","用户名不存在");
            return "redirect:/login";
        }
        password = DigestUtils.md5DigestAsHex((password+user.getSalt()).getBytes());
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return "redirect:/main";
        }catch (AuthenticationException ae){
            model.addAttribute("msg","密码错误");
            return "redirect:/login";
        }
    }

    @RequestMapping("main")
    public String main(@ModelAttribute("data") Map<String,Object> data,Model model){
        model.addAllAttributes(data);
        return "main/index";
    }

    @PostMapping("register")
    public String register(String nickname,String username, String password,String rePassword,Integer roleId,Model model){
        User one = userService.getByUsername(username);
        if (one != null){
            model.addAttribute("msg","该用户名已经注册");
            return "redirect:/register";
        }
        if (!password.equals(rePassword)){
            model.addAttribute("msg","两次输入的密码不一致");
            return "redirect:/register";
        }
        if (password.length() < 6){
            model.addAttribute("msg","密码不能少于6位");
            return "redirect:/register";
        }
        String salt = RandomUtil.getRandomString(6);
        User user = new User();
        user.setNickname(nickname);
        user.setUsername(username);
        user.setRoleId(roleId);
        user.setSalt(salt);
        user.setPassword(MD5Utils.getMD5(password+salt));

        boolean res = userService.save(user);
        if (!res){
            model.addAttribute("msg","注册失败,请联系管理员");
            return "redirect:/register";
        }
        model.addAttribute("msg","注册成功");
        return "redirect:/login";
    }

    @RequestMapping("logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login";
    }
}
