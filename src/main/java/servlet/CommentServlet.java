package servlet;

import javax.servlet.annotation.WebServlet;

@WebServlet("/comment/*")
public class CommentServlet extends InitServlet {
    String serviceName = "service.CommentService";
    public CommentServlet() {
        setServiceName(serviceName);
    }

}
