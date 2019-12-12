package servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * @program: pblog
 * @description: 绑定UserService的Servlet
 * @author: KaiXun.Cao
 * @create: 2019-12-12 10:29
 **/
@WebServlet("/user/*")
public class UserServlet extends InitServlet {
    String serviceName = "service.UserService";
    public UserServlet() {
        setServiceName(serviceName);
    }
}
