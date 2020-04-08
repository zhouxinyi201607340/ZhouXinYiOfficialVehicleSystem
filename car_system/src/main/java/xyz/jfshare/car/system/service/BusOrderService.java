package xyz.jfshare.car.system.service;

import xyz.jfshare.car.system.entity.BusOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BusOrderService extends IService<BusOrder> {

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

    /**
     * 所有订单
     * @return 订单列表
     */
    List<BusOrder> getAll();

    List<BusOrder> getByCompanyId(Integer id);
    List<BusOrder> getByDriverId(Integer id);
    List<BusOrder> isCompanyOrdering(Integer userId);
}

