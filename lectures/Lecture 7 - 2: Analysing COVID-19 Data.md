# Lecture 7 - 2: Analysing COVID-19 Data

Goal: produce a map of the world with a circle sized according to case intensity.
interactive viz over time.

Real world data is messy. Some countries listed 1x, others in many rows.

Discrete data should always be plotted as points! Lines help guide our eye, but they don't mean anything.

Cumulative graph is smoother... corresponds to integration, which smooths.

Whoa! A date window is a blurring aka convolution!

Semi Log plot means: "one axis is linear, and the other is logarithmic"
https://en.wikipedia.org/wiki/Semi-log_plot

"Exponential growth has a technical meaning" :)

Interesting.. the exponential growth was actually BEFORE April (in USA), when the cumulative graph starts to look scary.

## Data Fitting

Least Square fitting (OLS) -- vary parameters of the curve until it minimizes distance to the points.

Whoa crazy, we can specify a model

```julia
model(x, (c, α)) = c .* exp.(α .* x)
```

which is passed into the function.

```julia
fit = curve_fit(model, x_data, y_data, p0)
```

The function in our `model` must accept a vector of data, so that's why we use broadcast operators.


In the Pluto notebook, we fit an exponential function to the line, during the exponential growth period (~20d).

## Geographical Data

- Need to cleanup data, then visualize them by lat-lng
- Can use a shapefile to visualize the map. shapefile is a vector containing polygons for each country.
- in plot, we use `ms` (marker size) to manipulate circle sizes
