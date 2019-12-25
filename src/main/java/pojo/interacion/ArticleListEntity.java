package pojo.interacion;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


/**
 * @program: pblog
 * @description: 绑定页面的数据结构
 * @author: KaiXun.Cao
 * @create: 2019-12-12 23:33
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleListEntity {
    private int articleId;
    private int star;
    private String title;
    private String introduction;
    private String avatar;
    private String username;
    private int msgCount;
}
