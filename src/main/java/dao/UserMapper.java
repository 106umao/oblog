package dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import pojo.dbtable.User;

public interface UserMapper {
    @Select("select * from blog_user where username = '${username}' and password='${password}' and is_delete=0")
    User getUserByUsernameAndPasswod(User user);

    @Select("select * from blog_user where user_id = ${userId} and is_delete=0")
    User queryUserByUid(@Param("userId") int userId);
}
