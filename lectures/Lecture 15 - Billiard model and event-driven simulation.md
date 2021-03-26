# Lecture 15 - Billiard model and event-driven simulation

video: https://video.cs50.io/FLDheVUjns0

## Overview
Rather than just doing tiny steps every `dt`, what if we instead calculated the "next collision"?

When does the disk hit the wall?

This will happen when the `(center of the disk) + r` intersects with the wall. You can think of the center as a particle (point).

## Digging into intersection

### Describing the Plane

plane in 2D: set of (x,y)

$$ax + by = c$$

$$x \cdot n = c = p \cdot n$$

The vector between `x` and `p` must be perpendicular to `n`


$$
(x - p) \perp n
$$

$$
\therefore (x - p) \cdot n = 0
$$

### Describing the trajectory of the particle
Given start position `x_0` and velocity `v`....

at time `t`, what is the position?

$$
x(t) = x_0 + t*v
$$

Careful: $\underline{x}$ is vector while  $x$ is a component, i.e. $\underline{x} = (x,y)$. $x$ is also sometimes a function, as in $x(t) = ...$

Similarly, $\underline{v} = (u,v)$ :sadness:

Other possible vector syntax include:

$\vec{x}, \overline{x}, \underline{x}, \bold{x}$

https://tex.stackexchange.com/a/75746

When does $\vec{x}(t)$ collide with plane? Let's call that time $t^{*}$

$$(x(t^{*}) - \vec{p}) \cdot \vec{n} = 0$$

Or, restated:

$$(\vec{x} + t^{*}\vec{v} - \vec{p}) \cdot \vec{n} = 0$$

Through algebra..
$$\vec{x} \cdot \vec{n} + t^{*}\vec{v}  \cdot \vec{n} - \vec{p} \cdot \vec{n} = 0$$

$$t^{*}\vec{v}  \cdot \vec{n} = \vec{p} \cdot \vec{n} - \vec{x} \cdot \vec{n}$$

We find a formula for $t^{*}$:
$$\therefore t^{*} = \frac{(\vec{p} - \vec{x}) \cdot \vec{n}}{\vec{v}  \cdot \vec{n}}$$

This formula is effectively: "time = distance / speed". The $\vec{n}$ means "in the direction of the normal, i.e. the shortest path between the point and the line.

### Considering multiple collisions
(@12m)

If you extend have several walls, there are several possible collisions. Each one of those times will be a $\tau_{n}$. We want the minimum time that is positive.

### After you collide (@13m)

We need to
- update our position
- compute a new velocity, based on reflecting off the wall.

The new velocity $\vec{v'}$ after a collision is:

$$\vec{v}' = \vec{v} - 2 (\vec{v} \cdot \vec{n}) \vec{n}$$

Where

- $\vec{v} \cdot \vec{n}$ is the magnitude of the part of the vector that was pointed to wall
- and overall it means "flip the part of the vector that was pointed toward the wall"

Another way of looking at it is

- $\vec{v_{\perp}}$ is the component of the velocity in the direction of the normal $\vec{n}$
- You can decompose `v` into $v = v_{\perp} + v_{\parallel}$
- Only the perpendicular velocity $\vec{v_{\perp}}$ changes. The parallel velocity $\vec{v_{\parallel}}$ is unchanged.

### Billiard Model (@16:30)

This is a chaotic system that was spawned from deterministic parameters.

In the shown model, the particles DONT bounce off each other, only the walls. The curve walls lead to defocusing and very quickly... chaos!

### Curved Boundaries

Easiest curve to simulate is a sphere (2D equivalent is a disc).

Same general idea: we are looking for $t^{*}$, the time where we intersect with the sphere.

There are 3 cases:
- no collision
- 1 collision ("grazing collision", tangent to shere)
- 2 collisions (enters and then exist)

The math here extends to 3 dimensions (or any number) by using vectors.

A vectorized version of "points on a sphere":

$$||\vec{x} - \vec{c}||^2 = r^2$$

or alternatively

$$= (\vec{x} - \vec{c}) \cdot (\vec{x} - \vec{c}) = r^2$$

Now that we have a formula, what's the time of collision?

### Time of collision for a curved boundary (n-dim sphere)

$$(x(t^*) - \vec{c}) \cdot (x(t^*) - \vec{c}) = r^2$$
$$(\vec{x_0} + t\vec{v} - \vec{c}) \cdot (\vec{x_0} + t\vec{v}  - \vec{c}) = r^2$$
$$...$$

We can derive $t^*$ via the quadratic formula!

_Attemping derivation..._

$$
\vec{x_0} \cdot (\vec{x_0} + t\vec{v}  - \vec{c})
+ t\vec{v} \cdot (\vec{x_0} + t\vec{v}  - \vec{c})
- \vec{c} \cdot (\vec{x_0} + t\vec{v}  - \vec{c})
= r^2$$

$$
(\vec{x_0} \cdot \vec{x_0} + \vec{x_0} \cdot t\vec{v} - \vec{x_0} \cdot \vec{c})
+ (t\vec{v} \cdot \vec{x_0} + t^2\vec{v} \cdot \vec{v}  - t\vec{v} \cdot \vec{c})
- (\vec{c} \cdot \vec{x_0} + \vec{c} \cdot t\vec{v}  - \vec{c} \cdot \vec{c})
= r^2$$

$$
2 (\vec{x_0} \cdot t\vec{v} - \vec{c} \cdot \vec{x_0} - t\vec{v} \cdot \vec{c})
+ \vec{x_0} \cdot \vec{x_0}
+ t^2 \vec{v} \cdot \vec{v}
+ \vec{c} \cdot \vec{c}
= r^2$$

$$
2 t (\vec{x_0} \cdot \vec{v} - \vec{v} \cdot \vec{c})
- 2 (\vec{c} \cdot \vec{x_0})
+ ||\vec{x}||^2
+ t^2 * ||\vec{v}||^2
+ ||\vec{c}||^2
= r^2$$

$$
t^2 * ||\vec{v}||^2
+ t * 2(\vec{x_0} \cdot \vec{v} - \vec{v} \cdot \vec{c})
- r^2
- 2 (\vec{c} \cdot \vec{x_0})
+ ||\vec{x}||^2
+ ||\vec{c}||^2 = 0
$$


We now have terms for $t^2, t^1, t^0$, so we can substitute those into the quadratic formula:

$$a = ||\vec{v}||^2$$
$$b = 2(\vec{x_0} \cdot \vec{v} - \vec{v} \cdot \vec{c})$$
$$c = - r^2
- 2 (\vec{c} \cdot \vec{x_0})
+ ||\vec{x}||^2
+ ||\vec{c}||^2 $$

$$t^* = \frac{-b \plusmn \sqrt{b^2 - 4ac}}{2a}$$

The discriminant $d = b^2 - 4ac$ will tell us how many roots (i.e. in this case, intersections) we have!

TIL: The "discriminant" is named as such because it discriminates how many solutions we have.



Which is the correct root?

- If we're outside the sphere, and I'm pointed toward it, we want the minimum of the two roots.
- If I'm inside the sphere, it's similar.

(@25:30)
Another way to think about this is "at the point of intersection, is my velocity pointing the same direction as the normal"? i.e.

$$\vec{v} \cdot \vec{n} > 0$$

Another subtlety throughout, when coding, is that we might not have *exactly* zero due to floating point numbers.

