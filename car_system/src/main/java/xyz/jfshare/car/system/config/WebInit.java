package xyz.jfshare.car.system.config;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.FrameworkServlet;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration.Dynamic;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServletRequest;
import java.util.EnumSet;


/**
 * web.xml
 * 继承AbstractAnnotationConfigDispatcherServletInitializer，会同时创建DispatcherServlet和ContextLoaderListener
 */
public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer {
    //将bean加入容器
    @Override
    protected Class<?>[] getRootConfigClasses() {
        //这里可以配置需要加入容器的Bean,同样可以声明配置类,然后加Bean
        return new Class[]{ApplicationConfig.class};
    }

    //这个也是相当于将Bean加入容器
    //相当于springmvc容器
    // url映射配置,返回spring的配置文件
    //这里WebConfig主要是配置DispatcherSerlvet,视频解析器,JSON等
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class};
    }
    //拦截请求匹配,只拦截/
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        super.onStartup(servletContext);

        Dynamic characterEncoding = servletContext.addFilter("characterEncoding", CharacterEncodingFilter.class);
        characterEncoding.setInitParameter("forceEncoding", "true");
        characterEncoding.setInitParameter("encoding", "UTF-8");
        characterEncoding.addMappingForUrlPatterns(null, true, "/*");

        EnumSet<DispatcherType> enumSet = EnumSet.of(DispatcherType.INCLUDE,DispatcherType.REQUEST,DispatcherType.FORWARD,DispatcherType.ERROR);
        Dynamic shiroFilter = servletContext.addFilter("shiroFilter", DelegatingFilterProxy.class);
        shiroFilter.setInitParameter("targetFilterLifecycle", "true"); // 设置true由servlet容器控制filter的生命周期
        shiroFilter.addMappingForUrlPatterns(enumSet, true, "/*");
        // 静态资源处理
//        servletContext.addFilter("resourceUrlEncoding", ResourceUrlEncodingFilter.class).addMappingForUrlPatterns(null, true, "/*");
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setInitParameter("throwExceptionIfNoHandlerFo‌​und","true");
    }


    @Override
    protected FrameworkServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
        final DispatcherServlet dispatcherServlet = new DispatcherServlet(){
            @Override
            protected HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
                if (this.getHandlerMappings() != null) {
                    for (HandlerMapping hm : this.getHandlerMappings()) {
                        if (logger.isTraceEnabled()) {
                            logger.trace(
                                    "Testing handler map [" + hm + "] in DispatcherServlet with name '" + getServletName() + "'");
                        }
                        HandlerExecutionChain handler = hm.getHandler(request);
                        if (handler != null&& !(handler.getHandler() instanceof DefaultServletHttpRequestHandler)) {
                            return handler;
                        }
                    }
                }
                return null;
            }
            {
                setApplicationContext(servletAppContext);
            }
        };
        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
        return dispatcherServlet;
    }
}
