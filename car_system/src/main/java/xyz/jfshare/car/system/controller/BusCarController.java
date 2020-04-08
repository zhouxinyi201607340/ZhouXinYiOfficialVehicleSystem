package xyz.jfshare.car.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.jfshare.car.system.entity.BusCar;
import xyz.jfshare.car.system.entity.BusDriver;
import xyz.jfshare.car.system.entity.DicClassify;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.BusCarService;
import xyz.jfshare.car.system.service.BusDriverService;
import xyz.jfshare.car.system.service.DicClassifyService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/car/")
public class BusCarController {
    @Autowired
    private BusCarService carService;
    @Autowired
    private DicClassifyService classifyService;
    @Autowired
    private BusDriverService driverService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String color,
                       @RequestParam(required = false,defaultValue = "")String bands,
                       @RequestParam(required = false,defaultValue = "0") Integer classifyId,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize,
                       Model model){
        SecurityUtils.getSubject().checkPermission("/car/list");
        // 筛选条件
        BusCar car = new BusCar();
        if (StringUtils.isNotBlank(color)){
            car.setColor(color);
        }
        if (StringUtils.isNotBlank(bands)){
            car.setBands(bands);
        }
        if(!Objects.equals(0,classifyId)){
            car.setClassifyId(classifyId);
        }
        if(!Objects.equals(0,pageSize)){
            car.setSkip((page-1)*pageSize);
            car.setSize(pageSize);
        }

        List<BusCar> list = carService.listCar(car);
        Integer total = carService.countCar(car);

        List<DicClassify> classifyList = classifyService.getAll();

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("classifyList",classifyList);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);

        return "car/carList";
    }

    @RequestMapping("add")
    public String add(String number, Integer classifyId, String color, String bands,String type, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/car/add");
        BusCar car = new BusCar();
        car.setNumber(number);
        if(classifyId!=null){
            car.setClassifyId(classifyId);
        }
        car.setColor(color);
        car.setBands(bands);
        car.setType(type);
        boolean res = carService.save(car);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Integer id,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/car/delete");
        SecurityUtils.getSubject().checkRole("admin");
        boolean res = carService.removeById(id);
        if (!res){
            attributes.addAttribute("msg","删除失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","删除成功");
        return "redirect:list";
    }

    @RequestMapping("update")
    public String update(Integer id,String number, Integer classifyId, String color, String bands,String type, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/car/update");
        SecurityUtils.getSubject().checkRole("admin");
        BusCar car = carService.getById(id);
        car.setNumber(number);
        car.setClassifyId(classifyId);
        car.setColor(color);
        car.setBands(bands);
        boolean res = carService.updateById(car);
        if (!res){
            attributes.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("info")
    public String myInfo(HttpSession session){
        SecurityUtils.getSubject().checkPermission("/car/info");
        SecurityUtils.getSubject().checkRole("driver");

        User user = (User) SecurityUtils.getSubject().getPrincipal();
        BusDriver driver = driverService.getOne(
                new QueryWrapper<BusDriver>()
                        .eq("user_id", user.getId())
        );
        if (driver != null){
            BusCar car = carService.getById(driver.getCarId());
            session.setAttribute("car",car);
        }
        return "redirect:/driverInfo";
    }
}
