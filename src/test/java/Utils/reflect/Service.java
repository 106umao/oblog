package Utils.reflect;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 23:50
 **/
public class Service {
    @ServiceMapping("/service")
    public void service(){
        System.out.println("service111");
    }
    @ServiceMapping("/noreturn")
    public void noReturn(){
        System.out.println("no return");
    }
}
