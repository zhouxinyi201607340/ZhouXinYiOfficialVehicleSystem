package xyz.jfshare.car.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xyz.jfshare.car.system.entity.BusComplain;
import xyz.jfshare.car.system.dao.BusComplainMapper;
import xyz.jfshare.car.system.service.BusComplainService;

@Service
public class BusComplainServiceImpl extends ServiceImpl<BusComplainMapper, BusComplain> implements BusComplainService {

    @Autowired
    private BusComplainMapper complainMapper;

    @Override
    public List<BusComplain> listComplain(BusComplain complain) {
        return complainMapper.listComplain(complain);
    }

    @Override
    public Integer countComplain(BusComplain complain) {
        return complainMapper.countComplain(complain);
    }

    @Override
    public List<BusComplain> listByDriverId(Integer driverId) {
        return complainMapper.listByDriverId(driverId);
    }

    @Override
    public List<BusComplain> listByCompanyId(Integer companyId) {
        return complainMapper.listByCompanyId(companyId);
    }
}

