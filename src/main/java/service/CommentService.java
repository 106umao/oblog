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
import java.util.Date;

public class CommentService {
    @ServiceMapping("/submitComment")
    public void submitComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String replyMsg = (String) request.getParameter("replyMsg");
        Integer articleId = Integer.parseInt(request.getParameter("articleId"));
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        if (loginUser != null) {
            Comment comment = new Comment();
            comment.setArticleId(articleId);
            comment.setReplyMsg(replyMsg);
            comment.setUserId(loginUser.getUserId());
            comment.setZanCount(0);
            comment.setIsDelete(0);
            System.out.println(comment);
            if (0 != new MapperBuilder<CommentMapper>().build(CommentMapper.class).createComment(comment)) {
                ServerResponse serverResponse = new ServerResponse();
                serverResponse.setStatus(200);
                serverResponse.setMsg("OK");
                String data = JSONDataUtils.toJson(serverResponse);
                response.setContentType("application/json; charset=utf-8");
                response.getWriter().write(data);
            }else{
                response.sendError(500,"服务器繁忙");
            }
        }else{
            ServerResponse serverResponse = new ServerResponse();
            serverResponse.setStatus(400);
            serverResponse.setMsg("NOT_LOGIN");
            String data = JSONDataUtils.toJson(serverResponse);
            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(data);
        }
    }

    @ServiceMapping("/delete")
    public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
        ServerResponse serverResponse = new ServerResponse();
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        Integer articleId = Integer.parseInt(request.getParameter("articleId"));
        if (1 == new MapperBuilder<CommentMapper>().build(CommentMapper.class).deleteComment(commentId)) {
            new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).deleteReferenceComment(commentId);
//                serverResponse.setStatus(200);
//                serverResponse.setMsg("OK");
//                String data = JSONDataUtils.toJson(serverResponse);
//                response.setContentType("application/json; charset=utf-8");
//                response.getWriter().write(data);
                response.sendRedirect(basePath+"article/articleDetails?articleId="+articleId);
//                serverResponse.setStatus(400);
//                serverResponse.setMsg("CANT_DELETE_REPLY");
//                String data = JSONDataUtils.toJson(serverResponse);
//                response.setContentType("application/json; charset=utf-8");
//                response.getWriter().write(data);

        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_COMMENT");
            String data = JSONDataUtils.toJson(serverResponse);
            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(data);
        }
    }

    @ServiceMapping("/starComment")
    public void starComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        Integer articleId = Integer.parseInt(request.getParameter("articleId"));
        if (1 == new MapperBuilder<CommentMapper>().build(CommentMapper.class).setStarCount(commentId,new MapperBuilder<CommentMapper>().build(CommentMapper.class).getStarCount(commentId) + 1)) {
            response.sendRedirect(basePath+"article/articleDetails?articleId="+articleId);
        }

    }
}
