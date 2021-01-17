# Week 2:

## Lecture 3 -- Shrinking images and dynamic programming

### Seam carving
https://www.youtube.com/watch?v=rpB6zQNsbQU

How to understand partial derivative with respect to `x`? i.e. rate of change as we move left to right.

```
A B C
D E F
G H I
```

Some ideas:
- `(F - E)`
- `(F - D)`

Sobel is something like `(C - A) + 2 (F - D) + (I - G)`
which gives more weight to the middle row.

"partial derivative in a direction"
aka
"gradient vector"
aka
"descent/ascent"

If we just look at the magniture of the gradient vector, we get a sense of the "edge".
Additionally, a larger gradient implies a sharper edge.

#### Seam Carving Algorithm

Greedy: choose minimum value on top. Then choose an adjacent, below pixel that has minimum value. problem is that it's not guaranteed to be test best.

Dynamic programming: memorize some sums along the way, to avoid repeated computation.

"Edginess" aka "Energy" is the value of each pixel. Our goal is to create a new grid. In each square, we'll store "Minimal energy from this pixel to bottom". Work from bottom to top.

`(3 * n)` steps => `O(n)`

cool - this "minimum energy to bottom" image with triangle shapes above.

In the `least_energy` algo, we also need to keep track of the direction we stepped, so we can easily retrace the best path.

The seam carving algo seems to fail on an example like "Starry Night" painting, where the background is highly detailed. In fact, the dark foreground gets removed simply because it has few edges. Perhaps we could do this with a different energy algo, vs "edginess".

WHOAZ, if you had a UI that lets you assign energy, you could target what you want to remove!

### Array Slices and Views

Followed along, and took notes in `scratch.jl`.

### GPUs

goal: see the power of a GPU. to do his blurring example, it's 100x faster than CPU!

Julia's goal -- don't have to learn a new language to run on a GPU. "Code portability".

`cu` means `cuda`, the NVidia language for doing GPU computations.

GPU started out being useful for graphics processing. But the same horsepower can be applied to certain kinds of computations. Very regular ones work great!

- matrix multiplication
- convolutions
- parallelizable

CPU better at general purpose computation with wider variety.

#### How does Julia make things easier?

- Julia has `CartesianIndices` method, allowing you do compute lots of offsets to neighbors! So useful :D Allows for a very elegant invocation of Gaussian filter across a grid of points.
- views are really nice to avoid extra memory movement during a copy.
- broadcast operation is good parallel to how GPUs work
- key difference in GPU is to use `cu` command to move data from CPU to GPU, but otherwise logic in normal Julia! (warns that "devil is in the details" tho, so I expect there's more!)

### Convlutions in Real World

MIT "Mens et Manus" - Mind and hand

Adobe Premier. ML Software (Flux).
Building yourself vs using a product.
