package service;

import Utils.MapperBuilder;
import dao.*;
import org.apache.ibatis.annotations.Mapper;
import pojo.dbtable.Article;
import Utils.reflect.ServiceMapping;
import pojo.dbtable.Category;
import pojo.dbtable.User;
import pojo.interacion.ArticleListEntity;
import pojo.interacion.CategoryEntity;
import pojo.interacion.CommentEntity;
import pojo.interacion.ReplyEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class ArticleService {
    @ServiceMapping("/articleList")
    public void articleList(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
        String keyWord = (String) req.getParameter("keyWord");
        String categoryId = (String)(req.getParameter("categoryId"));
        List<ArticleListEntity> articles;
        if (keyWord != null) {
            articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticleByKeyWord(keyWord);
        } else if (categoryId != null) {
            articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticleByCategory(Integer.parseInt(categoryId));
        } else {

            articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticleListEntity();
        }
        List<CategoryEntity> categories = new MapperBuilder<CategoryMapper>().build(CategoryMapper.class).findAllCategory();
        Iterator iterator1 = categories.iterator();
        while (iterator1.hasNext()) {
            CategoryEntity categorye = (CategoryEntity) iterator1.next();
            categorye.setArticleCount(new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).getArticleCount(categorye.getCategoryId()));
        }
        Iterator iterator = articles.iterator();
        while (iterator.hasNext()) {

            ArticleListEntity article = (ArticleListEntity) iterator.next();
            List<Integer> commentIdList = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).queryCommentId(article.getArticleId());
            int replyCount = 0;
            for (int i = 0; i < commentIdList.size(); i++) {
                replyCount += new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).queryReplyCount(commentIdList.get(i));
            }
            System.out.println(
                    replyCount
            );
            article.setMsgCount(new MapperBuilder<CommentMapper>().build(CommentMapper.class).queryCommentCount(article.getArticleId())+ replyCount);
        }
        req.setAttribute("articleList", articles);
        req.setAttribute("categories",categories);
        req.getRequestDispatcher("/jsp/ArticleList.jsp").forward(req,resp);
    }
    @ServiceMapping("/articleDetails")
    public void articleDetails(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        List<Article> latestArticles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findLatestArticles();
        int articleId = Integer.parseInt(req.getParameter("articleId"));
        Article article = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).queryArticleDetails(articleId);
        User author = new MapperBuilder<UserMapper>().build(UserMapper.class).queryUserByUid(article.getUserId());
        List<CommentEntity> commentEntities = new MapperBuilder<CommentMapper>().build(CommentMapper.class).queryAllCommentEntityByArticleId(articleId);
        Iterator iterator = commentEntities.iterator();
        while (iterator.hasNext()) {
            CommentEntity ce = (CommentEntity) iterator.next();
            List<ReplyEntity> replyEntities = new MapperBuilder<ReplyMapper>().build(ReplyMapper.class).queryReplyByCommentId(ce.getCommentId());
            ce.setCommentUser(new MapperBuilder<UserMapper>().build(UserMapper.class).queryUserByUid(ce.getUserId()));
            Iterator reIterator = replyEntities.iterator();
            while (reIterator.hasNext()) {
                ReplyEntity re = (ReplyEntity) reIterator.next();
                re.setFormUser(new MapperBuilder<UserMapper>().build(UserMapper.class).queryUserByUid(re.getFromUserId()));
                re.setToUser(new MapperBuilder<UserMapper>().build(UserMapper.class).queryUserByUid(re.getToUserId()));
            }
            ce.setReplyList(replyEntities);
        }
        req.setAttribute("latestArticles",latestArticles);
        req.setAttribute("article", article);
        req.setAttribute("author", author);
        req.setAttribute("commentList",commentEntities);
        req.getRequestDispatcher("/jsp/ArticleDetails.jsp").forward(req, resp);
    }
    @ServiceMapping("/success")
    public void success(HttpServletRequest req,HttpServletResponse resp){
        System.out.println("success");
    }

    @ServiceMapping("/starArticle")
    public void starArticle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
        Integer articleId = Integer.parseInt(request.getParameter("articleId"));
        if (0 != new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).setArticleStar(new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).getArticleStar(articleId) + 1, articleId)) {
            response.sendRedirect(basePath + "article/articleDetails?articleId=" + articleId);
        }
    }
}
