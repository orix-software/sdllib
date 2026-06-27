## Syntax

int SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect);


## Description

Perform a fast blit from the source surface to the destination surface.

## Details
In this implementation, the srcrect parameter is currently ignored and the entire source surface is always blitted. For dstrect, only the x and y positions are used to determine the destination position; the width and height are taken from the source surface.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| src |src Pointer to the source SDL_Surface structure. |
| srcrect |srcrect Currently ignored. Intended for source rectangle definition (not implemented). |
| dst |dst Pointer to the destination SDL_Surface structure. |
| dstrect |dstrect Pointer to SDL_Rect structure. Only the x and y positions are used; width and height are ignored and taken from the source surface. |


***Returns***

* Returns 0 on success, or -1 on failure.
!!! note "For specific width and height scaling, use SDL_BlitScaled() instead."

