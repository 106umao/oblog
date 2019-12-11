package Utils.reflect;

import Utils.PatternUtils;

import java.io.IOException;
import java.lang.reflect.Method;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-11 01:02
 **/
public class MappingHandler {
    public static Map<String, String> map = null;
    public static void init( String packageName) throws ClassNotFoundException, URISyntaxException, IOException {
        map = new HashMap<>();
        List allPattern = PatternUtils.getAllPattern(packageName);
        for(String s:(String[])allPattern.toArray(new String[0])) {
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
        System.out.println("映射器清单："+map);
    }

}
