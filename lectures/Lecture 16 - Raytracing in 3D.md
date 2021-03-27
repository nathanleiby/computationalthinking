# Lecture 16 - Raytracing in 3D

## Previous lectures
- Recall at end of previous lecture, we wrapped up with spherical abberation (due to refraction on entry and exit from lens)
- Recall also the billiard model, where we focused on points of collision, rather than time stepping

"event driven simulations"

## Getting ready for ray tracing

Simplifications in our Ray Tracing:
1. just sphere, not arbitrary shapes
2. simplistic 3D models, it's not Cyberpunk 2077

Example image where each sphere includes: a color, reflecting (on/off), refracting (on/off).

## What is ray-tracing?

How will we move from 2d to 3D? We will draw a "screen", a 2d set of pixels. We are projecting something from 3d space onto a 2d screen. Simplification of "eye as camera".

Skybox... many points of

Camera is pointed exclusively down in the Z direction.
