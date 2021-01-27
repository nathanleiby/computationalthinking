# Lecture 8 - Probability via Computation

What about epicdemic "modeling"?

To begin, we will think of people as "agents" (or "individuals"), and describe them.

requires things like:
- random movement
- chance of infection (probability)

Calling `rand` on a list does uniform sampling.

Can get an array of `n` random outputs via `rand(collection, n)`

Convenient way to count number of occurences of each item in a map:

```julia
freqs = StatsBase.countmap(sample)
```

aside: `StatsBase` is a fundamental (base) package reused in many Julia statistics packages

We use a bar chart b/c number of rolls is discrete and outcome is discrete.

"Monte Carlo simulation".. run a simulation many times, with varying randomness each time

Computers can't get "true randomness".. it's possible via atmospheric measure or other physical inputs.. it's possible to init your program with a "true randomness" input from such a source. However, on the computer we generally use pseudorandomness.


Can prove (advanced probability) that as you take more and more rolls, you approach uniform. "Law of Large Numbers"

Best practice when visualizing / running simulations with randomness: add each new outcome to the previous outcomes. That way they aggregate together in a way that's more intuitive, vs fully resetting.


## Random variables

```
P(X = 1) = 1/6
```

Julia lets you write in tex like:
```
$$\mathbb{P}(X=1) = \textstyle \frac{1}{6}$$
```

Outcome of a random variable is called a "variate"

Doing a Bernoulli trial (coin-flip with probability = `p`):

```
bernoulli(p) = rand() < p
```

The **Probability Distribution** is all possibile values and their probabilities.

## Array vs Generator

Generator is more efficient. Doesn't need to allocate array. Perhaps 2x faster in this case:
```Julia
# array
flips(n,p) = count( [ bernoulli(p) for i = 1:n ] )
# generator
flips2(n,p) = count( bernoulli(p) for i = 1:n)
```

## Random Variables IID => converges to Normal Distribution

The empirical distribution (calculated from data) converges to the population distribution (mathematical distribution).

Central Limit Theorem.
https://en.wikipedia.org/wiki/Central_limit_theorem
