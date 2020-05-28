package servlet;

import Utils.reflect.MappingHandler;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class InitServlet extends HttpServlet {
    Map patternMap;
    String serviceName;

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    Class aClass;
    @Override
    public void init(ServletConfig config) throws ServletException {
        patternMap = MappingHandler.map;
        try {
            aClass = Class.forName(serviceName);
            System.out.println(serviceName+"类初始化完成");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reqPattern = parseRequestPath(req, resp);
        if (reqPattern.contains(".jsp")) {
            System.out.println(reqPattern);
        }
        analysisInvoke(reqPattern,req,resp);
    }

    public String parseRequestPath(HttpServletRequest req, HttpServletResponse resp) {
        String reqUri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String reqPattern = reqUri.substring(reqUri.indexOf(contextPath) + contextPath.length());
        reqPattern = reqPattern.substring(reqPattern.indexOf(req.getServletPath())+req.getServletPath().length());
        System.out.println(reqPattern + "请求路径解析完成");
        return reqPattern;
    }

    @lombok.SneakyThrows
    public void analysisInvoke(String reqPattern,HttpServletRequest req, HttpServletResponse resp) {
        boolean isMatch = false;
        Set set = patternMap.keySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            String s = (String) iterator.next();
            if (s.equals(reqPattern)) {
                System.out.println(reqPattern+"匹配成功");
                isMatch = true;
                System.out.println(((String) patternMap.get(s)) + "方法开始调用");
                try {
                    aClass.getMethod((String) patternMap.get(s), HttpServletRequest.class, HttpServletResponse.class)
                            .invoke(
                                    aClass.newInstance(), req, resp);
                    System.out.println(((String) patternMap.get(s)) + "方法调用完成");
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (SecurityException e) {
                    e.printStackTrace();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                }
            }
        }
        if (!isMatch) {
            resp.sendError(404,"资源服务器未能匹配到您的请求");
        }
    }
}
