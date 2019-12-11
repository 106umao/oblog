package Utils;

import Utils.reflect.MappingHandler;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.IOException;
import java.net.URISyntaxException;

@WebListener
public class ContainerInit implements ServletContextListener {
    String servicePackageName = "service";
    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            MappingHandler.init(servicePackageName);
            System.out.println(servicePackageName+"包下的映射器配置完成");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
