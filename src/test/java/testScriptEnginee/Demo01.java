package testScriptEnginee;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 * @program: pblog
 * @description:
 * @author: KaiXun.Cao
 * @create: 2019-12-10 19:50
 **/
public class Demo01 {
    public static void main(String[] args) throws ScriptException, NoSuchMethodException {
        //获得脚本引擎对象
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        ScriptEngine engine = scriptEngineManager.getEngineByName("javascript");

        //定义变量 存储到引擎的上下文
        engine.put("msg", "caokaixun is a good man");
        String str = "var user = {name:'caokaixun',age:18,schools:['湖南工业职业技术学院']};";
        str += "print(user.name);";
        engine.eval(str);
        engine.eval("msg = 'hunangy is a good school';");
        System.out.println(engine.get("msg"));
        engine.eval("function add(a,b){ var sum = a + b; return sum;}");
        Invocable jsInvoke = (Invocable) engine;
        Object result = jsInvoke.invokeFunction("add", new Object[]{13, 20});
        System.out.println(result);
    }
}
