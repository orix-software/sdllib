## Syntax

SDL_Window* SDL_CreateWindow(const char *title, unsigned char x, unsigned char y, unsigned char w, unsigned char h, unsigned char flags);


## Description

Create a window with the specified title and flags.
## Details
In this implementation, the x, y, w, and h parameters are not taken into account. Only the title and flags are used.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| title | The |
| x | The |
| y | The |
| w | The |
| h | The |
| flags | Window |


***Returns***

* A pointer to the created SDL_Window, or NULL on failure.
!!! note "The actual implementation is in SDL_CreateWindow.s. Position and size parameters (x, y, w, h) are ignored."

