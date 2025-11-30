.include "SDL.inc"

.export error

.export _SDL_Init

.proc _SDL_Init
  lda    #$00
  sta    error

  rts
.endproc

error:
  .res SDL_ERROR_MESSAGE_LENGTH

