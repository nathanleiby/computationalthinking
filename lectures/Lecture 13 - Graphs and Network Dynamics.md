# Lecture 13 - Graphs and Network Dynamics.md

## Overview

1. Graphs
2. Viral infections
3. Fun Examples
   1. julia packages
   2. twitter

## Graphs

### Matrix representation

Alan <=> David

Represented as an adjacency matrix:
```
    A D
A [ 0 1 ]
D [ 1 0 ]
```

- 1 means edge, 0 means no edge
- we don't draw edges to self

Alan <=> David
David <=> Grant

```
    A D G
A [ 0 1 0 ]
D [ 1 0 1 ]
G [ 0 1 0 ]
```

### Degree sequence

Another way we sometimes display a graph is via a "degree sequence". Degree is the number of edges coming out of a vertex.

As a graph it might look like

```
3 x x
2     x x
1
0 ========
  A D G H
```


#### Side note: havel-hakimi algorithm

game to build a graph, given the degree sequence of each node:  http://jacquerie.github.io/hh/

### Clique

- `k-clique` is `k` nodes where all nodes are connected
- an edge creates the minimal clique (`k=2`)

### Networks

Given an adjacency matrix $A$, what might it mean to take $A^{2}$?

In the example, $A^{2}$ helped us immediately understand if there was only one path between the two nodes. It also showed us "how many paths are there from $x$ => $y$?" as well as "what is the degree of node $x$?"

$A^{2}$ helped us count paths of length 2. Similarly:
$A^{3}$, $A^{4}$, etc gives us paths of length 3, 4, ...

Triangles in networks are very interesting, so being able to count them via linear algebra ($A^{3}$) is helpful.


### Models

- Erdos Renyi Model
  - given `n` nodes, to decide if you will attach 2 nodes, run a bernoulli (flip a biases coin)
- Preferential Attachment Model
  - preference to attach to nodes that are already highly established (high degree, clique)
  - every time a new node comes it, it gets attached, and then the probability distribution changes for what occurs when we attach subsequent nodes


## Viral Infections

Model has a probability $\rho$, that defines the chance someone infects another person.

Focus on `viral_spreading.jl`.

One cool way we make the algorithm performant relies on this property of exponents and logs:

$$a * b * c = e^{log(a) + log(b) + log(c)}$$

`P(i infected at time T)` is a series of multiplications of matrices.
Using the above property, we can convert this to a summation of matrices for better performance.

Ends with a visualization of viral spread over a network.

## Fun Examples

_Background: Page Rank intuition_

Page Rank algo has cool connection to eigenvectors and eigenvalues!
But those are somewhat out of scope for this class. So let's try a different intuition.

TODO: Review eigenvectors and eigenvalues (e.g. 3b1b video)

Let's think first about "goods transport" in a network. You can go from an adjacency matrix to a "column stochastic matrix" version where the sum of each column is one (i.e. a probability distribution). This gives you a chance of moving to each neighbor.


### Example 1: Julia Package Ecosystem

`julia_package_ecosystem.jl`

If a package requires another package, there's an edge between them.

Has a simplified version of pagerank algo (for teaching, not optimized) called `our_first_pagerank`.

### Example 2: Twitter Data

`generate_graph.jl`

Scraping the data took about 1d.

Used a python lib for scraping. Cool/crazy that you can call python easily from within Julia.

```julia
using Pycall
@pyimport twint as twint
...
```

Building a graph of usernames and who they follow.

TODO: What is GLANCE, do we need to use it or just a convenient lib she uses?

