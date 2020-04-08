package xyz.jfshare.car.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.jfshare.car.system.config.Config;
import xyz.jfshare.car.system.entity.BusCompany;
import xyz.jfshare.car.system.entity.BusDriver;
import xyz.jfshare.car.system.entity.BusOrder;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.BusCompanyService;
import xyz.jfshare.car.system.service.BusDriverService;
import xyz.jfshare.car.system.service.BusOrderService;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/order/")
public class OrderController {

    @Autowired
    private BusOrderService orderService;
    @Autowired
    private BusCompanyService companyService;
    @Autowired
    private BusDriverService driverService;

    @RequestMapping("buy")
    public String buy(Integer driverId,String place,String phone, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/order/buy");
        SecurityUtils.getSubject().checkRole("company");

        User user = (User) SecurityUtils.getSubject().getPrincipal();

        BusOrder order = new BusOrder();
        BusCompany company = companyService.getByUserId(user.getId());
        if (company == null){
            attributes.addAttribute("msg","请先完善信息!");
            return "redirect:/driver/list";
        }

        order.setCompanyId(company.getId());
        order.setDriverId(driverId);
        order.setStartTime(new Timestamp(System.currentTimeMillis()));
        order.setPlace(place);
        order.setPhone(phone);
        order.setOno("O-"+System.currentTimeMillis());
        boolean res = orderService.save(order);
        if (!res){
            throw new RuntimeException("插入订单信息失败");
        }
        BusDriver driver = driverService.getById(driverId);
        driver.setStatus(Config.DRIVER_BUSY);
        driver.setUpdateTime(null);
        boolean res1 = driverService.updateById(driver);
        if (!res1){
            throw new RuntimeException("更新司机信息失败");
        }

        return "redirect:/goods/list";
    }

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "") String driverName,
                       @RequestParam(required = false,defaultValue = "") String companyName,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize,
                       Model model){
        SecurityUtils.getSubject().checkPermission("/order/list");
        SecurityUtils.getSubject().checkRole("admin");

        BusOrder order = new BusOrder();
        if (StringUtils.isNotBlank(driverName)){
            order.setDriverName(driverName);
        }
        if (StringUtils.isNotBlank(companyName)){
            order.setCompanyName(companyName);
        }
        if(!Objects.equals(0,pageSize)){
            order.setSkip((page-1)*pageSize);
            order.setSize(pageSize);
        }

        List<BusOrder> list = orderService.listOrder(order);
        Integer total = orderService.countOrder(order);

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);

        return "order/orderList";
    }


}
