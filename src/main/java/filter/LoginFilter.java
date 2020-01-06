package filter;

import pojo.dbtable.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns="/*")
public class LoginFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        String reqpath = req.getRequestURI();
        if (reqpath.contains("admin")) {
            if (loginUser != null&&loginUser.getRole()!=0) {
                chain.doFilter(req,res);
            }else{
                res.sendRedirect(req.getSession().getAttribute("basePath")+"");
            }
        } else{
            chain.doFilter(req,res);
        }
    }
}