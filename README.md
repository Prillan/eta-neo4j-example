# Eta (Haskell) and Neo4j

This is a repository combining examples from the neo4j website on
stored procedures and user functions and from the Eta website on how
to export Java functions written in Eta (Haskell).

## Setup

To get things going you need `eta` ([installation instructions](http://eta-lang.org/docs/html/getting-started.html#installating-eta)),
`neo4j` ([website](https://neo4j.com)), Java 8 and `maven`.

Make sure you set `JAVA_HOME` to your Java 8 directory in
`wrapper/build.sh`.

Run `build.sh`.

If everything goes well it produces `output.jar` in the root directory
of this repository. Copy that file to neo4j's `plugins` directory, for
me that is `/var/lib/neo4j/plugins`. Restart `neo4j` and try out the
example function `fib`.

```shell
neo4j-sh (?)$ return example.fib(12);
+-----------------+
| example.fib(12) |
+-----------------+
| 233             |
+-----------------+
1 row
55 ms
```

## Gotchas

- Eta currently does not support annotations, so we need a Java
  wrapper library.
- Make sure the Eta project is compiled as an executable, otherwise
  the Eta runtime won't be included and execution of the user function
  will fail with `Failed to invoke function 'example.fib': Caused by:
  java.lang.NoClassDefFoundError: eta/runtime/stg/StgClosure`.
- Use a very simple local maven repository to store the produced `jar`
  file, this makes sure that it's included in the next `jar` file that
  gets included by neo4j.
