package xyz.jfshare.car.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xyz.jfshare.car.system.dao.DicClassifyMapper;
import xyz.jfshare.car.system.entity.DicClassify;
import xyz.jfshare.car.system.service.DicClassifyService;
@Service
public class DicClassifyServiceImpl extends ServiceImpl<DicClassifyMapper, DicClassify> implements DicClassifyService{

    @Autowired
    private DicClassifyMapper classifyMapper;

    @Override
    public List<DicClassify> listClassify(DicClassify classify) {
        return classifyMapper.listClassify(classify);
    }

    @Override
    public Integer countClassify(DicClassify classify) {
        return classifyMapper.countClassify(classify);
    }

    @Override
    public List<DicClassify> getAll() {
        return classifyMapper.getAll();
    }
}
