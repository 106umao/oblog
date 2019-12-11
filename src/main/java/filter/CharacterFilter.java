package filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
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
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");
        chain.doFilter(req, res);
    }
}
