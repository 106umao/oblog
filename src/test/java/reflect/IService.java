package reflect;

import com.google.protobuf.Value;

import javax.servlet.annotation.WebServlet;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(value = {ElementType.METHOD, ElementType.TYPE})
@Retention(value = RetentionPolicy.RUNTIME)
public @interface IService {
    String value() default "";

    String uri() default "";
}
