package dao;

import org.apache.ibatis.annotations.Select;
import pojo.dbtable.User;

public interface UserMapper {
    @Select("select * from blog_user where username = '${username}' and password='${password}'")
    User getUserByUsernameAndPasswod(User user);
}
