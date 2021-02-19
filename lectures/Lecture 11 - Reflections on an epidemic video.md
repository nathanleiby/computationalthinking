# Lecture 11 - Reflections on an epidemic video

https://www.youtube.com/watch?v=ErO_Hy01X98&ab_channel=TheJuliaProgrammingLanguage

Building an SIR model.

In previous video, he used a radius (proximity) as a proxy for all the interactions you might have with someone.

He's doing a slightly smoothed random walk to look nice.

But it's not really that accurate to how people really interact. People actually have social circles, not fully random. But since he didn't have real social networks and real geographic models, so this was a simplified version.

## What's redeeming about toy models?

How does tweaking a parameter effect the qualitative outcome?
It's likely that the relationships are still relevant!

- e.g. "doubling the radius of infection" is a proxy for "a disease that is more infectious"
- e.g. changing the "probabilty of infection"

Can also build toy model such that `R_0` (r-naught) aligns with realistic value, then tweak from there.

## What is R vs R-naught?

R = "effective reproductive number"

Everyone a person infected while they were infectious (before they recovered).
i.e. "actual"

R-naught = "basic reproductive number"

Reproductive number in a population where everyone is suceptible.
i.e. "at timestep 0"

R = 1.51 in his first toy examples, to match reproductive rate of Sars CoV 2.

- Sars Cov 2 = the virus
- Covid 19 = the dise

## Simulation tweaks

In some ways, the "social distancing" in his example is more of a particle simulation vs reality.

quarantine- remove from population after infected (after some amount of time, with some probability)

tweak asymptomatic cases (cannot quarantine)

## Suggestions

- Ask your own questions!
- Figure out what changes you'd need to make to your model, in order to answer them?

