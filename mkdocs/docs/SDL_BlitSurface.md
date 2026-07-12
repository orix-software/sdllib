---

## SDL_BlitSurface

***Description***

Performs a fast blit from the source surface to the destination surface.

***Input***

* Accumulator : src Pointer to the source SDL_Surface structure (low)
* X Register : src Pointer to the source SDL_Surface structure (high)

!!! note "If specific width and height scaling is needed, use SDL_BlitScaled() instead."

!!! note "This is a simplified implementation that always blits the entire source surface."

