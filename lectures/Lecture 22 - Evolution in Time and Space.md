# Lecture 22 - Evolution in Time and Space: 1D Advection and Diffusion

Effects
1. Advection
2. Diffusion

## Overview of our model

Temperature is a function of 2 vars, time ($t$) and space ($x$).

$$T(t, x)$$

An ODE needs a starting value. Our initial distribution will be $T_0(x)$. To use it on a computer, we must discretize (approximate, finite) it. We'll sample the function at `N` discrete grid points. For simplicity they'll be equally spaced out.

In the example, the temp profile is a sin wave.
Grid points are at the center of the cell, and we think of it as representing an average. (However, you can see from the slope that it's not precisely the *average*.)

## Advection

The temperature profile should move with the fluid. Things carried in that way are called a **tracer**.

The temperature at a given point will change over time because heat is moving from neighboring cells.

We'll do a time-stepping algorithm.

$T^n_i$ will be the approx value of $T$ at position $x_i$ and time $t_n$.

A time step is therefore:
$$T^{n+1}_i \approxeq T(t_n + \delta t, x_i)$$

And a spatial step change is:
$$T^{n}_{i+1} \approxeq T(t_n, x_i + \delta x)$$

### Moving fluid
Suppose the fluid is moving with speed $U$. During a time step, we need to calculate how much fluid will leave the cell. Fluid within $U\delta t$ of the edge of the cell will escape. The the amount that will _leave_ the cell is:

$$T^n_i * (U\delta t / \delta x)$$

Correspondingly, the amount that will _enter_ the cell is:

$$T^n_{i-1} * (U\delta t / \delta x)$$

This means the `new amount = (starting amount) - (amount leaving) + (amount entering)`:

$$T^{n+1}_{i} = T^n_i - T^n_i * (U\delta t / \delta x) + T^n_{i-1} * (U\delta t / \delta x)$$

Simplifying...

$$T^{n+1}_{i} = T^n_i + (T^n_{i-1} - T^n_i) (U\delta t / \delta x)$$

Rearranging, we can say:

$$\frac{T^{n+1}_{i} - T^n_i}{\delta t} = U \frac{(T^n_{i-1} - T^n_i)}{\delta x}$$

These are **partial derivatives**, with respect to time and space. The indices that change for each $T$ correspond to the divisor (e.g. $n+1$ vs $n$ corresponds to a change in time, $t$). We have two derivatives with respect to different variables.

Denoting these as partial derivatives, we arrive at the "advection equation":

$$\frac{\partial T(t,x)}{\partial t} = -U \frac{\partial T(t,x)}{\partial x}$$

or for short:

$$\frac{\partial T}{\partial t} = -U \frac{\partial T}{\partial x}$$

This is a partial differential equation (PDE). It does have an analytical solution. But we're interested in solving it numerically, on a grid.

### Numeric solution for advection

Recall, we already had a time-stepping, discrete representation:

$$T^{n+1}_{i} = T^n_i + (T^n_{i-1} - T^n_i) (U\delta t / \delta x)$$

What should we do at the case where $i=1$, i.e. at the spatial boundary of our model? It's important to handle **boundary conditions**, especially in code where it will throw errors!

A simple solution for these is **periodic boundary conditions**. This is a convenient fiction. We'll assume the model is a "torus" (ring), where the point on the left boundary touches the point on the right boundary.

In the code we also have a function called `evolve`, the follows the Euler method but applied to a vector of values all at once per timestep.

**Outcome? imperfect**

We're seeing the sin wave move BUT it is also decaying, which isn't expected. This is because of how we're discretizing.

A better approach to discretize is to use the "centered difference".

$$\frac{\partial T(t_n, x_i)}{\partial x} \approxeq \frac{T^n_{i+1} - T^n_{i-1}}{2\partial x}$$

i.e. we look to the values on both sides and then find the average.

**Outcome of "centered difference"? better!**

This is reasonably accurate way to simulate, if timesteps are small enough.


## Diffusion

What is diffusion? examples:

- how temperature spreas from hot to cold
- how mass spreads out from high concentration to low concentration

The diffusion equation is a PDE, based on a second derivative:

$$\frac{\partial T}{\partial t} = D \frac{\partial^2 T}{\partial x^2}$$

To solve this with numerical (computer) methods, we need discretize this. In particular, the second derivative part is new. _One way_ to discretize the second derivative is:

$$\frac{\partial^2 T}{\partial x^2} \approx \frac{T^n_{i+1} - 2T^n_i + T^n_{i-1}}{\delta x^2}$$

ASIDE: thinking futher. This means that if the current value is close to the previous ($i-1$) value, the it's curving up (increasing at increasing rate).

We can now write that into code. Diffusion results in spreading out the profile of the sin wave. A simpler model with just a peak also shows that diffusing outwards.

## Advection + Diffusion

We can do this via a composition of functions. Now we see the sin wave's profile moving (advection) and decaying (diffusion).

They can occur together.
And they occur in a system in time and space.

Up next: extending to more spatial dimensions (1D => 2D).
