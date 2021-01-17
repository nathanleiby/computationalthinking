# Lecture 5 - Structure and Dispatch

## Taking Advantage of Structure

Video: https://www.youtube.com/watch?v=ConoBmjlivs

### Intro

Is a matrix really an `m x n` table of numbers? Yes, but it doesn't mean you need to store `m x n` numbers in your computer in order to store one! We often want to store things MUCH more efficiently.

"Always take advantage of structure"

In this lecture, we'll do it for storage. But in many algorithms, we take advantage of structure in order to save time. These are both essential in computational thinking.

In Julia, there's no overhead to using structure. ("no"? minimal?)

### 1-Hot Vectors

Example of a matrix that can be stored efficiently: a 1-hot vector.

Suppose it has a length of 6. You don't need 6 numbers `[0,0,0,0,1,0]` to store it. Rather, you just need the length (`6`) and the position (`5`) of the 1.

`<:` means "is a subtype of"

```julia
struct OneHot <: AbstractVector{Int}
    n::Int
    k::Int
end

Base.size(x::OneHot) = (x.n,)
Base.getindex(x::OneHot, i::Int) = Int(x.k == i)
```

in English: "we want `OneHot` to pretend to be a vector of integers"

Handy fn for debugging is `dump`, which will print out the underlying representation. `print` actually pretty-prints the `OneHot` and it appears just like a regular vector.

> You don't have to store it as a table to use it as a table.

Ultimately, what we're building here are some of the key intuitions that allow us to compress images.

### Diagonal matrices

If you created a matrix on a diagonal, you can convert to a diagonal matrix via `Diagonal(M)`. The point here again is that the only numbers that need to be stored at the elements along the diagonal. The rest can be assumed to be 0.

### Sparse matrix

This also already exists in Julia, via `sparse(M)`.

Again. We don't store any of the `0`s in the matrix. So how do we know?

One approach is the `(i,j)` value. Just keep track of position + value for elements that are non-zero.

Another approach is "CSC" column-sparse-compressed.

### Random Vectors

What about keeping just Mean and StdDev?

This might be enough information in some cases! You could throw away the numbers and you still have the key info.

It requires judgment as to whether you need the underlying information or just the summary.

### Multiplication Tables

"outer product"

```julia
outer(v,w) = [x * y for x in v, y in w]
```

This can generate generalized multiplication tables, as a 2d matrix.

You could store a 10x10 multiplication table (100 outputs), or you can store just one number (the max size). Suppose you wanted a `10^9 * 10^9` sized table! Then storing it would be crazy. Just compute what you need, when you need.

Q: If someone gives you a generalized (multiplication) table, can you compute two vectors whose outer product would result in that matrix? => YES.

See `factor()` fn in lecture. Note that the vectors can be scaled arbitrarily, i.e. one can be multiplied by `n` and the other one by `1/n`.

OK, so we have multiplication tables. What can we do with them?


We could sum them:
```julia
A = sum( outer(rand(3), rand(3)) for i=1:2 )
```

If we do this... can you find the underlying matrices? YES, via singular-value decomposition (`svd`).

`U, Sigma, V = svd(A)` returns 2 matrices (`U`,`V`) and a vector (`Sigma`)

If you do an longer (infinite?) summation, it will exactly reproduce the matrix. But if you do a simpler sum, it serves as a good approximation.

### Image Compression

The point of the "Flag" section is that we can represent simple "Flags" via far fewer underlying numbers than one per pixel.

You can decompose a picture into 3 channels. Each of these is a matrix describing the intensity of that channel. In the picture of a tree, you can see that the tree itself is black in the Red and Blue channels, but lighter in the Green channel because it is green!

What happens if we try to approximate each channel using SVD?

Lol, SVD with `n=2` ("the sum of `n` multiplication tables"), he calls a "minecraft tree".

The size of the actual image here is `216x384`, where as we are storing (???).

This is lossy. It's not perfect, sure, but it's a decent first pass! Compression in JPGs doesn't actually use this, but instead another algorithm that's designed for pictures.

Other implications: SVD relates to Principal Components Analysis (PCA). It's useful to pick out a small number of key parameters.





