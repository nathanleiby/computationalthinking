# Simulating an Epidemic

https://www.youtube.com/watch?v=gxAaO2rsdIs&ab_channel=3Blue1Brown

- Suceptible - don't have disease yet
- Infectious - Whenever someone is sick and within a certain "infection radius" (this is a standin for interactions like sneezing, kissing, etc).
- Recovered - If "recovered" post disease (OR if they die .. sometimes people use "removed")

--
changes:

What if we double the infection radius? DRASTIC spike on the curve, Also reminder that this big spike is also when hospitals are overwhelmed and more death due to the disease.

What if decreasing `P(Infection)` from 0.2 -> 0.1 (e.g. better handwashing)? spreads out the curve. doesn't spike as much.

_=> Key Takeaway 1: Growth is very sensitive to parameters we can control._

- What happens if people visit a central spot?
- What happens if we have a few communities with transit between them?

The MOST effective, is to identify and isolate whoever is infected. (quarantine them 1d after they have the infection). This halts the epidemic in its tracks.

What if 25% of people fail to get quarantined (e.g. no symptoms). Still quite good for a lower spike, but it spreads out the epidemic over a long, slow period.

Quarantined 80% of infectious cases (but after the disease begins, since we don't start quarantined right away). If you quarantined only 50% of cases, it's barely better than nothing at all.

_=> Key Takeaway 2: Changes in quality of quarantine has BIG effect on disease outcome_

Reminder that lethal diseases aren't as infectious. Terrible for those who get it (dead), but the disease doesn't spread.

The most dangerous diseases kill some but are unnoticed (asymptomatic) in others.

2002 SARS Outbreak was easier to isolate because almost everyone shows symptoms.

Correlary: if we can cure the infectious people quickly, it also moves them out of the infectious group.

--

Now, we'll explore the "social distance" factor.

Experiment.. after hits 50 case, "social distancing" enabled for some % of population. What is the impact? If 100% avoid, it does flatten the curve. But even 70-90% still means half of pop still eventually gets the disease. it's just over a slower time.

Even 10% of population cheating keeps the disease at a slow burn :( These are toy models, ofc, but...

_=> Key Takeaway 3: Social Distancing works, but even small inconsistency prolongs the infection_

--

Travel rates. What if people move to a different community periodically?

How does changing the travel rate impact things?

In general, the earlier you enable, the beter.


_=> Key Takeaway 4: Reducing transit between communities, once they already have disease, has a limited effect._

Simulating large cities, you can see how it gets into the city early and spreads within them, so it's too late for travel ban to matter.

- `R - Effective Reproductive Number`
- `R_0 - Basic Reproductive Number`

f R>1, epidemic. growth is expontial. ~1 is "endemic". <1 is on the decline.

- `R_0 ~= 2` for COVID-19 and for the 1918 Spanish Flu.
- Seasonal flu has `R_0 ~= 1.3`

"Central Hubs" (Market, school). These cause a big jump in R_0 in his simulation. Going to the *exact* same spot is a bit extreme in his example. Cuts `P(Infection)` in half.

_=> Key Takeaway 5: Shared central locations dramatically speed up the spread_

Social distaning + central location?

@18m - LOL, some dots go outside of the graph to escape :)

Keeping the central hub is probematic!

Changing people's movement (1/5 going to hub) vs reduced infection rate (1/2, e.g. better hygiene, masks) have similar impact.

---

Best case scenario: "Consistently ID and isolate cases". They don't have to change any behavior!

Contact tracing also lets you isolate known cases AND potential cases.

---

Deeper apprecation for
- early, widespread testing
- therapeutics that can cure the disease

Hard to recognize these when times are good. We must swiftly find and contain things, and we won't see this impact directly as regular old civvies.


