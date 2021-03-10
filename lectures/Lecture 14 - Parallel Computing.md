# Lecture 14 - Parallel Computing

## Background

How to use the many CPU cores in your computer to accelerate a computation?

Other options:
- a distributed computer (e.g. the "fastest supercomputers")
- GPUs

We'll look into multi-threaded computing, for this lecture.
This applied in a "shared memory" machine.

Most laptops have 2, 4, or more cores today (2021).

## Setup steps

[Run once] Run a command to setup Julia for n-threads, such as:

```
installkernel("Julia (4 threads)")
```
or
```
installkernel("Julia (10 threads)")
```

He's running in Jupyter instead of Pluto, since it was easier to demonstrate.

## Example: "Birthday" related problem, in parallel

Simulate 20 people with birthdays, randomly uniform from month 1 to 12.
What's prob of 4 months with 2 birthdays and 4 months with 3 birthdays?

Probability was `0.00107` (1 in 1000) and it took ~13s to run the simulation.

Recall, can use `@time` macro:

```
@time birthday_problem(x)
```

## Risks of parallism

Sometimes, people go to it too soon! Often you can improve you algorithm even if serial and get big speed gains.

For example, can use `@SVector` version in the serial implementation. Makes it massively faster (3.5s vs 13s).

`@SVector` tells Julia that this Vector is of a known length `n` (and won't change). Works well for <10 (or maybe <25) or so elements...

OK, what about using `@SVector` more? Adding it for the months vector (length 12)... Now we're 1.6s (13s => 35.s => 1.6s)

NO parallelism yet! Lots of performance improvements.

## Going Parallel

`using FLoops` (f-loops? floops? fruit loops?) to get parallelism.

Wrap the code in

```julia
function birthday_floop(t, ncores)
    v=0
    @floop ThreadedEx(basesize=t/ncores)
        ...
        @reduce(v += success)
    end

    return v/t
end
```

(NOTE: should use divide symbol instead of `/`)

rule of thumb: you have to do a simulation 100x more to get another decimal place of precision in the output

Can write similar function to the above but create a histogram, by `merge`ing histograms in the `@reduce`

```julia
...
    @floop ...
        @reduce(h = merge(empty_hist, distribution(x)))
    end
...
```

----

LEARNINGS:

- `@SVector` to optimize small, static vector performance
- `@FLoop` to wrap things and do parallel computation

Optional follow-up:

- https://www.youtube.com/watch?v=nwdGsz4rc3Q
