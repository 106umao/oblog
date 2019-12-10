package proxy.staticProxy;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 18:17
 **/
public class Client {
    public static void main(String[] args) {
        Star real = new RealStar();
        Star proxy = new ProxyStar(real);
        proxy.bookTicket();
        proxy.sing();
        proxy.collectMoney();
    }
}
