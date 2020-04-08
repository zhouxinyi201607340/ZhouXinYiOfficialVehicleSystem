package xyz.jfshare.car.system.service;

import xyz.jfshare.car.system.entity.BusDriver;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BusDriverService extends IService<BusDriver> {

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

    BusDriver getByUserId(Integer userId);
}

