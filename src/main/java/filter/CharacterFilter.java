package filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @program: pblog
 * @description: 字符编码过滤器
 * @author: KaiXun.Cao
 * @create: 2019-12-11 20:00
 **/
@WebFilter(urlPatterns="/*")
public class CharacterFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        String path = req.getContextPath();
        req.setCharacterEncoding("utf-8");
        if (path.contains(".css") || path.contains(".js") || path.contains(".html")) {
            System.out.println(path);
        }else{
        }
        chain.doFilter(req, res);
    }
}
