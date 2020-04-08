package xyz.jfshare.car.system.config;


import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import xyz.jfshare.car.system.shiro.realm.MyRealm;

import java.util.HashMap;
import java.util.Map;

@Configuration
@Slf4j
public class ShiroConfig {

    @Bean(name = "lifecycleBeanPostProcessor")
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        //System.out.println("lifecycleBeanPostProcessor");
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    @DependsOn({"lifecycleBeanPostProcessor"})
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        //System.out.println("lifecycleBeanPostProcessor");
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("theSecurityManager") DefaultWebSecurityManager securityManager){
        //System.out.println("authorizationAttributeSourceAdvisor");
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("theSecurityManager") DefaultWebSecurityManager securityManager){
        //System.out.println("shiroFilter");
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //设置安全管理器
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        //未授权界面;
//        shiroFilterFactoryBean.setUnauthorizedUrl("/unauthorized");

        Map<String, String> filterChain = new HashMap<>();
        filterChain.put("/**.js", "anon");
        filterChain.put("/druid/**", "anon");
        filterChain.put("/403", "anon");
        filterChain.put("/auth/**","anon");
        filterChain.put("/login","anon");
        filterChain.put("/static/**","anon");
        filterChain.put("/register","anon");
        filterChain.put("/templates/auth/**","anon");
        filterChain.put("/**","authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChain);
        shiroFilterFactoryBean.setLoginUrl("/login");
        return shiroFilterFactoryBean;
    }

    @Bean(name = "theSecurityManager")
    public DefaultWebSecurityManager getSecurityManager(@Qualifier("realm") MyRealm realm){
        //System.out.println("theSecurityManager");
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联realm
        securityManager.setRealm(realm);
        return securityManager;
    }

    @Bean("realm")
    public MyRealm getRealm(){
        //System.out.println("realm");
        MyRealm realm = new MyRealm();

//        realm.setCredentialsMatcher(getHashedCredentialsMatcher());
        return realm;
    }

    @Bean
    public HashedCredentialsMatcher getHashedCredentialsMatcher(){
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("MD5");
        credentialsMatcher.setHashIterations(1);
        return credentialsMatcher;
    }
}
