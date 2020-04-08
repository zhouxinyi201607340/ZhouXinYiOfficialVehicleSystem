package xyz.jfshare.car.system.util;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.HashSet;
import java.util.Set;

public class StringUtil {
    /**
     * 分割字符串进SET
     */
    @SuppressWarnings("unchecked")
    public static Set<String> split(String str) {
        Set<String> set = new HashSet<>();
        if (StringUtils.isEmpty(str))
            return set;
        set.addAll(CollectionUtils.arrayToList(str.split(",")));
        return set;
    }
}
