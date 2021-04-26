# Lecture 23 - Ocean currents as two-dimensional advection diffusion

https://www.youtube.com/watch?v=waOzCGDNPzk

Henri Drake, PhD student in Climate Sci and Oceanography @ MIT

## (1) Background

We did the 1 dimension scenario of an advection-diffusion model.
Now we'll add second dimension.

### 2 dimension vs 1 dimensional

1 dimensional model:

```
temp change = advection + diffusion
```

$$\frac{\partial T(x,t)}{\partial t} = -U \frac{\partial T}{\partial x} + \kappa \frac{\partial^2 T}{\partial x^2}$$

2-dimensional model will add a second spatial dimension, $y$. We can think of $x$ as latitude and $y$ as longitude.


$$
\frac{\partial T(x,y,t)}
    {\partial t}
= u(x,y) \frac{\partial T}{\partial x}
+ v(x,y) \frac{\partial T}{\partial y}
+ \kappa \left(
    \frac{\partial^2 T}{\partial x^2}
    +\frac{\partial^2 T}{\partial y^2}
    \right)
$$

There's velocity happening in both $x$ and $y$ direction. $\kappa$ is diffusivity constant, previously called $D$ in other lectures.

We can think of $u$ and $v$ as separate velocities, or as a vector field:

$$
\vec{u}(x,y) = (u, v) = u\hat{x} + v\hat{y}
$$

## (2) Numerical implementation

### Discretize _advection_ in 2d

In 1d, we used the "centered finite difference" as a way to approximate the derative.

In 2d, we do the exact same thing, but we have to take the $y$ position into account.

You can also visualize this as a kernel:

```
[-1, 0, 1]
```

This kernel is much like an edge-detection / sharpening kernel.
Why? A gradient is "how fast are things changing", which also is what happens at an edge.

Since it's 2D, we'll need to do the same thing relative to $y$, i.e this kernel:

```
-1
0
1
```

To write this in Julia, we can create a several `advect()` functions:

1. function that computes the partial derivative in each direction for a given point. Computes using the "neighborhood".
2. function without a specific point, which computes over the whole matrix
3. a final method that uses the OceanModel as input, which we'll use later

### Discretizing _diffusion_ in 2D - Part II

Same idea, but the kernels look a bit different.

You give your value (substract -2) and give it to your neighbors.
```
[1 -2 1]
```

```
1
-2
1
```

This is like *blurring* in image processing.

Same idea for the `diffuse` functions where we have three forms. (pointwise, matrix-wise, and OceanModel special case)

...

Almost there, but what remains?

1. time-stepping
2. handling boundaries

### No-flux (Neumann) boundary conditions

We want the _advection_ term to be 0 at the boundary.
We also want the _diffusion_ term to be 0 at the boundary.

practically: when you hit land, it should be a hard boundary, the ocean wont flux heat into the land.

To handle this, we'll add an extra cells ("ghost cells") around our whole array. We won't compute on these at all! But they'll help enforce our boundary conditions.

We simply set the value of the "ghost cells" to be equal to their interior neighbor.

Nit: corner values for "ghost cells" seem like a special case, but also I don't think they every will be visited in the algo because they aren't neighbors of the interior cells.

### Timestepping

Pretty straightforward. Note that we have to refresh the ghost cell values on each call of `timestep!()`.

Q: What do the `[]` in `S.iter[] += 1` mean?

### Data structures

- `Grid`
- `Parameters` - just $\kappa$
- `ClimateModel` is an abstract type. we'll do several sub-types
- `OceanModel <: ClimateModel` is a specific kind of climate model
    - has `u` and `v` for _advection_ related velocity
- `ClimateModelSimulation` - wraps a `ClimateModel`, keeps track of timestepping, iterations run, and temperatures `T`

## (3) Simulating heat transport in `OceanModel`

We'll use a grid that 6000 km x 6000 km, which is approx size of the atlantic ocean.

Q: What kind of setup is he using for the visualization that evolves over time (shows clock and "start" / "stop" button)?

"anomalies" show changes relative to initial condition.

### Scenario #1

Start with simpler scenario. just diffusion, no currents ($u, v$ are 0). Put a big box of heat in the middle, so we can watch it diffuse.


### Scenario #2

- Box that spans the whole ocean.
- Velocity field is a "vortex" spinning CCW

This is not realistic. Closer to a "slow hurricane" but in the ocean :D

### Scenario #3 (more realistic)

South (equator-like) is warm and North is cold.

Gulf stream is pushing north.
Arctic water coming down.
Both branch east on hitting eastern US.

outcome: warming in SW boundary, cooling in NW boundary.

## Outro

So far, we have ocean currents + diffusion. If we ran this for much longer, diffusion would overwhelm and the temperatures would equalize.

In HW, we'll also add the idea of heating and cooling from solar radiation and how the ocean emits radiation to space. We'll also model that equator gets more sun vs north pole.
