package xyz.jfshare.car.system.shiro.rules;


import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import xyz.jfshare.car.system.util.StringUtil;

import java.io.Serializable;
import java.util.Set;

@Slf4j
public class JwtRule implements Serializable {
    private static final long serialVersionUID = 1L;

    private String            url;

    private String            rules;

    public String getUrl() {
        return url;
    }

    public String getRules() {
        return rules;
    }

    public StringBuilder toFilterChain() {
        StringBuilder stringBuilder = new StringBuilder();
        if (StringUtils.isEmpty(this.url)) {
            return null;
        }
        Set<String> rules = StringUtil.split(this.rules);

        if (!StringUtils.isEmpty(rules) && rules.contains("anon")) {
            stringBuilder.append("anon");
        }
        if (!StringUtils.isEmpty(rules) && !rules.contains("anon")) {
            stringBuilder.append("jwt" + "[" + this.rules + "]");
        }
        return stringBuilder.length() > 0 ? stringBuilder : null;
    }

    @Override
    public String toString() {
        return "JwtRule{" + "url='" + url + '\'' + ", rules='" + rules + '\'' + '}';
    }
}
