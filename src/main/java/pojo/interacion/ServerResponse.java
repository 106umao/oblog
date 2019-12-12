package pojo.interacion;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: pblog
 * @description: 前后端交互数据类型封装
 * @author: KaiXun.Cao
 * @create: 2019-12-12 13:45
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServerResponse<T> {
    private int status;
    private String msg;
    private T data;
}

