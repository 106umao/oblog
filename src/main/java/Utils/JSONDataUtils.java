package Utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @program: pblog
 * @description: 处理Json数据
 * @author: KaiXun.Cao
 * @create: 2019-12-12 12:20
 **/
public class JSONDataUtils {
    ObjectMapper mapper = new ObjectMapper();
    public static Object parseJson(Class aClass,String data) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readValue(data, aClass);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String toJson(Object o) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }


}
