package service;

import Utils.JSONDataUtils;
import Utils.MapperBuilder;
import Utils.reflect.ServiceMapping;
import dao.*;
import pojo.dbtable.*;
import pojo.interacion.ArticleListEntity;
import pojo.interacion.CategoryEntity;
import pojo.interacion.ServerResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class AdminService {
    @ServiceMapping("/AddArticle")
    public void AddArticle(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<Category> categories;
        categories = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).findAllCategory();
        req.setAttribute("categoryList",categories);
        req.getRequestDispatcher("/admin/AddArticle.jsp").forward(req,resp);
    }
    @ServiceMapping("/articleList")

    public void articleList(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<Article> articles;
        articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticle();
        req.setAttribute("articleList",articles);
        req.getRequestDispatcher("/admin/ArticleList.jsp").forward(req,resp);
    }
    @ServiceMapping("/userList")
    public void userList(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<User> users;
        users = new MapperBuilder<UserMapper>().build(UserMapper.class).findAllUser();
        req.setAttribute("userList",users);
        req.getRequestDispatcher("/admin/UserList.jsp").forward(req,resp);
    }
    @ServiceMapping("/categoryList")
    public void categoryList(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<Category> categories;
        categories = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).findAllCategory();
        req.setAttribute("categoryList",categories);
        req.getRequestDispatcher("/admin/CategoryList.jsp").forward(req,resp);
    }

    @ServiceMapping("/commentList")
    public void commentList(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<Comment> comments;
        comments = new MapperBuilder<CommentMapper>().build(CommentMapper.class).findAllComment();
        req.setAttribute("commentList",comments);
        req.getRequestDispatcher("/admin/CommentList.jsp").forward(req,resp);
    }

    @ServiceMapping("/replyList")
    public void replyList(HttpServletRequest req, HttpServletResponse resp)  throws IOException, ServletException {
        List<Reply> replies;
        replies = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).findAllReply();
        req.setAttribute("replyList",replies);
        req.getRequestDispatcher("/admin/ReplyList.jsp").forward(req,resp);
    }


    @ServiceMapping("/deleteArticle")
    public void deleteArticle(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Integer articleId = Integer.parseInt(req.getParameter("articleId"));
        int replyIsDelete = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).deleteReplyByArticleId(articleId);
        int commentIsDelete = new MapperBuilder<CommentMapper>().build(CommentMapper.class).deleteCommentByArticleId(articleId);
        int articleIsDelete = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).deleteArticleById(articleId);
        System.out.println(articleIsDelete);
        ServerResponse serverResponse = new ServerResponse();
        if (articleIsDelete ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_ARTICLE");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }
    }

    @ServiceMapping("/deleteUser")
    public void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Integer userId = Integer.parseInt(req.getParameter("userId"));
        int replyIsDelete = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).deleteReplyByUserId(userId);
        int commentIsDelete = new MapperBuilder<CommentMapper>().build(CommentMapper.class).deleteCommentByUserId(userId);
        int articleIsDelete = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).deleteArticleByUserId(userId);
        int userIsDelete = new MapperBuilder<UserMapper>().build(UserMapper.class).deleteUserById(userId);
        ServerResponse serverResponse = new ServerResponse();
        if (userIsDelete ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_USER");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }
    }
    @ServiceMapping("/deleteCategory")
    public void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));
        int articleIsDelete = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).deleteArticleByCategoryId(categoryId);
        int categoryIsDelete = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).deleteUserById(categoryId);
        ServerResponse serverResponse = new ServerResponse();
        if (categoryIsDelete ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_CATEGORY");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }
    }
    @ServiceMapping("/deleteReply")
    public void deleteReply(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Integer replyId = Integer.parseInt(req.getParameter("replyId"));
        int replyIsDelete = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).deleteReplyById(replyId);
        ServerResponse serverResponse = new ServerResponse();
        if (replyIsDelete ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_REPLY");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }
    }
    @ServiceMapping("/deleteComment")
    public void deleteComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Integer commentId = Integer.parseInt(req.getParameter("commentId"));
        int replyIsDelete = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).deleteReplyByCommentId(commentId);
        int commentIsDelete  = new MapperBuilder<CommentMapper>().build(CommentMapper.class).deleteReplyByCommentId(commentId);
        ServerResponse serverResponse = new ServerResponse();
        if (commentIsDelete ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_DELETE_COMMENT");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }
    }
    @ServiceMapping("/addUser")
    public void addUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ServerResponse serverResponse = new ServerResponse();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Integer role = Integer.parseInt(req.getParameter("role".trim()));
        User addUser = new User();
        addUser.setUsername(username);
        addUser.setPassword(password);
        addUser.setRole(role);
        User user = new MapperBuilder<UserMapper>().build(UserMapper.class).getUserByUsername(addUser);
        if (user!=null) {
            serverResponse.setStatus(400);
            serverResponse.setMsg("USER_EXIST");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            int isAdd = new MapperBuilder<UserMapper>().build(UserMapper.class).insertUser(addUser);
            if (isAdd ==1) {
                serverResponse.setStatus(200);
                serverResponse.setMsg("OK");
                String data = JSONDataUtils.toJson(serverResponse);
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(data);
            }else{
                serverResponse.setStatus(400);
                serverResponse.setMsg("CANT_CREATE_USER");
                String data = JSONDataUtils.toJson(serverResponse);
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(data);
            }
        }


    }

    @ServiceMapping("/addArticle")
    public void addArticle(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Article article = new Article();
        Category category = new Category();
        category.setCategoryName(req.getParameter("categoryName"));
        Category category1 = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).findCategoryByName(category);
        Integer categoryId = category1.getCategoryId();

        Integer userId = Integer.parseInt(req.getParameter("userId"));
        String title = req.getParameter("title");
        String content = req.getParameter("content").replace("'","''");
        String introduction;
        if (content.length()>=50) {
            introduction = req.getParameter("content").substring(0,50);
        }else
        {
            introduction = req.getParameter("content");
        }
        Date releaseTime = new Date(System.currentTimeMillis());
        article.setCategoryId(categoryId);
        article.setUserId(userId);
        article.setTitle(title);
        article.setIntroduction(introduction);
        article.setContent(content);
        article.setReleaseTime(new java.sql.Date(releaseTime.getTime()));

        int isAdd = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).insertArticle(article);
        ServerResponse serverResponse = new ServerResponse();
        if (isAdd ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_CREATE_ARTICLE");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }

    }
    @ServiceMapping("/addCategory")
    public void addCategory(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ServerResponse serverResponse = new ServerResponse();
        Category category = new Category();
        String categoryName = (req.getParameter("categoryName"));
        category.setCategoryName(categoryName);
        Category category1 = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).findCategoryByName(category);
        int isAdd=0;
        if (category1!= null) {
            if (category1.getIsDelete() == 0) {
                serverResponse.setStatus(400);
                serverResponse.setMsg("CATEGORY_EXIST");
                String data = JSONDataUtils.toJson(serverResponse);
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(data);
            } else if (category1.getIsDelete() == 1) {
                isAdd = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).recoverCategory(category);
            }
        }
        else{
            isAdd = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).insertCategory(category);
        }
        if (isAdd ==1) {
            serverResponse.setStatus(200);
            serverResponse.setMsg("OK");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            serverResponse.setStatus(400);
            serverResponse.setMsg("CANT_CREATE_CATEGORY");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }

    }
}
