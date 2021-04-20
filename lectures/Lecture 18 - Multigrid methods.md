# Lecture 18 - Multigrid methods

https://www.youtube.com/watch?v=rRCGNvMdLEY&feature=youtu.be

Example of heating a room. `u` is fixed on the boundary. Various node have different temperatures.

![](2021-04-08-13-55-06.png)

TODO: What is the question??

Continuous representation:

$$
\frac{d^2u}{dx^2} + \frac{d^2u}{dx^2} = 0
$$

Discretized representation:
$$
$$u(i+1,j) + u(i,j+1) + u(i-1, j) + u(i, j-1) - 4u(i,j) = 0$$

The problem is then to solve the above for $(i,j)$ in our grid.

---$$

Setup:
1. Defined a grid.
2. Defined boundary_conditions.
3. (bonus) Visualized colors based on heat.
4. Now, run jacobi a bunch! `jacobi_step`
   - iterates over every point in the interior of the array
   - `T'` is the update (the "discretized representation" below)

