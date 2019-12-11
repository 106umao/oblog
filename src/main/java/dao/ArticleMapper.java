package dao;

import org.apache.ibatis.annotations.Select;
import pojo.Article;

import java.util.List;

public interface ArticleMapper {
    @Select("select * from blog_article")
    List<Article> findAllArticle();
}
