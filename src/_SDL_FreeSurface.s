.import SDL_FreeSurface
.export _SDL_FreeSurface

.proc _SDL_FreeSurface
    jmp    SDL_FreeSurface ; SDL_FreeSurface is implemented in SDL_FreeSurface.s
.endproc
