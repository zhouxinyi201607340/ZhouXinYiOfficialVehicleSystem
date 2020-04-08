package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import lombok.Data;

@Data
@TableName(value = "bus_complain")
public class BusComplain {
    /**
     * 投诉
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 订单id
     */
    @TableField(value = "order_id")
    private Integer orderId;

    /**
     * 扣除的积分
     */
    @TableField(value = "score")
    private Integer score;

    /**
     * 类型 1:迟到 2:加价 3:言语不当 4:故意绕路 5:其他
     */
    @TableField(value = "type")
    private Integer type;

    /**
     * 类型 0:未审核 1:审核
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 描述
     */
    @TableField(value = "description")
    private String description;

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
    /** 公司名称 */
    @TableField(exist = false)
    private String companyName;
    /** 司机姓名 */
    @TableField(exist = false)
    private String driverName;
    /** 订单编号 */
    @TableField(exist = false)
    private String ono;
}
