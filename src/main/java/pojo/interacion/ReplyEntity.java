package pojo.interacion;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pojo.dbtable.User;

import java.util.Date;

/**
 * @program: pblog
 * @description: 回复表
 * @author: KaiXun.Cao
 * @create: 2019-12-11 19:23
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyEntity {
    private int replyId;
    private int commentId;
    private int fromUserId;
    private int toUserId;
    private String replyMsg;
    private Date createDate;
    private int isDelete;
    private User fromUser;
    private User toUser;

}
