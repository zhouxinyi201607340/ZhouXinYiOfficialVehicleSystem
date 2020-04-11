package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;


@Data
@TableName("sys_user")
public class User {
    /** id主键 */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /** 0：正常 1：注销 */
    private Integer status;
    /** 用户名 */
    private String username;
    /** 密码 */
    private String password;
    /** 昵称 */
    private String nickname;
    /** 盐 */
    private String salt;
    /** 头像 */
    private String icon;
    /** 角色id */
    private Integer roleId;
    /** 创建时间 */
    private Timestamp createTime;
    /** 修改时间 */
    private Timestamp updateTime;

    /** 角色 */
    @TableField(exist = false)
    private String roleName;
    /** 所有权限 */
    @TableField(exist = false)
    private List<Permission> allPerm;
    /** 菜单权限 */
    @TableField(exist = false)
    private List<Permission> menuPerm;
    /** 跳过的条数 */
    @TableField(exist = false)
    private Integer skip;
    /** 搜索的条数 */
    @TableField(exist = false)
    private Integer size;

}
