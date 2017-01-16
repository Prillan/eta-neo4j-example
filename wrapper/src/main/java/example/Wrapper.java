/*
 * This is an example adapted from the neo4j docs where the logic is moved to
 * Eta.
 */
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

    @UserFunction
    @Description("example.join(['s1','s2',...], delimiter) - join the given strings with the given delimiter.")
    public String join(
            @Name("strings") List<String> strings,
            @Name(value = "delimiter", defaultValue = ",") String delimiter) {
        if (strings == null || delimiter == null) {
            return null;
        }
        String[] aStrings = strings.toArray(new String[strings.size()]);
        return e.join(delimiter, aStrings);
    }
}
