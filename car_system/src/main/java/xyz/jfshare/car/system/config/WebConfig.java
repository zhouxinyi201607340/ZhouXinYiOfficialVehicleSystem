package xyz.jfshare.car.system.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import xyz.jfshare.car.system.resolver.GlobalExceptionResolver;

import java.util.Properties;

//@Configuration
@ComponentScan(basePackages = "xyz.jfshare.car.system",
    includeFilters = {@ComponentScan.Filter(type = FilterType.ANNOTATION,value = Controller.class)},
        useDefaultFilters = false
//    excludeFilters = {@ComponentScan.Filter(type = FilterType.ANNOTATION,value = Configuration.class)}
)
@EnableWebMvc
/**
 * springmvc配置文件
 */
public class WebConfig implements WebMvcConfigurer {
    @Bean
    public SimpleMappingExceptionResolver exceptionResolver() {
        //System.out.println("exceptionResolver");
        SimpleMappingExceptionResolver resolver = new SimpleMappingExceptionResolver();
        Properties mappings = new Properties();
        mappings.setProperty("org.apache.shiro.authz.UnauthorizedException", "/unauthorized");
        mappings.setProperty("org.apache.shiro.authz.UnauthenticatedException", "/unauthenticated");
        resolver.setExceptionMappings(mappings);

        return resolver;
    }

    @Bean
    public ViewResolver viewResolver() {
        //System.out.println("viewResolver");
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/templates/");
        resolver.setSuffix(".jsp");
        resolver.setExposeContextBeansAsAttributes(true);
        return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //System.out.println("addResourceHandlers");
        registry.addResourceHandler("/static/**")//过滤静态资源
                .addResourceLocations("/static/","/favicon.ico");
    }

    @Bean("handlerExceptionResolver")
    public GlobalExceptionResolver handlerExceptionResolver(){
        //System.out.println("handlerExceptionResolver");
        return new GlobalExceptionResolver();
    }
}
