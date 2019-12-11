package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: pblog
 * @description: 文章类别表
 * @author: KaiXun.Cao
 * @create: 2019-12-11 19:18
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private int categoryId;
    private int categoryName;
}
