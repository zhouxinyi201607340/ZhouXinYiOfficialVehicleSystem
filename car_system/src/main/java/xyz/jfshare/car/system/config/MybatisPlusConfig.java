package xyz.jfshare.car.system.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
@MapperScan(value = "xyz.jfshare.car.system.dao")
public class MybatisPlusConfig {

    /**mapper.xml文件路径，必须与其他SqlSessionFactory-mapper路径区分.*/
    public final static String MAPPER_XML_PATH = "classpath:mapper/*.xml";

    /**
     * 配置数据源
     */
    @Bean
    public DataSource dataSource(PropertyConfig propertyConfig){
        //System.out.println("dataSource");
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUsername(propertyConfig.getUser());
        dataSource.setPassword(propertyConfig.getPassword());
        dataSource.setUrl(propertyConfig.getUrl());
        dataSource.setDriverClassName(propertyConfig.getDriver());
        dataSource.setMaxActive(propertyConfig.getMaxActive());
        dataSource.setInitialSize(propertyConfig.getInitialSize());
        dataSource.setMaxWait(propertyConfig.getMaxWait());
        dataSource.setMinIdle(propertyConfig.getMinIdle());
        dataSource.setTimeBetweenEvictionRunsMillis(propertyConfig.getTimeBetweenEvictionRunsMillis());
        dataSource.setMinEvictableIdleTimeMillis(propertyConfig.getMinEvictableIdleTimeMillis());
        dataSource.setValidationQuery(propertyConfig.getValidationQuery());
        dataSource.setTestWhileIdle(propertyConfig.isTestWhileIdle());
        dataSource.setTestOnBorrow(propertyConfig.isTestOnBorrow());
        dataSource.setTestOnReturn(propertyConfig.isTestOnReturn());
        dataSource.setMaxOpenPreparedStatements(propertyConfig.getMaxOpenPreparedStatements());
        dataSource.setRemoveAbandoned(propertyConfig.isRemoveAbandoned());
        dataSource.setRemoveAbandonedTimeout(propertyConfig.getRemoveAbandonedTimeout());
        dataSource.setLogAbandoned(propertyConfig.isLogAbandoned());
        return dataSource;
    }

    /**
     * 获得getMybatisSqlSessionFactoryBean
     * @return
     */
    @Bean(name = "sqlSessionFactory")
    public MybatisSqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws IOException {
        //System.out.println("sqlSessionFactory");
        MybatisSqlSessionFactoryBean mybatisPlus  = new MybatisSqlSessionFactoryBean();
        mybatisPlus.setDataSource(dataSource);
        mybatisPlus.setTypeAliasesPackage("xyz.jfshare.car.system.entity");
        mybatisPlus.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(MAPPER_XML_PATH));
        return mybatisPlus;
    }




    /**
     * 设置mapper文件的扫描路径
     * @return
     */
//    @Bean
//    public MapperScannerConfigurer getMapperScannerConfigurer(){
//        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
//        mapperScannerConfigurer.setBasePackage("com.tust.task.student.system.dao");
//        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
//        return mapperScannerConfigurer;
//    }

    /**
     * 分页插件
     * @return
     */
    @Bean
    public PaginationInterceptor getPaginationInterceptor(){
        //System.out.println("getPaginationInterceptor");
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        //自定义方言 可以没有
        paginationInterceptor.setDialectType("mysql");
        return paginationInterceptor;
    }

}
