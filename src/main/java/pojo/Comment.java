package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: pblog
 * @description: 评论表
 * @author: KaiXun.Cao
 * @create: 2019-12-11 19:20
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private int commentId;
    private int articleId;
    private int userId;
    private int zanCount;
    private int isDelete;
    private String replyMsg;
    private String createDate;
}
