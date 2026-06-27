## Syntax

unsigned char SDL_Init(unsigned char flags);


## Description

Initialize the SDL library.
## Details
This function initializes the SDL library with the specified subsystems. In this implementation, it supports SDL_INIT_VIDEO and other standard SDL initialization flags.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| flags | Initialization |


***Returns***

* Returns 0 on success, or a non-zero error code on failure.
!!! note "The actual implementation is in SDL_Init."

