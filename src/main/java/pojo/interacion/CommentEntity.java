package pojo.interacion;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pojo.dbtable.Reply;
import pojo.dbtable.User;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentEntity {
    private int commentId;
    private int articleId;
    private int userId;
    private int zanCount;
    private int isDelete;
    private String replyMsg;
    private String createDate;
    private User commentUser;
    private List<ReplyEntity> replyList;
}
