package xyz.jfshare.car.system.service;

import xyz.jfshare.car.system.entity.BusCompany;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BusCompanyService extends IService<BusCompany>{

    /**
     * 公司列表
     * @param company 筛选条件
     * @return 公司列表
     */
    List<BusCompany> listCompany(BusCompany company);

    /**
     * 公司数量
     * @param company 筛选条件
     * @return 公司数量
     */
    Integer countCompany(BusCompany company);

    /**
     * 公司
     * @return 公司
     */
    List<BusCompany> getAll();

    BusCompany getByUserId(Integer userId);
}
