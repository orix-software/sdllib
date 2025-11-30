.export _SDL_Quit

.import SDL_Quit

.proc _SDL_Quit
    ;;@proto unsigned char SDL_Quit();
    ;;@brief Quit sdl
    jmp    SDL_Quit
.endproc
