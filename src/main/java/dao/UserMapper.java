package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.dbtable.User;

import java.util.List;

public interface UserMapper {
    @Select("select * from blog_user where username = '${username}' and password='${password}' and is_delete=0")
    User getUserByUsernameAndPasswod(User user);

    @Select("select * from blog_user where user_id = ${userId} and is_delete=0")
    User queryUserByUid(@Param("userId") int userId);

    @Select("select * from blog_user where is_delete=0")
    List<User> findAllUser();

    @Update("update blog_user set is_delete =1 where user_id = ${uid}")
    int deleteUserById(@Param("uid") Integer userId);

    @Insert("insert into blog_user (username,password,role) values ('${username}','${password}',${role})")
    int insertUser(User addUser);

    @Select("select * from blog_user where username = '${username}' and is_delete=0")
    User getUserByUsername(User user);
}
