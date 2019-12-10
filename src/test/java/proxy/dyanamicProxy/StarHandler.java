package proxy.dyanamicProxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 19:05
 **/
public class StarHandler implements InvocationHandler {
    Star realStar;

    public StarHandler(Star realStar) {
        this.realStar = realStar;
    }
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object object =null;
        System.out.println("真正的方法执行前");
        System.out.println("商谈 订机票");
        if(method.getName().equals("sing")){
            System.out.println("####");
            object = method.invoke(realStar,args);
        }
        System.out.println("真正的方法执行后");
        return object;
    }
}
