# Lecture 14 - Raytracing in 2D

(10m) Dot product can be thought of as the projection of A onto B:


$$A \cdot B $$

You can write dot product via trig functions:

$$A \cdot B = \lVert A \rVert \lVert B \rVert cos(\theta)$$

A convenience we will apply later is that when those vectors are both normalized, i.e. $\lVert A \rVert = 1$ and $\lVert B \rVert = 1$, then we can simplify to:

$$A \cdot B = cos(\theta)$$

## Refraction
_Begins at 12m_

The speed of light is the same regardless of your medium.

```
n = index of refraction
s = speed
```

$$c = 3.0 * 10^8 meters/sec = n_{air} * s_{air} = n_{water} * s_{water}$$


$$\frac{n_{air}}{n_{water}} = \frac{s_{water}}{s_{air}}$$

**Snell's Law**

$$=\frac{sin(\theta_{water})}{sin(\theta_{air})}$$

$$l_{water} = -\frac{n}{cos(\theta_{water})}$$

...

Conveniences used in notation are $c$ and $r$. $r$ is the ratio of the indices of refraction:

$$r = \frac{n_{air}}{n_{water}}$$

$$c = cos(\theta_{water}) = \sqrt{1 - r^2 (1 - cos^2(\theta_{air}))} = -\hat{n} \cdot l$$

TODO: Which $l$ is this? I think $l_{water}$

$$l_{water} = rl_{air} + rc - \sqrt{1-r^2(1-c^2)}$$

TODO: Where does the above come from?

TODO: Consider rewriting in different variables names to align better with code? (ior, etc)

TIR = "Total internal refraction". If you approach at a shallow angle, there's a possibility that you could reflect instead of refract.

## Lenses

For this lecture, we'll only deal with circular and spherical lenses.

Light bends toward the normal when entering, and then away again when leaving.

When multiple entry angles do theis, they end up meeting at a point... focusing... this is called "Spherical abberation".

We need to find the direction of the normal to see if light is approaching the lens or leaving the lens.

How to find the normal of the sphere?

```
n_sphere = normalized(ray.position - lens.origin)
```

