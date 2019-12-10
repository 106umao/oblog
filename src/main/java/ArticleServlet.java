import reflect.MappingHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @program: pblog
 * @description: 处理文章的servlet
 * @author: KaiXun.Cao
 * @create: 2019-12-10 00:56
 **/
@WebServlet("/")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reqUri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String reqPattern = reqUri.substring(reqUri.indexOf(contextPath) + contextPath.length());
        Map patternMap = MappingHandler.map;
        resp.getWriter().write("/");
        try {
            MappingHandler.init();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        Set set = patternMap.keySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            String s = (String) iterator.next();
            if (s.contains(reqPattern)) {
                Class aClass = null;
                try {
                    aClass = Class.forName("reflect.Service");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                try {
                    aClass.getMethod((String)patternMap.get(s)).invoke(aClass.newInstance());
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
