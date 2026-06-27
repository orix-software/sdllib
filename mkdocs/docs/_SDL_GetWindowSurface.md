## Syntax

SDL_Surface* SDL_GetWindowSurface(SDL_Window *window);


## Description

Get the surface associated with a window.
## Details
This function returns the surface associated with the specified window. The surface can be used for drawing operations.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| window | The |


***Returns***

* A pointer to the SDL_Surface associated with the window, or NULL on failure.
!!! note "The actual implementation is in SDL_GetWindowSurface.s."

