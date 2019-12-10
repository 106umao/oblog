package Utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: pblog
 * @description: 文件处理工具类
 * @author: KaiXun.Cao
 * @create: 2019-12-11 01:37
 **/
public class FileUtils {
    public static List<String> fileList = new ArrayList();
    public static void visitAllDirsAndFiles(File dir) throws IOException {
        if (dir.isFile()) {
            fileList.add(dir.getCanonicalPath());
            return;
        } else if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                visitAllDirsAndFiles(new File(dir,children[i]));
            }
        }
    }

}
