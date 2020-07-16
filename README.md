### 项目简介
基于mysql+servlet+jsp+mybatis的多人博客系统（大二课程设计）重构项目地址：[nblog](https://github.com/106umao/nblog)
### 项目功能及开发背景
大二上学期学习jsp进行web开发的课程设计项目，巩固OOP面向对象设计思想。此项目适合初学java或进阶javaweb的同学下载学习，作者水平虽不高，此项目代码也比较烂，但用来加深对所学知识的理解还是稍有帮助。
### 项目特色
简易封装servlet，自定义@ServiceMapping注解类，自定义启动容器Service扫描
#### 部分代码
##### @ServiceMapping注解
``` java
// @ServiceMapping注解
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ServiceMapping {
    String value() default "";

    String pattern() default "";
}
```
##### 映射容器扫描器
``` java
// 映射容器扫描器
public class MappingHandler {
    public static Map<String, String> map = null;
    public static void init( String packageName) throws ClassNotFoundException, URISyntaxException, IOException {
        System.out.println("debug:packageName-->"+packageName);
        map = new HashMap<>();
        List allPattern = PatternUtils.getAllPattern(packageName);
        System.out.println("debug:allPattern:-->"+allPattern);
        for(String s:(String[])allPattern.toArray(new String[0])) {
            System.out.println("debug:映射路径-->"+s);
            for (Method m : Class.forName(s).getMethods()) {
                ServiceMapping sm = m.getAnnotation(ServiceMapping.class);
                if ( sm!= null) {
                    if(!sm.pattern().equals("")){
                        map.put( sm.pattern(),m.getName());
                    }else if (!sm.value().equals("")){
                        map.put( sm.value(),m.getName());
                    }else
                    {
                        throw new RuntimeException("没有找到ServiceMapping注解上的属性值");
                    }
                }
            }
        }
    }
}
```
##### 请求映射处理
``` java
// 请求映射处理
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
                } catch (Exception e) {
                    e.printStackTrace();
               }
            }
        }
        if (!isMatch) {
            resp.sendError(404,"资源服务器未能匹配到您的请求");
        }
    }
```
### 项目安装启动 
* 1.运行sql文件构建数据库结构
* 2.git clone到本地通过idea打开项目
* 3.修改resources下mybatis-config.xml文件中的数据库连接信息
* 4.IDE一键启动

### 写在最后
由于没学设计模式，log日志处理，导致自己封装的几个类层次有些混乱，代码有些冗余，后续学习了新知识会逐步改进。欢迎大家call我邮箱（578961953@qq.com），一起讨论技术 

