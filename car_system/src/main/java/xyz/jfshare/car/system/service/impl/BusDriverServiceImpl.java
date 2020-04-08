package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xyz.jfshare.car.system.dao.BusDriverMapper;
import xyz.jfshare.car.system.entity.BusDriver;
import xyz.jfshare.car.system.service.BusDriverService;

@Service
public class BusDriverServiceImpl extends ServiceImpl<BusDriverMapper, BusDriver> implements BusDriverService {

    @Autowired
    private BusDriverMapper driverMapper;

    @Override
    public List<BusDriver> listDriver(BusDriver driver) {
        return driverMapper.listDriver(driver);
    }

    @Override
    public Integer countDriver(BusDriver driver) {
        return driverMapper.countDriver(driver);
    }

    @Override
    public List<BusDriver> getAll() {
        return driverMapper.getAll();
    }

    @Override
    public BusDriver getByUserId(Integer userId) {
        return driverMapper.selectOne(
                new QueryWrapper<BusDriver>()
                        .eq("user_id",userId)
        );
    }
}

