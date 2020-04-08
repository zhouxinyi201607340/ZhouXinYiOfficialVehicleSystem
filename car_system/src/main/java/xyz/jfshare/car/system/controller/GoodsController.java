package xyz.jfshare.car.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import xyz.jfshare.car.system.entity.*;
import xyz.jfshare.car.system.service.BusCarService;
import xyz.jfshare.car.system.service.BusCompanyService;
import xyz.jfshare.car.system.service.BusDriverService;
import xyz.jfshare.car.system.service.BusOrderService;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/goods/")
public class GoodsController {

    @Autowired
    private BusDriverService driverService;
    @Autowired
    private BusCompanyService companyService;
    @Autowired
    private BusOrderService orderService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String name,
                       @RequestParam(required = false,defaultValue = "")String nickname,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize, Model model){
        SecurityUtils.getSubject().checkPermission("/goods/list");
        SecurityUtils.getSubject().checkRole("company");
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusCompany com = companyService.getByUserId(user.getId());
        if (com == null){
            return "redirect:/user/info";
        }

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
        return "goods/goodsList";
    }

    @RequestMapping("submit")
    public String submit(Integer driverId,Model model){
        SecurityUtils.getSubject().checkPermission("/goods/submit");
        SecurityUtils.getSubject().checkRole("company");
        Integer userId = ((User)SecurityUtils.getSubject().getPrincipal()).getId();
        List<BusOrder> list = orderService.isCompanyOrdering(userId);

        if (list.size() != 0){
            model.addAttribute("msg","你已经有一个正在进行的订单了");
            return "redirect:/user/info";
        }

        BusDriver driver = driverService.getById(driverId);
        model.addAttribute("driver",driver);
        return "goods/goodsChoose";
    }
}
