package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import lombok.Data;

@Data
@TableName(value = "bus_company")
public class BusCompany {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    @TableField(value = "user_id")
    private Integer userId;

    /**
     * 状态 1:可选 2:已选
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 公司名称
     */
    @TableField(value = "name")
    private String name;

    /**
     * 邮箱
     */
    @TableField(value = "email")
    private String email;

    /**
     * 负责人姓名
     */
    @TableField(value = "leader")
    private String leader;

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
}
