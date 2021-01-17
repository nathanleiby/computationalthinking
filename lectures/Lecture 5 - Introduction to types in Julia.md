# Lecture 5 - Introduction to types in Julia

## Use Structs to create types

Video: https://www.youtube.com/watch?v=yU8P_cHPn8Q

Example data types:
- A rectangle has width and height.
- An imaginary number has real and complex part.
- A 2d position has an (x,y).

We could use a tuple with 2 entries.
BUT the issue here is that all these tuples might get confused! Let's define a specific type for each.

An object of type rectangle should have:
- a Type (name) that says it's a rectangle
- properties with correct names (width and height)
- ability to construct one


```julia
# struct names are `PascalCase` in Julia.
struct Rectangle
    width::Float64
    height::Float64
end
```

```
r = Rectangle(1, 2.5) # create a Rectangle
r isa Rectangle # true
```

An object is a like a box that contains the relevant data.
We called this a "Composite type" or "Aggregate type", to describe that the disparate pieces of data belong together.

## Structs are Immutable by default

Immutable often leads to faster code. Safer as well.

You can explicitly tag a struct as `mutable`.
