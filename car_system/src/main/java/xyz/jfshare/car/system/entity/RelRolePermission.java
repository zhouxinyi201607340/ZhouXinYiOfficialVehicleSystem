package xyz.jfshare.car.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.sql.Timestamp;
import java.util.Objects;

@TableName("sys_rel_role_permission")
public class RelRolePermission {
    /** id主键 */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /** 角色id */
    private Integer roleId;
    /** 权限id */
    private Integer permissionId;
    /** 创建时间 */
    private Timestamp createTime;
    /** 修改时间 */
    private Timestamp updateTime;

    @Override
    public String toString() {
        return "RelRolePermission{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", permissionId=" + permissionId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RelRolePermission)) return false;
        RelRolePermission that = (RelRolePermission) o;
        return Objects.equals(getId(), that.getId()) &&
                Objects.equals(getRoleId(), that.getRoleId()) &&
                Objects.equals(getPermissionId(), that.getPermissionId()) &&
                Objects.equals(getCreateTime(), that.getCreateTime()) &&
                Objects.equals(getUpdateTime(), that.getUpdateTime());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getRoleId(), getPermissionId(), getCreateTime(), getUpdateTime());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
}
