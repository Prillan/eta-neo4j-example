package example;

/*
 * Import our exported Eta class.
 */
import eta.example.Exported;

import java.util.List;

import org.neo4j.procedure.Description;
import org.neo4j.procedure.Name;
import org.neo4j.procedure.UserFunction;

/**
 * This class will wrap the Eta class.
 */
public class Wrapper
{
    static Exported e = new Exported();

    @UserFunction
    @Description("example.fib(int) - Fibonacci, obviously.")
    public Number fib(
            @Name("n") Number n) {
        if (n == null) {
            return null;
        }

        return e.fib(n.intValue());
    }
}
