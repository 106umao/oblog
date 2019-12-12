package service;

import Utils.MapperBuilder;
import dao.ArticleMapper;
import pojo.dbtable.Article;
import Utils.reflect.ServiceMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ArticleService {
    @ServiceMapping("/articleList")
    public void articleList(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
        List<Article> articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticleListEntity();
        req.setAttribute("articleList", articles);
        req.getRequestDispatcher("/jsp/ArticleList.jsp").forward(req,resp);
    }
    @ServiceMapping("/noreturn")
    public void noReturn(HttpServletRequest req,HttpServletResponse resp){
        System.out.println("no return");


    }
    @ServiceMapping("/success")
    public void success(HttpServletRequest req,HttpServletResponse resp){
        System.out.println("success");
    }
}
