.include "SDL.inc"
.export _SDL_SetError

.import error
.importzp ptr1

.proc _SDL_SetError
  ; A & X
  sta    ptr1
  stx    ptr1+1

  ldy   #$00
loop:  
  lda	(ptr1),y
  beq   out
  sta   error,y
  iny
  cpy   #SDL_ERROR_MESSAGE_LENGTH 
  bne   loop
  lda   #$00
out:
  sta   error,y

  rts
.endproc
