package xyz.jfshare.car.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.jfshare.car.system.dao.BusCompanyMapper;
import xyz.jfshare.car.system.entity.BusCompany;
import xyz.jfshare.car.system.service.BusCompanyService;

import java.util.List;
@Service
public class BusCompanyServiceImpl extends ServiceImpl<BusCompanyMapper, BusCompany> implements BusCompanyService{

    @Autowired
    private BusCompanyMapper companyMapper;

    @Override
    public List<BusCompany> listCompany(BusCompany company) {
        return companyMapper.listCompany(company);
    }

    @Override
    public Integer countCompany(BusCompany company) {
        return companyMapper.countCompany(company);
    }

    @Override
    public List<BusCompany> getAll() {
        return companyMapper.getAll();
    }

    @Override
    public BusCompany getByUserId(Integer userId) {
        return companyMapper.selectOne(
                new QueryWrapper<BusCompany>()
                        .eq("user_id",userId)
        );
    }
}
