# Lecture 5 - Introduction to Macros

Video: https://www.youtube.com/watch?v=e6LGMeoQhfs

## Macros: take code and transform it into new code

In Julia, representdd with `@<macro> <code>`.

E.g. to compute time elapsed, we can use:

```julia
@elapsed peakflops()
```

Instead of returning the result of `peakflops()`, we instead return the duration of execution.

`@macroexpand` is a macro too :P It shows the code that a macro produces.

```julia
@macroexpand @elapsed peakflops
```

You can cleanup this output a bit via `Base.remove_linenums!`

```julia
Base.remove_linenums!( @macroexpand @elapsed peakflops() )
```

Finally, we can see the the generated code is effectively:
```julia
local var"#46#t0" = Base.time_ns()
peakflops()
(Base.time_ns() - var"#46#t0") / 1.0e9
```

Which looks a lot like wrapping a function in something that captures runtime.

## Expressions: a piece of unevaluated code ("Quoting" the code)

Two ways to make expressions are:
```julia
:(1 + 2)
```
or
```julia
quote
    1 + 2
end
```

An expression is a Julia object, so we can use Julia to inspect it.

For example, `expr = :(y + 1)` would be broken down via `dump(expr)`

- `head: Symbol call` means it is a function call
- `args: ...` denotes function args
- `Symbol +` is unevaluated symbol `+`
- `Symbol y` is unevaluated symbol `y`
- `Int64 1` is `1`


What's crazy is that we can then manipulate this code! E.g. we could relace `:y` with `:x` to swap the variable that gets used. This is called *Meta-programming*... writing a program that modifies another program.

## Conclusion

- If we see `@foo`, we should know it's transforming the code we wrote.
- Macros are very powerful in certain cases.



