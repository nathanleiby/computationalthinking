
# Lecture 11 - verbs and nouns pt 2: parametric / abstract types

https://www.youtube.com/watch?v=2WVFvRfocjI&ab_channel=TheJuliaProgrammingLanguage

## Parametric Types

```julia
struct Point{T}
    x::T
    y::T
end
```

```julia
Point(1,2) # Point{Int64}
Point(1.0,2.0) # Point{Float64}
```

## Abstract Type

```julia
Point
```

This is the union (in set theory sense) of all the possible types for `Point{T}`.

whereas this is fully abstract:
```julia
abstract type AbstractPoint end
```


## Subtypes

The subtype relationship is written as `<:`

```julia
Point{Int} <: Point
```

## Checking a type
Check type with `isa`:

```julia
3 isa Int64
3.5 isa Float
3.5 isa Union{Int64,Float64}
```

## Generic methods

```julia
theta(p) # generic, serves as a fallback
theta(p::PolarPoint) # specialized method, that only works for some type
```

