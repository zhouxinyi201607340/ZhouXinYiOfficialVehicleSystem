package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.BusDriver;

import java.util.List;

public interface BusDriverMapper extends BaseMapper<BusDriver> {
    /**
     * 司机列表
     * @param driver 筛选条件
     * @return 司机列表
     */
    List<BusDriver> listDriver(BusDriver driver);

    /**
     * 司机数量
     * @param driver 筛选条件
     * @return 司机数量
     */
    Integer countDriver(BusDriver driver);

    /**
     * 所有司机
     * @return 司机列表
     */
    List<BusDriver> getAll();
}
