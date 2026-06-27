## Syntax

void SDL_FreeSurface(SDL_Surface *surface);


## Description

Free a surface and release its resources.
## Details
This function frees the specified surface and releases all resources associated with it. The surface must have been created by SDL_CreateSurface or IMG_Load.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| surface | The |

!!! note "The actual implementation is in SDL_FreeSurface.s. After calling this function, the surface pointer should not be used."

