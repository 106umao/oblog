package Utils;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.function.Consumer;


/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-11 01:41
 **/
public class PatternUtils {
    public static List<String> getAllPattern() throws URISyntaxException, IOException {
        String classPath = PatternUtils.class.getResource("/").toString();
        classPath = java.net.URLDecoder.decode(classPath,"utf-8");
        classPath = classPath.substring(classPath.indexOf(':') + 2);
        classPath = classPath.replace('/', '.');


        String packageName = "reflect";
        packageName = packageName.replace('.', '/');
        File file = new File(Thread.currentThread().getContextClassLoader().getResource(packageName).toURI());
        FileUtils.visitAllDirsAndFiles(file);
        List<String> files = FileUtils.fileList;
        for (int i=0;i<files.size();i++) {
            files.set(i,files.get(i).replace('\\', '.'));

        }
        ListIterator<String> iterator = files.listIterator();

        String finalClassPath = classPath;
        List<String> newlist = new ArrayList<>();
        iterator.forEachRemaining(new Consumer() {
            @Override
            public void accept(Object o) {
                String s = (String) o;
                s = s.substring(s.indexOf(finalClassPath) + finalClassPath.length());
                s = s.substring(0, s.lastIndexOf(".class"));
                newlist.add(s);
            }
        });

        return newlist;
    }
}
