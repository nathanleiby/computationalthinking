# Lecture 7 - 4: Functions are Objects

teacher = fons

core idea behind "functional programming", e.g. `map` and `filter`.

"I've prepared a dataset, which is an array of 7 dogs" :D

How to filter?

```julia
filter(dog -> dog.age > 7, data)
```

Recall that `do` syntax can be used to write the same thing as above.

```julia
filter(data) do dog
    dog.age > 7
end
```

Why introduce this new syntax to do exactly the same thing?
Functional programming is easier to understand and explain.
"At some point you spend more time reading code than writing code"
