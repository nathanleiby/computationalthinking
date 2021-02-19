# Lecture 12 - Macroscopic models: discrete vs continuous

https://www.youtube.com/watch?v=27OXvw3nkh4&ab_channel=TheJuliaProgrammingLanguage

instead of "specifically which people are infectious", just "how many people"?

## Discrete Time

previous approach: stochastic simulation, and then take average

"recurrence relation" or "difference equation"

```
I_{t+1} = I_{t} * (1 - p)
```

```
I_1 = (1 - p) X_1
```

TODO: revisit how to derive fn at 15:27 in video

## Continuous Time

```
P(delT) = lambda * delT
```

a **rate** is something per unit time

I(x) is now a function, instead of a discrete value.

aside: discrete and continuous representations are more similar than we usually make them seem.. it should be possible for us to easily move from one to the other (~18:45)

```
dI(t) / dt = -1 * lambda * I(t)
```

I(t) = I_0 * exp(-1 * lambda * t)

Growth is also like "compound interest"

--

So now we have 3 perspectives:

- stochastic at microscopic scale, with agents doing things
- averaging process to get a macroscopic description (global)
- continuous time representation as differential equation, allows for more analytical tools

## SIR Model

`S_t = number suceptible at timestamp t`

`s_t = normalized (proportion) of people suceptible at timestamp t`

discrete time SIR model at 23:40

continuous time model SIR at 25:00

This formula is same/similar to chemical reaction "mass action" models.
However, it assumes "anyone can interact with anyone else", so it doesn't realllly represent a pandemic.

No known analytics solutions of these nonlinear ODEs, but there are parametric solutions.
