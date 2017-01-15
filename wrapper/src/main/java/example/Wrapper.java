package example;

import eta.example.Exported;

import java.util.List;

import org.neo4j.procedure.Description;
import org.neo4j.procedure.Name;
import org.neo4j.procedure.UserFunction;

/**
 * This is an example how you can create a simple user-defined function for Neo4j.
 */
public class Wrapper
{
    @UserFunction
    @Description("example.fib(int) - Fibonacci, obviously.")
    public Number fib(
            @Name("n") Number n) {
        if (n == null) {
            return null;
        }
        Exported e = new Exported();
        return e.fib(n.intValue());
    }
}
