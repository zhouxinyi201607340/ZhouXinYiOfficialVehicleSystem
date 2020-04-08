package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.BusOrder;

import java.util.List;

public interface BusOrderMapper extends BaseMapper<BusOrder> {
    /**
     * 订单列表
     * @param order 筛选条件
     * @return 订单列表
     */
    List<BusOrder> listOrder(BusOrder order);

    /**
     * 订单数量
     * @param order 筛选条件
     * @return 订单数量
     */
    Integer countOrder(BusOrder order);

    List<BusOrder> getByCompanyId(Integer id);
    List<BusOrder> getByDriverId(Integer id);

    List<BusOrder> isCompanyOrdering(Integer userId);
}
