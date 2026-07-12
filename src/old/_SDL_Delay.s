.export _SDL_Delay

.import SDL_Delay

.proc _SDL_Delay
    ;;@proto void SDL_Delay(unsigned int delay)
    ;;@inputPARAM_delay : delay in milliseconds
    jmp     SDL_Delay
.endproc
