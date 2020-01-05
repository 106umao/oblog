package servlet;

import javax.servlet.annotation.WebServlet;


@WebServlet("/reply/*")
public class ReplyServlet extends InitServlet{

        String serviceName = "service.ReplyService";
        public ReplyServlet() {
            setServiceName(serviceName);
        }


}
