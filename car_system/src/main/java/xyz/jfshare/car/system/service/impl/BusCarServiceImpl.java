package xyz.jfshare.car.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xyz.jfshare.car.system.dao.BusCarMapper;
import xyz.jfshare.car.system.entity.BusCar;
import xyz.jfshare.car.system.service.BusCarService;
@Service
public class BusCarServiceImpl extends ServiceImpl<BusCarMapper, BusCar> implements BusCarService{

    @Autowired
    private BusCarMapper carMapper;

    @Override
    public List<BusCar> listCar(BusCar car) {
        return carMapper.listCar(car);
    }

    @Override
    public Integer countCar(BusCar car) {
        return carMapper.countCar(car);
    }

    @Override
    public List<BusCar> getAll() {
        return carMapper.getAll();
    }
}
