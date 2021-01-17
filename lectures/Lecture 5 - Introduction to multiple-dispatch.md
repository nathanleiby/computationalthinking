# Lecture 5 - Introduction to multiple-dispatch

Video: https://www.youtube.com/watch?v=DXtbaSP_LFI

## Functions on Types

Now that we have types, we want to trite functions on our types.

Use a type annotation `::Rectangle`:

```julia
width(r::Rectangle) = r.width
```

Now if `width` is called on Rectangle, it invokes this specific code.
If `width` is run on a non-rectangle, then Julia will throw an error because no function yet exists to do that.

## Generic vs Specialized Fns

It's common in Julia to have Generic Functions and Specialized ones that only work on a type.

```
begin
    area(r::Rectangle) = r.width * r.height
    area(c::Circle) = pi * (c.radius ^ 2)
    area(x) = x
end
```

## Multiple Dispatch

```julia
# let's make a complex number
cc = 3 + 4im
```

You can use the `@which` macro to see which of the multiple dispatch versions of the method was called! Neato. E.g.

```julia
@which cc + cc
```

Will give you something like `Complex + Complex`. Whereas

```julia
@which cc + 3
```

will give you something like `Complex + Real`.

In Pluto notebook you can click directly into the source code as well. Very cool!

--

(NOTE to self: indent on windows in VSCode via tab or shift-tab)
