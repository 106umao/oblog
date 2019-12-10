package proxy.dyanamicProxy;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 17:44
 **/
public class RealStar implements Star {
    @Override
    public void confer() {
        System.out.println("RealStar confer");
    }

    @Override
    public void signContract() {
        System.out.println("RealStar signContract");
    }

    @Override
    public void bookTicket() {
        System.out.println("RealStar bookTicket");
    }

    @Override
    public void sing() {
        System.out.println("RealStar sing");
    }

    @Override
    public void collectMoney() {
        System.out.println("RealStar collectMoney");
    }
}
