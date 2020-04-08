package xyz.jfshare.car.system.simpleTag;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import xyz.jfshare.car.system.entity.Permission;
import xyz.jfshare.car.system.entity.User;
import xyz.jfshare.car.system.service.PermissionService;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;

public class MenuPerm extends SimpleTagSupport {

    @Override
    public void doTag() throws IOException {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        List<Permission> menuPerm = user.getMenuPerm();
        for (Permission permission : menuPerm) {
            this.getJspContext().getOut().write(
                    "<li id="+permission.getUri()+" >\n" +
                        "    <a href=\""+permission.getUri()+"/list\">\n" +
                        "        <i class=\"fa fa-th\"></i>\n" +
                        "        <span>"+permission.getName()+"</span>\n" +
                        "        <span class=\"pull-right-container\"></span>\n" +
                        "    </a>\n" +
                        "</li>");
        }
    }
}
