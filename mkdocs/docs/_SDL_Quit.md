## Syntax

void SDL_Quit(void);


## Description

Shutdown the SDL library.
## Details
This function cleans up all initialized SDL subsystems and deallocates any resources allocated by them. It should be called before exiting the program.

!!! note "The actual implementation is in SDL_Quit. This is a wrapper function."

