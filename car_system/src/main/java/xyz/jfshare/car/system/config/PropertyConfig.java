package xyz.jfshare.car.system.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@PropertySource("classpath:jdbc.properties")
@Configuration
public class PropertyConfig {

    private ConfigurableApplicationContext applicationContext;

    @Autowired
    public PropertyConfig(ConfigurableApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
        this.url = applicationContext.getEnvironment().getProperty("spring.datasource.url");
        this.driver = applicationContext.getEnvironment().getProperty("spring.datasource.driverClassName");
        this.user = applicationContext.getEnvironment().getProperty("spring.datasource.username");
        this.password = applicationContext.getEnvironment().getProperty("spring.datasource.password");
        this.maxActive = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.maxActive"));
        this.initialSize = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.initialSize"));
        this.maxWait = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.maxWait"));
        this.minIdle = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.minIdle"));
        this.timeBetweenEvictionRunsMillis = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.timeBetweenEvictionRunsMillis"));
        this.minEvictableIdleTimeMillis = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.minEvictableIdleTimeMillis"));
        this.validationQuery = applicationContext.getEnvironment().getProperty("spring.datasource.validationQuery");
        this.testWhileIdle = Boolean.parseBoolean(applicationContext.getEnvironment().getProperty("spring.datasource.testWhileIdle"));
        this.testOnBorrow = Boolean.parseBoolean(applicationContext.getEnvironment().getProperty("spring.datasource.testOnBorrow"));
        this.testOnReturn = Boolean.parseBoolean(applicationContext.getEnvironment().getProperty("spring.datasource.testOnReturn"));
        this.maxOpenPreparedStatements = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.maxOpenPreparedStatements"));
        this.removeAbandoned = Boolean.parseBoolean(applicationContext.getEnvironment().getProperty("spring.datasource.removeAbandoned"));
        this.removeAbandonedTimeout = Integer.parseInt(applicationContext.getEnvironment().getProperty("spring.datasource.removeAbandonedTimeout"));
        this.logAbandoned = Boolean.parseBoolean(applicationContext.getEnvironment().getProperty("spring.datasource.logAbandoned"));
    }

    private String url;
    private String driver;
    private String user;
    private String password;
    private int maxActive;
    private int initialSize;
    private int maxWait;
    private int minIdle;
    private int timeBetweenEvictionRunsMillis;
    private int minEvictableIdleTimeMillis;
    private String validationQuery;
    private boolean testWhileIdle;
    private boolean testOnBorrow;
    private boolean testOnReturn;
    private int maxOpenPreparedStatements;
    private boolean removeAbandoned;
    private int removeAbandonedTimeout;
    private boolean logAbandoned;

    public ConfigurableApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ConfigurableApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getMaxActive() {
        return maxActive;
    }

    public void setMaxActive(int maxActive) {
        this.maxActive = maxActive;
    }

    public int getInitialSize() {
        return initialSize;
    }

    public void setInitialSize(int initialSize) {
        this.initialSize = initialSize;
    }

    public int getMaxWait() {
        return maxWait;
    }

    public void setMaxWait(int maxWait) {
        this.maxWait = maxWait;
    }

    public int getMinIdle() {
        return minIdle;
    }

    public void setMinIdle(int minIdle) {
        this.minIdle = minIdle;
    }

    public int getTimeBetweenEvictionRunsMillis() {
        return timeBetweenEvictionRunsMillis;
    }

    public void setTimeBetweenEvictionRunsMillis(int timeBetweenEvictionRunsMillis) {
        this.timeBetweenEvictionRunsMillis = timeBetweenEvictionRunsMillis;
    }

    public int getMinEvictableIdleTimeMillis() {
        return minEvictableIdleTimeMillis;
    }

    public void setMinEvictableIdleTimeMillis(int minEvictableIdleTimeMillis) {
        this.minEvictableIdleTimeMillis = minEvictableIdleTimeMillis;
    }

    public String getValidationQuery() {
        return validationQuery;
    }

    public void setValidationQuery(String validationQuery) {
        this.validationQuery = validationQuery;
    }

    public boolean isTestWhileIdle() {
        return testWhileIdle;
    }

    public void setTestWhileIdle(boolean testWhileIdle) {
        this.testWhileIdle = testWhileIdle;
    }

    public boolean isTestOnBorrow() {
        return testOnBorrow;
    }

    public void setTestOnBorrow(boolean testOnBorrow) {
        this.testOnBorrow = testOnBorrow;
    }

    public boolean isTestOnReturn() {
        return testOnReturn;
    }

    public void setTestOnReturn(boolean testOnReturn) {
        this.testOnReturn = testOnReturn;
    }

    public int getMaxOpenPreparedStatements() {
        return maxOpenPreparedStatements;
    }

    public void setMaxOpenPreparedStatements(int maxOpenPreparedStatements) {
        this.maxOpenPreparedStatements = maxOpenPreparedStatements;
    }

    public boolean isRemoveAbandoned() {
        return removeAbandoned;
    }

    public void setRemoveAbandoned(boolean removeAbandoned) {
        this.removeAbandoned = removeAbandoned;
    }

    public int getRemoveAbandonedTimeout() {
        return removeAbandonedTimeout;
    }

    public void setRemoveAbandonedTimeout(int removeAbandonedTimeout) {
        this.removeAbandonedTimeout = removeAbandonedTimeout;
    }

    public boolean isLogAbandoned() {
        return logAbandoned;
    }

    public void setLogAbandoned(boolean logAbandoned) {
        this.logAbandoned = logAbandoned;
    }

    @Override
    public String toString() {
        return "PropertyConfig{" +
                "applicationContext=" + applicationContext +
                ", url='" + url + '\'' +
                ", driver='" + driver + '\'' +
                ", user='" + user + '\'' +
                ", password='" + password + '\'' +
                ", maxActive=" + maxActive +
                ", initialSize=" + initialSize +
                ", maxWait=" + maxWait +
                ", minIdle=" + minIdle +
                ", timeBetweenEvictionRunsMillis=" + timeBetweenEvictionRunsMillis +
                ", minEvictableIdleTimeMillis=" + minEvictableIdleTimeMillis +
                ", validationQuery='" + validationQuery + '\'' +
                ", testWhileIdle=" + testWhileIdle +
                ", testOnBorrow=" + testOnBorrow +
                ", testOnReturn=" + testOnReturn +
                ", maxOpenPreparedStatements=" + maxOpenPreparedStatements +
                ", removeAbandoned=" + removeAbandoned +
                ", removeAbandonedTimeout=" + removeAbandonedTimeout +
                ", logAbandoned=" + logAbandoned +
                '}';
    }
}
