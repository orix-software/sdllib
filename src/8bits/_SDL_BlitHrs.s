.export _SDL_BlitHrs
.include "telestrat.inc"

.proc _SDL_BlitHrs
  BRK_TELEMON(XOPEN)
  rts
.endproc


