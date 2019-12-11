package service;

import Utils.MapperBuilder;
import dao.ArticleMapper;
import pojo.Article;
import reflect.ServiceMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class ArticleService {
    @ServiceMapping("/getArticle")
    public void service(HttpServletRequest req,HttpServletResponse response) throws IOException {
        List<Article> articles = new MapperBuilder<ArticleMapper>().build(ArticleMapper.class).findAllArticle();
        Iterator iterator = articles.iterator();
        iterator.forEachRemaining(o -> {
            try {
                response.getWriter().write(o.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
    @ServiceMapping("/noreturn")
    public void noReturn(HttpServletRequest req,HttpServletResponse response){
        System.out.println("no return");


    }
    @ServiceMapping("/success")
    public void success(HttpServletRequest req,HttpServletResponse response){
        System.out.println("success");
    }
}
