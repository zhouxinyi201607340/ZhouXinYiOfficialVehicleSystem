package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.BusCar;

import java.util.List;

public interface BusCarMapper extends BaseMapper<BusCar> {
    /**
     * 车辆列表
     * @param car 筛选条件
     * @return 车辆列表
     */
    List<BusCar> listCar(BusCar car);

    /**
     * 车辆数量
     * @param car 筛选条件
     * @return 车辆数量
     */
    Integer countCar(BusCar car);

    /**
     * 所有车辆
     * @return 车辆列表
     */
    List<BusCar> getAll();
}
