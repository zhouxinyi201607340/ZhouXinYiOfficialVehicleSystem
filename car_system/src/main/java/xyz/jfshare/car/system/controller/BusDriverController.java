package xyz.jfshare.car.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.jfshare.car.system.config.Config;
import xyz.jfshare.car.system.entity.*;
import xyz.jfshare.car.system.service.BusCarService;
import xyz.jfshare.car.system.service.BusDriverService;
import xyz.jfshare.car.system.service.BusOrderService;
import xyz.jfshare.car.system.service.DicClassifyService;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/driver/")
public class BusDriverController {

    @Autowired
    private BusDriverService driverService;
    @Autowired
    private BusCarService carService;
    @Autowired
    private BusOrderService orderService;
    @Autowired
    private DicClassifyService classifyService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String name,
                       @RequestParam(required = false,defaultValue = "")String nickname,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize, Model model){
        SecurityUtils.getSubject().checkPermission("/driver/list");
        SecurityUtils.getSubject().checkRole("admin");
        // 筛选条件
        BusDriver driver = new BusDriver();
        if (StringUtils.isNotBlank(name)){
            driver.setName(name);
        }
        if (StringUtils.isNotBlank(nickname)){
            driver.setNickname(nickname);
        }
        if(!Objects.equals(0,pageSize)){
            driver.setSkip((page-1)*pageSize);
            driver.setSize(pageSize);
        }

        List<BusDriver> list = driverService.listDriver(driver);
        Integer total = driverService.countDriver(driver);

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);
        return "driver/driverList";
    }

    @RequestMapping("all")
    public String all(Model model){
        List<BusDriver> list = driverService.getAll();
        model.addAttribute("dataList",list);
        return "driver/driverList";
    }

    @RequestMapping("add")
    public String add(String name, Integer gender,String email, String phone,String age, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/add");
        SecurityUtils.getSubject().checkRole("admin");
        BusDriver driver = new BusDriver();
        driver.setName(name);
        driver.setGender(gender);
        driver.setEmail(email);
        driver.setPhone(phone);
        int intAge;
        try {
            intAge = Integer.parseInt(age);
        }catch (NumberFormatException e){
            attributes.addAttribute("msg","年龄应是整数");
            return "redirect:list";
        }
        if (intAge <= 0 || intAge > 100){
            attributes.addAttribute("msg","年龄应大于0小于100");
            return "redirect:list";
        }
        driver.setAge(intAge);
        boolean res = driverService.save(driver);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:list";
    }

    @RequestMapping("selfAdd")
    public String selfAdd(String name, Integer gender,String email, String phone,String age, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/selfAdd");
        SecurityUtils.getSubject().checkRole("driver");
        Integer userId = ((User) SecurityUtils.getSubject().getPrincipal()).getId();
        BusDriver driver = new BusDriver();
        if(userId!=null){
            driver.setUserId(userId);
        }
        driver.setName(name);
        driver.setGender(gender);
        driver.setEmail(email);
        driver.setIfChosen(1);
        driver.setPhone(phone);
        int intAge;
        try {
            intAge = Integer.parseInt(age);
        }catch (NumberFormatException e){
            attributes.addAttribute("msg","年龄应是整数");
            return "redirect:/user/info";
        }
        if (intAge <= 0 || intAge > 100){
            attributes.addAttribute("msg","年龄应大于0小于100");
            return "redirect:/user/info";
        }
        driver.setAge(intAge);
        boolean res = driverService.save(driver);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:/user/info";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:/user/info";
    }

    @RequestMapping("update")
    public String update(Integer id,String name, Integer gender,String email, String phone,String age, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/update");
        SecurityUtils.getSubject().checkRole("admin");
        BusDriver driver = driverService.getById(id);
        driver.setName(name);
        driver.setGender(gender);
        driver.setEmail(email);
        driver.setPhone(phone);
        int intAge;
        try {
            intAge = Integer.parseInt(age);
        }catch (NumberFormatException e){
            attributes.addAttribute("msg","年龄应是整数");
            return "redirect:list";
        }
        if (intAge <= 0 || intAge > 100){
            attributes.addAttribute("msg","年龄应大于0小于100");
            return "redirect:list";
        }
        driver.setAge(intAge);
        boolean res = driverService.updateById(driver);
        if (!res){
            attributes.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("review")
    public String review(Integer id,Integer status, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/review");
        SecurityUtils.getSubject().checkRole("admin");
        BusDriver driver = driverService.getById(id);
        driver.setStatus(status);
        if (status.equals(Config.DRIVER_NORMAL)) {
            driver.setDno("D-" + System.currentTimeMillis());
        }
        driver.setUpdateTime(null);
        boolean res = driverService.updateById(driver);
        if (!res){
            attributes.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Integer id,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/delete");
        SecurityUtils.getSubject().checkRole("admin");
        boolean res = driverService.removeById(id);
        if (!res){
            attributes.addAttribute("msg","删除失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","删除成功");
        return "redirect:list";
    }

    @RequestMapping("addUser")
    public String addUser(Integer id, Integer userId, HttpSession session, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/addUser");
        SecurityUtils.getSubject().checkRole("driver");
        BusDriver driver = driverService.getById(id);
        if(userId!=null){
            driver.setUserId(userId);
            driver.setStatus(Config.DRIVER_NOT_REVIEW);
        }
        boolean res = driverService.updateById(driver);
        if(!res){
            throw new RuntimeException("添加失败");
        }
        BusCar car = carService.getById(driver.getCarId());
        session.setAttribute("car", car);
        session.setAttribute("driver", driver);
        attributes.addAttribute("msg","添加成功");
        return "redirect:/driverInfo";
    }
    
    @RequestMapping("chooseCar")
    @Transactional(rollbackFor = RuntimeException.class)
    public String chooseCar(Integer carId, RedirectAttributes attributes) {
        SecurityUtils.getSubject().checkPermission("/chooseCar/list");
        SecurityUtils.getSubject().checkRole("driver");

        BusCar car = carService.getById(carId);
        if (car == null){
            attributes.addAttribute("msg", "id有误，系统错误");
            return "redirect:/chooseCar/list";
        }
        car.setStatus(Config.CAR_USING);
        boolean res1 = carService.updateById(car);
        if (!res1){
            throw new RuntimeException("更新车辆信息失败");
        }

        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusDriver driver = driverService.getOne(
                new QueryWrapper<BusDriver>()
                        .eq("user_id", user.getId())
        );
        if (driver == null) {
            attributes.addAttribute("msg", "请先注册");
            return "redirect:/chooseCar/list";
        }
        DicClassify classify = classifyService.getById(car.getClassifyId());
        driver.setPrice((double)classify.getId());
        driver.setStatus(Config.DRIVER_NOT_REVIEW);
        driver.setCarId(carId);
        boolean res = driverService.updateById(driver);
        if (!res) {
            attributes.addAttribute("msg", "更新失败,请联系管理员");
        } else {
            attributes.addAttribute("msg", "更新成功");
        }
        return "redirect:/chooseCar/list";
    }

    @RequestMapping("arrive")
    @Transactional(rollbackFor = RuntimeException.class)
    public String arrive(Integer orderId,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/arrive");
        SecurityUtils.getSubject().checkRole("driver");

        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusDriver driver = driverService.getByUserId(user.getId());

        BusOrder order = orderService.getById(orderId);
        order.setStatus(Config.ORDER_NOT_PAY);
        order.setEndTime(new Timestamp(System.currentTimeMillis()));
        long time = order.getEndTime().getTime() - order.getReviewTime().getTime();
        double money = driver.getPrice() * (time / 60000.0) * driver.getCredit() / 100;
        order.setMoney(money);
        order.setUpdateTime(null);

        boolean res1 = orderService.updateById(order);
        if (!res1){
            throw new RuntimeException("更新订单数据失败,请联系管理员");
        }

        driver.setStatus(Config.DRIVER_NORMAL);
        driver.setUpdateTime(null);

        boolean res2 = driverService.updateById(driver);
        if (!res2){
            throw new RuntimeException("更新司机数据失败,请联系管理员");
        }
        attributes.addAttribute("msg", "更新成功");
        return "redirect:/user/info";
    }

    @RequestMapping("meet")
    @Transactional(rollbackFor = RuntimeException.class)
    public String meet(Integer orderId,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/driver/meet");
        SecurityUtils.getSubject().checkRole("driver");

        BusOrder order = orderService.getById(orderId);
        order.setStatus(Config.ORDER_REVIEW_SUCCESS);
        order.setReviewTime(new Timestamp(System.currentTimeMillis()));
        order.setUpdateTime(null);

        boolean res = orderService.updateById(order);
        if (!res){
            attributes.addAttribute("msg", "更新失败,请联系管理员");
        }else {
            attributes.addAttribute("msg", "更新成功");
        }
        return "redirect:/user/info";
    }
}
