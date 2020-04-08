package xyz.jfshare.car.system.service;

import xyz.jfshare.car.system.entity.BusCar;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BusCarService extends IService<BusCar>{

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
