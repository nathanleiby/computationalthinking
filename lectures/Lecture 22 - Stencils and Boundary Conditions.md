# Lecture 22 - Stencils and Boundary Conditions

https://www.youtube.com/watch?v=sbqPVPLHl5Q

How might you implement various boundary conditions (using stencils)?

## Background

What is a stencil:
1. window
2. slide it
3. apply pattern

How to handle boundaries?
- ignore it, slide off the edge
- disallow crossing the boundary

## Stencils in Computation

Now we'll do stencils in computation...

Start with a data matrix. Apply it as a stencil (multiply things in our array by coefficients in the stencil).

## Useful Julia concepts

`CartesianIndex(x,y)` to access a matrix without using 2 indices. Comprehension like `[ data[i] for i in I]` will work with those indices!

`OffsetArray` can allow you to make something 0-indexed.

Can combine `OffsetArray` with `CartesianIndices` to create a "neighborhood" surrounding a central point. e.g. `a[-1,-1]` is left and down of the central point.

## Using the stencil

Applying the stencil over a data matrix input is equivalent to running a Jacabi.

Very compact way to express applying the stencil to all points:
```julia
for i in I
    B[i] = sum(A[i.+neighborhood]).*stencil
end
```

## Boundary condition choices

- "zero derivative" out of bounds value is same as boundary value
- "periodic" boundary conditions wrap-around

## Conclusion

This approach is common and effective in computationally intense scenarios.


