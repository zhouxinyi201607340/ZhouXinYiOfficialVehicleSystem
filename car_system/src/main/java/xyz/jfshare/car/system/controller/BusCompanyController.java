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
import xyz.jfshare.car.system.entity.BusCompany;
import xyz.jfshare.car.system.entity.BusOrder;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.BusCompanyService;
import xyz.jfshare.car.system.service.BusOrderService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/company/")
public class BusCompanyController {

    @Autowired
    private BusCompanyService companyService;
    @Autowired
    private BusOrderService orderService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String name,
                       @RequestParam(required = false,defaultValue = "")String leader,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize,
                       Model model){
        SecurityUtils.getSubject().checkPermission("/company/list");
        SecurityUtils.getSubject().checkRole("admin");
        // 筛选条件
        BusCompany company = new BusCompany();
        if (StringUtils.isNotBlank(name)){
            company.setName(name);
        }
        if (StringUtils.isNotBlank(leader)){
            company.setLeader(leader);
        }
        if(!Objects.equals(0,pageSize)){
            company.setSkip((page-1)*pageSize);
            company.setSize(pageSize);
        }

        List<BusCompany> list = companyService.listCompany(company);
        Integer total = companyService.countCompany(company);

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);

        return "company/companyList";
    }

    @RequestMapping("add")
    public String add(String name, Integer userId, String leader, String email, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/add");
        BusCompany company = new BusCompany();
        company.setName(name);
        if(userId!=null){
            company.setUserId(userId);
        }
        company.setLeader(leader);
        company.setEmail(email);
        boolean res = companyService.save(company);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:list";
    }

    @RequestMapping("selfAdd")
    public String stuAdd(String name, String leader, String email, RedirectAttributes attributes, HttpSession session){
        SecurityUtils.getSubject().checkPermission("/company/selfAdd");
        SecurityUtils.getSubject().checkRole("company");
        Integer userId = ((User) SecurityUtils.getSubject().getPrincipal()).getId();
        BusCompany company = new BusCompany();
        company.setName(name);
        if(userId!=null){
            company.setUserId(userId);
        }
        company.setLeader(leader);
        company.setStatus(Config.COMPANY_CHOSEN);
        company.setEmail(email);
        boolean res = companyService.save(company);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:/user/info";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:/user/info";
    }

    @RequestMapping("delete")
    @Transactional(rollbackFor = RuntimeException.class)
    public String delete(Integer id,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/delete");
        SecurityUtils.getSubject().checkRole("admin");
        boolean res = companyService.removeById(id);
        if (!res){
            attributes.addAttribute("msg","删除失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","删除成功");
        return "redirect:list";
    }

    @RequestMapping("update")
    public String update(Integer id,String name, String email,String leader, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/update");
        SecurityUtils.getSubject().checkRole("admin");
        BusCompany company = companyService.getById(id);
        company.setName(name);
        company.setEmail(email);
        company.setLeader(leader);
        boolean res = companyService.updateById(company);
        if (!res){
            attributes.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("addUser")
    public String addUser(Integer id, Integer userId, HttpSession session, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/addUser");
        SecurityUtils.getSubject().checkRole("company");
        BusCompany company = companyService.getById(id);
        if(userId!=null){
            company.setUserId(userId);
        }
        boolean res = companyService.updateById(company);
        if(!res){
            throw new RuntimeException("添加失败");
        }
        session.setAttribute("company", company);
        attributes.addAttribute("msg","添加成功");
        return "redirect:/companyInfo";
    }

    @RequestMapping("pay")
    public String pay(Integer orderId, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/pay");
        SecurityUtils.getSubject().checkRole("company");

        BusOrder order = orderService.getById(orderId);
        order.setStatus(Config.ORDER_DONE);
        boolean res = orderService.updateById(order);
        if (!res){
            attributes.addAttribute("msg","更新失败，请联系管理员");
        }
        attributes.addAttribute("msg","支付成功");
        return "redirect:/user/info";
    }

    @RequestMapping("payPage")
    public String payPage(){
        return "redirect:http://www.jfshare.xyz:9090/pay.html";
    }

    @RequestMapping("removeOrder")
    public String removeOrder(Integer orderId, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/company/removeOrder");
        SecurityUtils.getSubject().checkRole("company");
        boolean res = orderService.removeById(orderId);
        if (!res){
            attributes.addAttribute("msg","删除失败，请联系管理员");
        }
        attributes.addAttribute("msg","删除成功");
        return "redirect:/user/info";
    }
}
