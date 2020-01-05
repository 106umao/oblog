package service;

import Utils.JSONDataUtils;
import Utils.MapperBuilder;
import Utils.reflect.ServiceMapping;
import dao.CommentMapper;
import dao.ReplyMapper;
import pojo.dbtable.Comment;
import pojo.dbtable.Reply;
import pojo.dbtable.User;
import pojo.interacion.ServerResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReplyService {
    @ServiceMapping("/submitReply")
    public void submitReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String replyMsg = (String) request.getParameter("replyMsg");
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        Integer toUserId = Integer.parseInt(request.getParameter("toUserId"));
        Integer fromUserId= Integer.parseInt(request.getParameter("fromUserId"));

        Reply reply = new Reply();
        reply.setReplyMsg(replyMsg);
        reply.setCommentId(commentId);
        reply.setToUserId(toUserId);
        reply.setFromUserId(fromUserId);

        if (0 != new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).insertReply(reply)) {
            ServerResponse serverResponse = new ServerResponse();
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(data);
        } else {
            response.sendError(500, "服务器繁忙");
        }


    }

}
