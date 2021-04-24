# Lecture 20 - Introduction to Climate Modeling

## What are we solving?

```
change in heat =
    + absorbed solar radiation
    - outgoing thermal radiation (e.g. blackbody cooling to space)
    + human-caused greenhouse effect (trapped outgoing radiation)
```
**Absorbed Solar radiation**

- only hits ~1/2 of the planet.
- also, .3  is reflected back to space

$$
Absorbed\ Solar\ Radiation = \frac{S(1 - \alpha)}{4}
$$

**Outgoing Thermal Radiation**

First order Taylor

$A \equiv G(T_0) - G'(T_0) * T_0$

$B \equiv -G'(T_0)$ ... "climate feedback parameter"

$$
Outgoing\ Thermal\ Radiation \equiv G(T) \approx A - B(T)
$$


We can solve for one parameter of "pre-industrial" by setting:

`absorbed solar radiation = outgoing thermal radiation`


---
```
CT = Heat Content of a system, where
C = heat capacity
T = temp in Kelvin
```

In practice, C can be thought of as a constant.

So the change in heat content is
$$
C \frac{dT}{dt}
$$

## Can't easily solve analyticaly, do let's solve numerically

At a high level

$$
T_{n+1} = T_n + \Delta t * tendency(T_n; ...)
$$

where `tendency` wraps up all the various terms we've described above that can influence the temperature.


## Running the model

Temps didn't change much until ~1850. Climate was stable.

Pre-industrial... If we pretended to start at a very different temp, things still stabilize.

But Post-industrial, the balance was changed.

## Predicted vs actual growth in global temp

How to reason about the noise that doesn't follow the trend?

It's not that we cannot measure temperature well.

It is actual. The climate system itself is turbulent. More sophisticated models attempt to capture this.

## Projected temperature

We have to take a guess on what CO2 looks like. So let's try a "low CO2" and a "high CO2" scenario.

There is some uncertainty in the model, and we can run monte carlo simulations to explore that.
