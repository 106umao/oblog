package service;

import Utils.MapperBuilder;
import dao.ArticleMapper;
import pojo.Article;
import Utils.reflect.ServiceMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class ArticleService {
    @ServiceMapping("/getArticle")
    public void service(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
        List<Article> articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticle();
        Iterator iterator = articles.iterator();
        req.setAttribute("articleList", articles);
        req.getRequestDispatcher("/jsp/articledetails.jsp").forward(req,resp);
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
