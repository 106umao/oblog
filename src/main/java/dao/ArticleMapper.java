package dao;

import org.apache.ibatis.annotations.Select;
import pojo.dbtable.Article;
import pojo.interacion.ArticleListEntity;

import java.util.List;

public interface ArticleMapper {
    @Select("select (blog_article.article_id,title,content,star,avatar,username,count(comment_id)+count(reply_id)) from blog_article,blog_user,blog_comment,blog_reply where blog_user.user_id = blog_article.user_id and blog_article.article_id=blog_comment,article_id and blog_comment.comment_id = blog_reply.reply_id;")
    List<ArticleListEntity> findAllArticleListEntity();
}
