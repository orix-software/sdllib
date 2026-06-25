.import SDL_FreeSurface
.export _SDL_FreeSurface

.proc _SDL_FreeSurface
    ;;@proto void SDL_FreeSurface(SDL_Surface *surface);
    ;;@brief Free a surface and release its resources.
    ;;@details This function frees the specified surface and releases all resources associated with it. The surface must have been created by SDL_CreateSurface or IMG_Load.
    ;;@param surface The SDL_Surface pointer to free.
    ;;@note The actual implementation is in SDL_FreeSurface.s. After calling this function, the surface pointer should not be used.

    jmp    SDL_FreeSurface ; SDL_FreeSurface is implemented in SDL_FreeSurface.s
.endproc
