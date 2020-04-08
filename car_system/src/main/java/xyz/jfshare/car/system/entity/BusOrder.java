package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.sql.Timestamp;
import lombok.Data;

@Data
@TableName(value = "bus_order")
public class BusOrder {
    /**
     * 订单
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 司机id
     */
    @TableField(value = "driver_id")
    private Integer driverId;

    /**
     * 公司id
     */
    @TableField(value = "company_id")
    private Integer companyId;

    /**
     * 总价
     */
    @TableField(value = "money")
    private Double money;

    /**
     * 订单编号
     */
    @TableField(value = "ono")
    private String ono;

    /**
     * 上车开始时间
     */
    @TableField(value = "start_time")
    private Timestamp startTime;

    /**
     * 下车时间
     */
    @TableField(value = "end_time")
    private Timestamp endTime;

    /**
     * 审核通过时间
     */
    @TableField(value = "review_time")
    private Timestamp reviewTime;

    /**
     * 用车地点
     */
    @TableField(value = "place")
    private String place;

    /**
     * 状态 1:待付款 2:待审核 3:审核通过 4:审核失败 5:进行中 6:已完成
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 员工电话
     */
    @TableField(value = "phone")
    private String phone;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private Timestamp createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    private Timestamp updateTime;

    /** 跳过的条数 */
    @TableField(exist = false)
    private Integer skip;
    /** 搜索的条数 */
    @TableField(exist = false)
    private Integer size;
    /** 司机编号 */
    @TableField(exist = false)
    private String dno;
    /** 车牌号 */
    @TableField(exist = false)
    private String carNumber;
    /** 公司名称 */
    @TableField(exist = false)
    private String companyName;
    /** 司机姓名 */
    @TableField(exist = false)
    private String driverName;

}
