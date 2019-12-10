package proxy.staticProxy;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 17:47
 **/
public class ProxyStar implements Star {
    private Star star = null;

    public ProxyStar(Star star) {
        this.star = star;
    }

    @Override
    public void confer() {
        System.out.println("ProxyStar confer");
    }

    @Override
    public void signContract() {
        System.out.println("ProxyStar signContract");
    }

    @Override
    public void bookTicket() {
        System.out.println("ProxyStar bookTicket");
    }

    @Override
    public void sing() {
        star.sing();
    }

    @Override
    public void collectMoney() {
        System.out.println("ProxyStar collectMoney");
    }
}
