# Lecture 20 - Nonlinear Dynamics: Stability and Bifurcations

## ODE background

Simplest models are Ordinary Differential Equations (where one, or a few, variables change in time)

General form
$$
\frac{dx(t)}{dt} = \dot{x}(t) = f(x(t))
$$

We also need the value of x at time 0, `x_0`.

The (forward) Euler method looks like:

$$
x(t+h) \approx x(t) + h f(x(t))
$$

We are writing our own functions, but Julia has great packages for this that you should use in the real world.

## Solving the ODE: Euler Method

Bacteria Example...

Growth rate with infinite food:

$$
\dot{x} = \lambda x
$$

Growth rate with constrained food, where population limit is $K$:
$$
\dot{x} = \lambda x (K -x)
$$

This is a called a "Logistic differential equation" (though not a great name; "logistic" means something different here?).

For $\lambda = 1, K=1$:

```julia
logistic(x) = x * (1 - x)
```

Qualitative behavior... as t goes to infinity, we converge to a fixed value.

But what about other starting conditions? For any positive value, we always converge to 1. But if starting value <1, we diverge to +/- infinity.

Cool graph showing all the behaviors on one graph.

Is a "fixed point" stable or unstable? Take the derivative of $f(x)$ at that point to find out!

We generally can't find this analytically, so have to determine the derivative numerically. These are root-finding methods: Newton's method, etc.

0 is an "unstable fixed point" in the prior example, since everything moves away from it.

## State Space: Vector field and phase portrait

What if we remove time from the picture? Instead, our goal is to depict all possible states of the system.


## Bifurcations

$$\dot{x} = f_u(x)$$

Example:

`g(u, x) = u + x^2`

Now you can stack all the digrams for various values of `u`.

A bifurcation means that system changes behavior qualitatively on either side of a given value for `u`.

## Bistability and Hysteresis

bistability = 2 stable, coexisting fixed points

We often draw this diagram without showing the vector directions. Just the fixed points (distinguished by stable and unstable).

If `u` changes slowly over time, then `x` will have converged to a fixed point and then track along the curve of fixed points.

.. but what happens when we get to the end of the fixed points? The "bifurcation point".
In this diagram, it will suddenly shoot up to a totally different equilibrium. Yikes!!

System "jumps" from lower branch to upper branch very quickly.

Bistability means that which fixed point the value is in depends on its history.
This kind of loop is called a "hysteresis" loop.

Another example: Genetic Switches that can be in one of two different "on/off" states.

