package xyz.jfshare.car.system.shiro.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.Map;

@Component
@Slf4j
public class FilterManager {

    /**
     * 初始化过滤器链 路径为key, 可用角色为value
     * @return
     */
    public Map<String, String> initFilterChain() {
        Map<String, String> map = new LinkedHashMap<>();
        map.put("/**.js", "anon");
        map.put("/druid/**", "anon");
        map.put("/auth/**", "anon");
        map.put("/403", "anon");
        map.put("/templates/**","authc");
        map.put("/web/**","authc");
        return map;
    }
}
