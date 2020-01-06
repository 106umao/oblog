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

    @ServiceMapping("/register")
    public void register(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ServerResponse serverResponse = new ServerResponse();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Integer role = 0;
        User addUser = new User();
        addUser.setUsername(username);
        addUser.setPassword(password);
        addUser.setRole(role);
        User user = new MapperBuilder<UserMapper>().build(UserMapper.class).getUserByUsername(addUser);
        if (user!=null) {
            serverResponse.setStatus(400);
            serverResponse.setMsg("USER_EXIST");
            String data = JSONDataUtils.toJson(serverResponse);
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(data);
        }else{
            int isAdd = new MapperBuilder<UserMapper>().build(UserMapper.class).insertUser(addUser);
            if (isAdd ==1) {
                serverResponse.setStatus(200);
                serverResponse.setMsg("OK");
                String data = JSONDataUtils.toJson(serverResponse);
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(data);
            }else{
                serverResponse.setStatus(400);
                serverResponse.setMsg("CANT_CREATE_USER");
                String data = JSONDataUtils.toJson(serverResponse);
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(data);
            }
        }


    }
}
