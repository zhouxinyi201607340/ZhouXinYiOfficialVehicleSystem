package xyz.jfshare.car.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.jfshare.car.system.config.Config;
import xyz.jfshare.car.system.entity.*;
import xyz.jfshare.car.system.service.*;
import xyz.jfshare.car.system.util.RandomUtil;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private BusDriverService driverService;
    @Autowired
    private BusCompanyService companyService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private BusCarService carService;
    @Autowired
    private BusOrderService orderService;
    @Autowired
    private BusComplainService complainService;

    @PostMapping("updatePassword")
    public String updatePassword(String oldPwd, String newPwd, RedirectAttributes attributes){
        if (StringUtils.isBlank(oldPwd)){
            attributes.addAttribute("msg","旧密码不能为空");
            return "redirect:/main";
        }
        if (StringUtils.isBlank(newPwd)){
            attributes.addAttribute("msg","新密码不能为空");
            return "redirect:/main";
        }
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        String salt = user.getSalt();
        String md5 = DigestUtils.md5DigestAsHex((oldPwd+salt).getBytes());
        if (!md5.equals(user.getPassword())){
            attributes.addAttribute("msg","旧密码错误");
        }
        user.setPassword(DigestUtils.md5DigestAsHex((newPwd+salt).getBytes()));
        boolean res = userService.updateById(user);
        if (!res){
            attributes.addAttribute("msg","密码修改失败");
            return "redirect:/main";
        }
        subject.logout();
        attributes.addAttribute("msg","密码修改成功,请重新登录");
        return "redirect:/login";
    }

    @RequestMapping("info")
    public String userInfo(Model model,HttpSession session){
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if(user.getRoleId() == 2) {
            BusCompany company = companyService.getByUserId(user.getId());
            if (company != null){
                List<BusOrder> orderList = orderService.getByCompanyId(company.getId());
                List<BusComplain> complainList = complainService.listByCompanyId(company.getId());
                session.setAttribute("company", company);
                session.setAttribute("complainList", complainList);
                session.setAttribute("orderList", orderList);
                return "redirect:/companyInfo";
            }else {
                List<BusCompany> companyList = companyService.getAll();
                model.addAttribute("companyList",companyList);
                return "company/companyChoose";
            }
        } else if(user.getRoleId() == 3) {
            BusDriver driver = driverService.getOne(
                    new QueryWrapper<BusDriver>()
                            .eq("user_id",user.getId())
            );
            if (driver != null){
                BusCar car = carService.getById(driver.getCarId());
                List<BusOrder> orderList = orderService.getByDriverId(driver.getId());
                List<BusComplain> complainList = complainService.listByDriverId(driver.getId());
                session.setAttribute("car", car);
                session.setAttribute("driver", driver);
                session.setAttribute("complainList", complainList);
                session.setAttribute("orderList", orderList);

                return "redirect:/driverInfo";
            }else {
                List<BusDriver> driverList = driverService.getAll();
                model.addAttribute("driverList",driverList);
                return "driver/driverChoose";
            }
        }else {
            return "redirect:/main";
        }
    }

    @PostMapping("updateDriverInfo")
    @Transactional(rollbackFor = RuntimeException.class)
    public String updateDriverInfo(String nickname, String icon,String name,Integer gender,String age,String phone,String email,HttpSession session,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkRole("driver");
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        BusDriver driver = (BusDriver) session.getAttribute("driver");
        user.setNickname(nickname);
        user.setIcon(icon);
        driver.setName(name);
        driver.setGender(gender);
        int intAge;
        try {
            intAge = Integer.parseInt(age);
        }catch (NumberFormatException e){
            attributes.addAttribute("msg","年龄应是整数");
            return "redirect:/driverInfo";
        }
        if (intAge <= 0 || intAge > 100){
            attributes.addAttribute("msg","年龄应大于0小于100");
            return "redirect:/driverInfo";
        }
        driver.setAge(intAge);
        driver.setPhone(phone);
        driver.setEmail(email);
        boolean res1 = userService.updateById(user);
        if(!res1){
            throw new RuntimeException("更新用户信息失败");
        }
        boolean res2 = driverService.updateById(driver);
        if(!res2){
            throw new RuntimeException("更新司机信息失败");
        }
        PrincipalCollection principals = subject.getPrincipals();
        String realmName = principals.getRealmNames().iterator().next();
        PrincipalCollection principalCollection
                = new SimplePrincipalCollection(user,realmName);
        subject.runAs(principalCollection);

        BusCar car = carService.getById(driver.getCarId());
        session.setAttribute("car", car);
        session.setAttribute("driver", driver);
        attributes.addAttribute("msg","修改成功");
        return "redirect:/driverInfo";
    }

    @PostMapping("updateCompanyInfo")
    @Transactional(rollbackFor = RuntimeException.class)
    public String updateCompanyInfo(String nickname, String icon,String name,String email,String leader,HttpSession session,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkRole("company");
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        BusCompany company = (BusCompany) session.getAttribute("company");
        user.setNickname(nickname);
        user.setIcon(icon);
        company.setName(name);
        company.setLeader(leader);
        company.setEmail(email);
        boolean res1 = userService.updateById(user);
        if(!res1){
            throw new RuntimeException("更新用户信息失败");
        }
        boolean res2 = companyService.updateById(company);
        if(!res2){
            throw new RuntimeException("更新公司信息失败");
        }
        PrincipalCollection principals = subject.getPrincipals();
        String realmName = principals.getRealmNames().iterator().next();
        PrincipalCollection principalCollection
                = new SimplePrincipalCollection(user,realmName);
        subject.runAs(principalCollection);

        session.setAttribute("company", company);
        attributes.addAttribute("msg","修改成功");
        return "redirect:/companyInfo";
    }

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String nickname,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize, Model model){
        SecurityUtils.getSubject().checkPermission("/user/list");
        SecurityUtils.getSubject().checkRole("admin");
        // 筛选条件
        User user = new User();
        if (StringUtils.isNotBlank(nickname)) {
            user.setNickname(nickname);
        }
        if(!Objects.equals(0,pageSize)){
            user.setSkip((page-1)*pageSize);
            user.setSize(pageSize);
        }

        List<User> userList = userService.listUser(user);
        Integer total = userService.countUser(user);

        List<Role> roleList = roleService.list();

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",userList);
        model.addAttribute("roleList",roleList);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);
        return "user/userList";
    }

    @RequestMapping("add")
    public String add(String nickname,String username,String password,Integer roleId,Model model){
        SecurityUtils.getSubject().checkPermission("/user/add");
        SecurityUtils.getSubject().checkRole("admin");
        User one = userService.getByUsername(username);
        if (one!=null){
            model.addAttribute("msg","用户名已存在");
            return "redirect:list";
        }
        if (password.length() < 6){
            model.addAttribute("msg","密码不少于6位");
            return "redirect:list";
        }

        User user = new User();
        user.setNickname(nickname);
        user.setUsername(username);
        String salt = RandomUtil.getRandomString(6);
        String md5 = DigestUtils.md5DigestAsHex((password + salt).getBytes());
        user.setSalt(salt);
        user.setPassword(md5);
        user.setRoleId(roleId);

        boolean res = userService.save(user);
        if (!res){
            model.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:list";
        }
        model.addAttribute("msg","添加成功");
        return "redirect:list";
    }

    @RequestMapping("update")
    public String update(Integer id,String nickname,String username,String password,Integer roleId,Model model){
        SecurityUtils.getSubject().checkPermission("/user/update");
        SecurityUtils.getSubject().checkRole("admin");
        User one = userService.getOne(
                new QueryWrapper<User>()
                        .eq("username",username)
                        .ne("id",id)
        );

        if (one!=null){
            model.addAttribute("msg","用户名已存在");
            return "redirect:list";
        }
        if (password.length() < 6){
            model.addAttribute("msg","密码不少于6位");
            return "redirect:list";
        }

        User user = userService.getById(id);
        user.setNickname(nickname);
        user.setUsername(username);
        String salt = RandomUtil.getRandomString(6);
        String md5 = DigestUtils.md5DigestAsHex((password + salt).getBytes());
        user.setSalt(salt);
        user.setPassword(md5);
        user.setRoleId(roleId);

        boolean res = userService.updateById(user);
        if (!res){
            model.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        model.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("delete")
    @Transactional(rollbackFor = RuntimeException.class)
    public String delete(Integer id,Model model){
        SecurityUtils.getSubject().checkPermission("/user/delete");
        SecurityUtils.getSubject().checkRole("admin");
        User user = userService.getById(id);
        if (user.getRoleId() == 2){
            BusCompany company = companyService.getByUserId(user.getId());
            company.setStatus(Config.COMPANY_DELETE);
            boolean res1 = companyService.updateById(company);
            if (!res1){
                throw new RuntimeException("更新公司信息失败");
            }
        }else {
            BusDriver driver = driverService.getByUserId(user.getId());
            BusCar car = carService.getById(driver.getCarId());
            car.setStatus(Config.CAR_NOT_USE);
            car.setUpdateTime(null);
            boolean res1 = carService.updateById(car);
            if (!res1){
                throw new RuntimeException("更新车辆信息失败");
            }
            driver.setStatus(Config.DRIVER_BANNED);
            driver.setCarId(0);
            driver.setUpdateTime(null);
            boolean res2 = driverService.updateById(driver);
            if (!res2){
                throw new RuntimeException("更新司机信息失败");
            }
        }
        boolean res = userService.removeById(id);
//        Student driver = studentService.getOne(
//                new QueryWrapper<Student>()
//                        .eq("user_id",id)
//        );
//        if (driver != null){
//            driver.setUserId(0);
//            boolean res1 = studentService.updateById(driver);
//            if (!res1){
//                throw new RuntimeException("更新司机失败");
//            }
//        }
        if (!res){
            throw new RuntimeException("删除账号失败");
        }
        model.addAttribute("msg","删除成功");
        return "redirect:list";
    }
}
