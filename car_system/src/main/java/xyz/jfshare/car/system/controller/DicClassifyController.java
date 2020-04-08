package xyz.jfshare.car.system.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.jfshare.car.system.entity.DicClassify;
import xyz.jfshare.car.system.service.DicClassifyService;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/classify/")
public class DicClassifyController {

    @Autowired
    private DicClassifyService dicClassifyService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false,defaultValue = "")String name,
                       @RequestParam(required = false,defaultValue = "")String description,
                       @RequestParam(required = false,defaultValue = "1") Integer page,
                       @RequestParam(required = false,defaultValue = "10")Integer pageSize, Model model){
        SecurityUtils.getSubject().checkPermission("/classify/list");
        SecurityUtils.getSubject().checkRole("admin");
        // 筛选条件
        DicClassify classify = new DicClassify();
        if (StringUtils.isNotBlank(name)){
            classify.setName(name);
        }
        if (StringUtils.isNotBlank(description)){
            classify.setDescription(description);
        }
        if(!Objects.equals(0,pageSize)){
            classify.setSkip((page-1)*pageSize);
            classify.setSize(pageSize);
        }

        List<DicClassify> list = dicClassifyService.listClassify(classify);
        Integer total = dicClassifyService.countClassify(classify);

        int pages = total/pageSize + (total % pageSize==0?0:1);

        model.addAttribute("dataList",list);
        model.addAttribute("total",total);
        model.addAttribute("pages",pages);
        return "classify/classifyList";
    }

    @RequestMapping("all")
    public String all(Model model){
        List<DicClassify> list = dicClassifyService.getAll();
        model.addAttribute("dataList",list);
        return "classify/classifyList";
    }

    @RequestMapping("add")
    public String add(String name, String description, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/classify/add");
        SecurityUtils.getSubject().checkRole("admin");
        DicClassify classify = new DicClassify();
        classify.setName(name);
        classify.setDescription(description);
        boolean res = dicClassifyService.save(classify);
        if (!res){
            attributes.addAttribute("msg","添加失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","添加成功");
        return "redirect:list";
    }

    @RequestMapping("update")
    public String update(Integer id,String name, String description, RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/classify/update");
        SecurityUtils.getSubject().checkRole("admin");
        DicClassify classify = dicClassifyService.getById(id);
        classify.setName(name);
        classify.setDescription(description);
        boolean res = dicClassifyService.updateById(classify);
        if (!res){
            attributes.addAttribute("msg","修改失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","修改成功");
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Integer id,RedirectAttributes attributes){
        SecurityUtils.getSubject().checkPermission("/classify/delete");
        SecurityUtils.getSubject().checkRole("admin");
        boolean res = dicClassifyService.removeById(id);
        if (!res){
            attributes.addAttribute("msg","删除失败,请联系管理员");
            return "redirect:list";
        }
        attributes.addAttribute("msg","删除成功");
        return "redirect:list";
    }
}
