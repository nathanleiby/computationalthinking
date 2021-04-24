# Lecture 21 - Nonlinear Climate Dynamics and Snowball Earth

## Review

For today, we'll ignore effects of human created CO2 (and hence that term in the equation can be replaced with 0).

Our ODE is a "linear" ODE because T^1.

Linear ODEs only admit one stable solution. For example, for pre-industrial earth we we found last lecture that this is 14 degrees Celcius.

## Background

"Snowball earth" about 700 million years ago. Everything covered in ice, from poles to the equator.

### Why? The ice-albedo feedback

In L20 we used a constant value of $\alpha = 0.3$ for the impact of reflection. However, over a longer time range (e.g. the whole ocean freezing over), this value will change.

$$
\alpha_{ocean} = 0.05
$$
$$
\alpha_{snow,ice} = 0.5\ to\ 0.9
$$

As ice melts, it becomes ocean, which lets more light in... this is a "positive feedback" loop.

We can do a crude representation of this by having three states.

1. fully frozen
2. partially frozen (we use a linear fn to scale)
3. fully ocean

and computing a value of $\alpha_i$ for each, a "temperature dependent" function for albedo.

Finally, we can include this function in our bigger EBM model's `timestep!` function.

### Alrighty! So now we have Multiple Equilibria

aka there are "multiple earths"

Recall
$$
\dot{x} = \mu + x^2
$$

In our world $x$ is temperature and $\mu$ is the albedo effect.

We see two outcomes, one where we reach 14C "no ice" and other where go into -40C "completely frozen".

There's also one special value (`~7.???`) where it's an "unstable fixed point". There, if the temp is at all in either direction, it will go toward one of the prior outcomes.

## Transitioning to and from Snowball Earth

We think sun has brightened ~40% over history of the earth.

Diagram showing that _starting point_ matters.. You reach different equilibria.

Also: We are changing the climate about as much 100-200 years as it has changed in millions of years before.

### Q: How did we exit snowball earth, historically?

Leading theory is that CO2 caused this. Volcanos erupting over millions of years released CO2 into atmosphere until so strong of greenhouse effect that it could overcome the albedo effect of the ice.

Now we're in *hothouse earth* like 50C.

Finally, CO2 gets stored in oceans over time, causing things to drop down and stabilize to today's temp.

HW: How much CO2 would you have to add to the snowball in order for the ice to melt?

## Towards realistic climate modeling

Demonstration of multiple equilibria in aquaplanet

- All water
- Ice caps (stable for a bit..)
- All ice
