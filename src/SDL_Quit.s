.export SDL_Quit

.include "telestrat.inc"

.proc SDL_Quit
   BRK_TELEMON    XTEXT
    ;;@brief Quit sdl
    ;;@```asm
    ;;@` jsr  SDL_Quit
    ;;@` rts
    ;;@```
    rts
.endproc
