package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: pblog
 * @description: 用户表
 * @author: KaiXun.Cao
 * @create: 2019-12-11 19:26
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int userId;
    private String username;
    private String password;
    private int role;
    private String avatar;
    private String about;
    private String email;
    private int isDelete;
}
