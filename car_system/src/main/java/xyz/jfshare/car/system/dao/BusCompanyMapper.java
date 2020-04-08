package xyz.jfshare.car.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.jfshare.car.system.entity.BusCompany;

import java.util.List;

public interface BusCompanyMapper extends BaseMapper<BusCompany> {
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
}
