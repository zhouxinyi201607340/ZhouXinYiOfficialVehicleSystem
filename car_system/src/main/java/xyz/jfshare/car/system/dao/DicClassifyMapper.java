package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.DicClassify;

import java.util.List;

public interface DicClassifyMapper extends BaseMapper<DicClassify> {
    /**
     * 分类列表
     * @param classify 筛选条件
     * @return 分类列表
     */
    List<DicClassify> listClassify(DicClassify classify);

    /**
     * 分类数量
     * @param classify 筛选条件
     * @return 分类数量
     */
    Integer countClassify(DicClassify classify);

    /**
     * 所有分类
     * @return 分类列表
     */
    List<DicClassify> getAll();
}
