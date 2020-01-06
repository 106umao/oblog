package servlet;


import javax.servlet.annotation.WebServlet;

@WebServlet("/adminC/*")
public class AdminServlet extends InitServlet{
        String serviceName = "service.AdminService";
    public AdminServlet() {
            setServiceName(serviceName);
        }

    }

