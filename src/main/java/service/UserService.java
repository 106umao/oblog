package service;

import Utils.JSONDataUtils;
import Utils.MapperBuilder;
import Utils.reflect.ServiceMapping;
import dao.UserMapper;
import pojo.dbtable.User;
import pojo.interacion.ServerResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @program: pblog
 * @description: 用户服务层类
 * @author: KaiXun.Cao
 * @create: 2019-12-12 10:24
 **/
public class UserService {
    @ServiceMapping("/login")
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServerResponse response = null;
        User matchUser = new User();
        matchUser.setUsername(req.getParameter("username"));
        matchUser.setPassword(req.getParameter("password"));
        resp.setContentType("application/json; charset=utf-8");
        User loginUser = new MapperBuilder<UserMapper>().build(UserMapper.class).getUserByUsernameAndPasswod(matchUser);
        if (loginUser != null) {
            req.getSession().setAttribute("loginUser", loginUser);
            response = new ServerResponse(200, "OK", loginUser);
            /*switch (loginUser.getRole()) {

                *//*case 1:
                    resp.sendRedirect(basePath+"jsp/RearendManager.jsp");
                    break;
                case 0:
                    resp.sendRedirect(basePath+"jsp/ArcitleList.jsp");*//*
            }*/
        }else{
            response = new ServerResponse();
            response.setStatus(400);
            response.setMsg("用户名或密码错误");
        }
        String respData = JSONDataUtils.toJson(response);
        resp.getWriter().write(respData);
    }

    @ServiceMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession = request.getSession();
        response.setContentType("application/json; charset=utf-8");
        ServerResponse<String> serverResponse;
        if (httpSession.getAttribute("loginUser") == null) {
            serverResponse = new ServerResponse<>();
            serverResponse.setStatus(400);
            serverResponse.setMsg("未登录");
        }else{
            httpSession.removeAttribute("loginUser");
            serverResponse = new ServerResponse<>();
            serverResponse.setStatus(200);
            serverResponse.setMsg("注销成功");
        }
        response.getWriter().write(JSONDataUtils.toJson(serverResponse));
    }
}
