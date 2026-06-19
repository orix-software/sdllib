.export _SDL_GetError

.import SDL_GetError

.proc _SDL_GetError
;const char  SDL_GetError(void);
    jmp    SDL_GetError ; SDL_GetError is implemented in SDL_GetError.s
.endproc
