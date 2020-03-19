package tmall.pojo;

import tmall.mapper.UserMapper;
import tmall.pojo.extension.UserExtension;

public class User extends UserExtension implements tmall.pojo.ORM.POJOMapper<UserMapper> {

    private String name;

    private String password;

    private String group_;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getGroup_() {
        return group_;
    }

    public void setGroup_(String group_) {
        this.group_ = group_ == null ? null : group_.trim();
    }
}