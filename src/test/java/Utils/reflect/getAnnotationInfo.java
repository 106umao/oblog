package Utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 23:50
 **/
public class getAnnotationInfo {
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        Class aClass = Service.class;
        Annotation[] annotations = aClass.getMethod("service").getAnnotations();
        for (Annotation a :
                annotations) {
            System.out.println(((ServiceMapping) a).value());
        }
    }
}
