package reflect;

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
    public static void init() throws ClassNotFoundException, URISyntaxException, IOException {
        map = new HashMap<>();
        List allPattern = PatternUtils.getAllPattern();
        for(String s:(String[])allPattern.toArray(new String[0])) {
            for (Method m : Class.forName(s).getMethods()) {
                if (m.getAnnotation(ServiceMapping.class) != null) {
                    map.put( m.getAnnotation(ServiceMapping.class).toString(),m.getName());
                }
            }
        }
    }

}
