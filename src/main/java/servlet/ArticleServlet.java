package servlet;

import pojo.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @program: pblog
 * @description: 处理文章的servlet
 * @author: KaiXun.Cao
 * @create: 2019-12-10 00:56
 **/
@WebServlet("/article/*")
public class ArticleServlet extends InitServlet {
    String serviceName = "service.ArticleService";
    public ArticleServlet() {
        setServiceName(serviceName);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        analysisInvoke(parseRequestPath(req, resp),req,resp);
    }
}
