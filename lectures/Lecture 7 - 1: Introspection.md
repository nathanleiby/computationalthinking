# Lecture 7 - 1: Introspection

Ability of a program to describe itself

Use `@which <func>` to find the definition of a function. Many functions just jump to a definition written in Julia code.


If you wrap `@which` around an operation, it can find the correctly typed version of that, too!

```
@which a * 2
```

E.g. if `a` is a complex number, it will jump to a `Complex * Real` implementation.
... or matrix times scalar! `*` is overloaded and `@which` can bring us to the correct method.


Wow, can run `@methods(*)` to see how many methods there are for multiplication.. `300+`!

The `*` operation propagates. For example

```julia
prod([1,2,3,4]) = 24
```

Or
```julia
prod( [rand(2,2) for i=1:4] )
```

Allows you to use this not only in different circumstances, but also in different platforms (like on a GPU!). So cool. Called "Generic Programming".

## Looking under the hood

"Do this once in your life" lolz

- `@code_lowered` -  still Julia code, just less syntactic sugar
  - each line only does one function call
  - result of each line assigned to `%<number>` variable
  - some operations expand a lot, e.g. broadcast
- `@code_typed` - does type inference, even if you didn't add it
  - same as `code_lowered` but with types
- `@code_llvm` - commonly used compiler.. Julia code compiled to this
  - can understand via LLVM manual
- `@code_native` - e.g. x86 Assembly
  - lowest level
  - includes comments, interestingly

## Conclusion

Julia allows you to look all the way to the exact instructions that will run on the CPU

