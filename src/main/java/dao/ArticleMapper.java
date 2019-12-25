package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.dbtable.Article;
import pojo.interacion.ArticleListEntity;

import java.util.List;

public interface ArticleMapper {
    @Select("select blog_article.article_id, \n" +
            "                   title, \n" +
            "                   introduction, \n" +
            "                   star, \n" +
            "                   avatar, \n" +
            "                   username\n" +
            "            from blog_article, \n" +
            "                 blog_user\n"+
            "            where blog_article.user_id = blog_user.user_id and blog_article.is_delete=0 and blog_user.is_delete=0\n" +
            "            group by blog_article.article_id;")
    List<ArticleListEntity> findAllArticleListEntity();


    @Select("select * from blog_article where article_id = ${articleId} and is_delete=0")
    Article queryArticleDetails(@Param("articleId") int articleId);

    @Select("select * from blog_article  where is_delete=0 order by release_time limit 5")
    List<Article> findLatestArticles();

    @Select("select count(article_id) from blog_article where category_id = ${categoryId} and is_delete=0")
    int getArticleCount(@Param("categoryId") int categoryId);

    @Select("select star from blog_article where article_id = ${articleId}")
    int getArticleStar(@Param("articleId") Integer articleId);

    @Update("update blog_article set star = ${star} where article_id = ${articleId}")
    int setArticleStar(@Param("star") int star, @Param("articleId") int articleId);

    @Select("select blog_article.article_id,title,introduction,star,avatar,username from blog_article,blog_user where blog_article.user_id = blog_user.user_id and blog_article.is_delete=0 and blog_user.is_delete=0 and (title like '%${keyWord}%' or content like '%${keyWord}%' or introduction like '%${keyWord}%') group by blog_article.article_id;")
    List<ArticleListEntity> findAllArticleByKeyWord(@Param("keyWord") String keyWord);

    @Select("select blog_article.article_id,title,introduction,star,avatar,username from blog_article,blog_user where blog_article.user_id = blog_user.user_id and blog_article.is_delete=0 and blog_user.is_delete=0 and category_id = ${categoryId} group by blog_article.article_id;")
    List<ArticleListEntity> findAllArticleByCategory(@Param("categoryId") int categoryId);
}
