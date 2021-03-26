# Lecture 14 - What is an array, really?

Lecture video: https://video.cs50.io/gUZVpMUY4qY

Arrays are consecutive boxes in memory.
But in computer programming, they are an *interface*.
They have a length, the ability to look up an item, etc.

We need to extend a few methods for our type:
```julia
Base.size(T) = ...
Base.axes(T) = ...
Base.getindex(T, i::Int) = ...
Base.setindex!(T, val, i::Int) = ...
```

Some "special" things about arrays are just syntactic sugar.

`a[i]` is same as `get_index(a, i)`

and

`a[i] = x` is same as `set_index!(a, x, i)`

Some functions will work automatically once you've defined just the above! e.g. `sort()`, `reverse()`, etc .. though you could define a more optimized version given you type `T` if you want.

We've seen lots of `AbstractArray` types in Julia such as `UnitRange` (i.e. `1:n`).

You can use `supertypes(typeof(r))` to explore supertypes.

--

Lots of nice abstraction! An array is something that "looks like" and "behaves like" an array. You could *materialize* it into an array.

Why this abstraction? You may be able to store things more efficiently or be more performant via another underlying data structure.
