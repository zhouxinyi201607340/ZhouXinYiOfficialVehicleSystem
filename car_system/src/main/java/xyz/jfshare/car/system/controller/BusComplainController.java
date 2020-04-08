package xyz.jfshare.car.system.controller;

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
import xyz.jfshare.car.system.entity.BusComplain;
import xyz.jfshare.car.system.entity.BusDriver;
import xyz.jfshare.car.system.entity.BusOrder;
import xyz.jfshare.car.system.service.BusComplainService;
import xyz.jfshare.car.system.service.BusDriverService;
import xyz.jfshare.car.system.service.BusOrderService;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/complain/")
public class BusComplainController {

    @Autowired
    private BusComplainService complainService;
    @Autowired
    private BusOrderService orderService;
    @Autowired
    private BusDriverService driverService;

    @RequestMapping("add")
    @Transactional(rollbackFor = RuntimeException.class)
    public String add(Integer orderId, Integer type, String description, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/complain/add");
        SecurityUtils.getSubject().checkRole("company");

        BusComplain complain = new BusComplain();
        complain.setOrderId(orderId);
        complain.setType(type);
        complain.setDescription(description);

        BusOrder order = orderService.getById(orderId);
        order.setStatus(Config.ORDER_COMPLAINED);
        order.setUpdateTime(null);
        boolean res1 = orderService.updateById(order);
        if (!res1){
            throw new RuntimeException("更新订单信息失败");
        }

        boolean res = complainService.save(complain);
        if (!res){
            throw new RuntimeException("插入投诉信息失败");
        }
        attributes.addAttribute("msg","提交成功");
        return "redirect:/user/info";
    }

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String driverName,
                       @RequestParam(required = false,defaultValue = "") String companyName,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize,
                       Model model){
        SecurityUtils.getSubject().checkPermission("/complain/list");
        SecurityUtils.getSubject().checkRole("admin");

        // 筛选条件
        BusComplain complain = new BusComplain();
        if (StringUtils.isNotBlank(driverName)){
            complain.setDriverName(driverName);
        }
        if (StringUtils.isNotBlank(companyName)){
            complain.setCompanyName(companyName);
        }
        if(!Objects.equals(0,pageSize)){
            complain.setSkip((page-1)*pageSize);
            complain.setSize(pageSize);
        }

        List<BusComplain> list = complainService.listComplain(complain);
        Integer total = complainService.countComplain(complain);

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);
        return "complain/complainList";
    }

    @RequestMapping("review")
    @Transactional(rollbackFor = RuntimeException.class)
    public String review(Integer complainId,Integer score, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/complain/review");
        SecurityUtils.getSubject().checkRole("admin");

        BusComplain complain = complainService.getById(complainId);
        complain.setStatus(Config.COMPLAIN_REVIEWED);
        complain.setUpdateTime(null);

        boolean res = complainService.updateById(complain);
        if (!res){
            throw new RuntimeException("更新投诉信息失败");
        }

        BusOrder order = orderService.getById(complain.getOrderId());
        BusDriver driver = driverService.getById(order.getDriverId());
        if (driver.getCredit() < score){
            attributes.addAttribute("msg","扣除积分已经大于当前积分");
            return "redirect:list";
        }
        driver.setCredit(driver.getCredit() - score);
        driver.setUpdateTime(null);
        boolean b = driverService.updateById(driver);
        if(!b){
            throw new RuntimeException("更新司机信息失败");
        }
        attributes.addAttribute("msg","处理成功");
        return "redirect:list";
    }
}
