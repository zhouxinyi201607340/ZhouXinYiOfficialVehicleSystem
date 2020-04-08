package xyz.jfshare.car.system.service;

import xyz.jfshare.car.system.entity.BusComplain;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BusComplainService extends IService<BusComplain> {

    /**
     * 投诉列表
     * @param complain 筛选条件
     * @return 投诉列表
     */
    List<BusComplain> listComplain(BusComplain complain);

    /**
     * 投诉数量
     * @param complain 筛选条件
     * @return 投诉数量
     */
    Integer countComplain(BusComplain complain);
    List<BusComplain> listByDriverId(Integer driverId);
    List<BusComplain> listByCompanyId(Integer companyId);
}

