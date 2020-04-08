package xyz.jfshare.car.system.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;


@Configuration
@ComponentScan(basePackages = {"xyz.jfshare.car.system"},
               excludeFilters = {
    @ComponentScan.Filter(type = FilterType.ANNOTATION,value = Controller.class)
})
@EnableAspectJAutoProxy
/**
 * 核心配置文件
 */
public class ApplicationConfig {
    public ApplicationConfig() {
        //System.out.println("ApplicationConfig");
    }
}
