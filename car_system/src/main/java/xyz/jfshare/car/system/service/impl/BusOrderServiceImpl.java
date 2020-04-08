package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xyz.jfshare.car.system.entity.BusOrder;
import xyz.jfshare.car.system.dao.BusOrderMapper;
import xyz.jfshare.car.system.service.BusOrderService;

@Service
public class BusOrderServiceImpl extends ServiceImpl<BusOrderMapper, BusOrder> implements BusOrderService {

    @Autowired
    private BusOrderMapper orderMapper;

    @Override
    public List<BusOrder> listOrder(BusOrder order) {
        return orderMapper.listOrder(order);
    }

    @Override
    public Integer countOrder(BusOrder order) {
        return orderMapper.countOrder(order);
    }

    @Override
    public List<BusOrder> getAll() {
        return orderMapper.selectList(new QueryWrapper<>());
    }

    @Override
    public List<BusOrder> getByCompanyId(Integer id) {
        return orderMapper.getByCompanyId(id);
    }

    @Override
    public List<BusOrder> getByDriverId(Integer id) {
        return orderMapper.getByDriverId(id);
    }

    @Override
    public List<BusOrder> isCompanyOrdering(Integer userId) {
        return orderMapper.isCompanyOrdering(userId);
    }
}

