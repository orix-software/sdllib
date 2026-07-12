.export SDL_GetWindowSurface

.include "include/SDL.inc"

.import sdl_window_main

.proc SDL_GetWindowSurface
    lda     #<(sdl_window_main + SDL_Window::surface)
    ldx     #>(sdl_window_main + SDL_Window::surface)

    ; Returns a pointer to the SDL_Surface structure associated with the window, or NULL if the window has no surface
    rts
.endproc
