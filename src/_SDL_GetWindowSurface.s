.export _SDL_GetWindowSurface
.import SDL_GetWindowSurface

.proc _SDL_GetWindowSurface
    jmp   SDL_GetWindowSurface ; SDL_GetWindowSurface is implemented in SDL_GetWindowSurface.s
.endproc
