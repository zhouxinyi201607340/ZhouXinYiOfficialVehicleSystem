package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import lombok.Data;

@Data
@TableName(value = "bus_car")
public class BusCar {
    /**
     * 车辆
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 分类id
     */
    @TableField(value = "classify_id")
    private Integer classifyId;

    /**
     * 状态 0：空闲 1：使用中
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 车牌号
     */
    @TableField(value = "number")
    private String number;

    /**
     * 颜色
     */
    @TableField(value = "color")
    private String color;

    /**
     * 车品牌
     */
    @TableField(value = "bands")
    private String bands;

    /**
     * 型号 1:4座 2:7座 3:其他
     */
    @TableField(value = "type")
    private String type;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private Date createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    private Date updateTime;

    /** 跳过的条数 */
    @TableField(exist = false)
    private Integer skip;
    /** 搜索的条数 */
    @TableField(exist = false)
    private Integer size;
    /** 分类名称 */
    @TableField(exist = false)
    private String classify;

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setUpdateTime(Date updateTime) { this.updateTime = updateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }
}
