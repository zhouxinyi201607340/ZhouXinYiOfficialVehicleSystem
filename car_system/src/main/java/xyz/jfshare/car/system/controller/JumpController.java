package xyz.jfshare.car.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.jfshare.car.system.entity.BusCompany;
import xyz.jfshare.car.system.entity.BusDriver;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.BusCompanyService;
import xyz.jfshare.car.system.service.BusDriverService;

@Controller
public class JumpController {
    @Autowired
    private BusDriverService driverService;
    @Autowired
    private BusCompanyService companyService;

    @GetMapping("/login")
    public String toLogin(){
        User sUser = (User) SecurityUtils.getSubject().getPrincipal();
        if (sUser != null){
            return "redirect:/main";
        }
        return "auth/login";
    }

    @GetMapping("/main")
    public String toMain(){
        SecurityUtils.getSubject().checkPermission("/main");
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusCompany company = companyService.getByUserId(user.getId());
        BusDriver driver = driverService.getByUserId(user.getId());
        if (company != null || driver != null){
            return "redirect:/user/info";
        }
        return "main/index";
    }

    @GetMapping("/register")
    public String toRegister(){
        return "auth/register";
    }

    @GetMapping("/")
    public String main(){
        return "redirect:/main";
    }

    @GetMapping("/driverInfo")
    public String driverInfo(){return "driver/driverInfo";}
    @GetMapping("/companyInfo")
    public String companyInfo(){return "company/companyInfo";}

    @RequestMapping("/chooseCar/list")
    public String chooseCar(Model model){
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusDriver driver = driverService.getOne(
                new QueryWrapper<BusDriver>()
                        .eq("user_id",user.getId())
        );
        if (driver == null){
            model.addAttribute("msg","请先完善信息");
            return "redirect:/user/info";
        }else {
            if (driver.getCarId() == 0){
                return "redirect:/car/list";
            }else {
                return "redirect:/car/info";
            }
        }
    }

    @GetMapping("/favicon.ico")
    public String favicon(){
        return "redirect:/static/favicon.ico";
    }

    @GetMapping("/test")
    @ResponseBody
    public String test(){
        int i = 1/0;
        return "" + i;
    }

}
