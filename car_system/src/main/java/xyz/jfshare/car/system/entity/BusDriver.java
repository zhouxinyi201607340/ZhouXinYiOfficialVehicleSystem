package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
@TableName(value = "bus_driver")
public class BusDriver {
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
     * 0:未选 1:已选
     */
    @TableField(value = "if_chosen")
    private Integer ifChosen;

    /**
     * 价格/分钟
     */
    @TableField(value = "price")
    private Double price;

    /**
     * 是否有车 0:没有 否则为车辆id
     */
    @TableField(value = "car_id")
    private Integer carId;

    /**
     * 姓名
     */
    @TableField(value = "name")
    private String name;

    /**
     * 性别 0：男 1：女
     */
    @TableField(value = "gender")
    private Integer gender;

    /**
     * 邮箱
     */
    @TableField(value = "email")
    private String email;

    /**
     * 电话
     */
    @TableField(value = "phone")
    private String phone;

    /**
     * 信用积分
     */
    @TableField(value = "credit")
    private Integer credit;

    /**
     * 年龄
     */
    @TableField(value = "age")
    private Integer age;

    /**
     * 状态 0:待注册 1:待选车 2:待审核 3:可用 4:进行中 5:禁用
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 司机编号
     */
    @TableField(value = "dno")
    private String dno;

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
    /** 系统用户昵称 */
    @TableField(exist = false)
    private String nickname;
    /** 车牌号 */
    @TableField(exist = false)
    private String carNumber;
    /** 车型号 */
    @TableField(exist = false)
    private String bands;

    public Integer getCarId() {
        return carId;
    }
    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getGender() {
        return gender;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }
}
