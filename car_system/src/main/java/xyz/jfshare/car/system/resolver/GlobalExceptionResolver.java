package xyz.jfshare.car.system.resolver;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GlobalExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView res = new ModelAndView();
        //找不到页面
        if (e instanceof NoHandlerFoundException){
            res.setViewName("common/404");
            return res;
        }

        if (e instanceof UnauthorizedException){
            String msg = e.getMessage();
            String role = "",perm = "";
            if (msg.contains("role")){
                role = msg.substring(msg.indexOf("[") + 1, msg.indexOf("]"));
            }
            if (msg.contains("permission")) {
                perm = msg.substring(msg.indexOf("[") + 1, msg.indexOf("]"));
            }

            String message = "";
            if (StringUtils.isNotBlank(role)){
                message += "用户不是" + role +"角色\n";
            }
            if (StringUtils.isNotBlank(perm)){
                message += "用户没有" + perm + "权限";
            }
            res.getModel().put("msg",message);
            res.setViewName("common/500");
            return res;
        }

        if (e.getClass().equals(RuntimeException.class)){
            res.getModel().put("msg",e.getMessage());
            res.setViewName("common/500");
            return res;
        }

        res.getModel().put("msg",e.getMessage());
        StringBuilder sb = new StringBuilder();
        for (StackTraceElement stack : e.getStackTrace()) {
            sb.append(stack.toString()).append("\n");
        }
        res.getModel().put("info",sb.toString());
        res.setViewName("common/500");

        return res;
    }
}
