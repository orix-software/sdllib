;include "SDL.inc"



.export SDL_Init

.proc SDL_Init
    ;;@brief Sdl initialization
    ;;@inputA value to init sdl with SDL_INIT_EVENTS
    ;;@```asm
    ;;@  lda  #SDL_INIT_EVENTS
    ;;@` jsr  SDL_Init
    ;;@` rts
    ;;@```
  lda    #$00
  ;sta    error

  rts
.endproc

; error:
;   .res SDL_ERROR_MESSAGE_LENGTH

