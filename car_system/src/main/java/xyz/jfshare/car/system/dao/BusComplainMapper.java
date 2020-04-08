package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.BusComplain;

import java.util.List;

public interface BusComplainMapper extends BaseMapper<BusComplain> {
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
