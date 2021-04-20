# Iterative and Greedy numerical schemes for Poisson and Laplace

https://www.youtube.com/watch?v=f7g1LTfNmnA&feature=youtu.be

Laplace's equation:

$$\nabla^2f = 0$$

Another way of thinking about it is "my value is the average of my neighbors".

## Discretized, small example

Recall that pattern of resistors.

`4*(my volatage) = (sum of neighbors)`

Instead of solving a system of equations, let's consider an iterative programming approach.

iterative solution: solve coarsely, keep zooming in until you get to desired resolution

**"greedy algo"**

```
start with x_i = 0 and y_i = 0
do iterations..
    x_i = estimated_x, based on y_(i-1)
    y_i = estimated_y, based on x_(i-1)
```

**"A little more greedy"**

Slight optimization (called "gauss seidel") is to use the stepped forward value of $x_i$ that you just computed, rather than $x_{i-1}$.

```
start with x_i = 0 and y_i = 0
do iterations..
    x_i = estimated_x, based on y_{i-1}
    y_i = estimated_y, *based on x_i*
```
