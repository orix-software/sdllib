## Syntax

unsigned char SDL_GetRelativeMouseState(unsigned char *x, unsigned char *y);


## Description

Get the relative mouse state (movement since last call).
## Details
This function retrieves the relative mouse movement (in pixels) since the last call. The values are stored in the provided x and y pointers.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| x | Pointer |
| y | Pointer |


***Returns***

* Returns 0 (always) in this implementation.
!!! note "The actual implementation is in SDL_GetRelativeMouseState. This is a wrapper function."

