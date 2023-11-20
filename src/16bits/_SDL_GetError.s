
.export _SDL_GetError
.import error

.proc _SDL_GetError
  lda  #<error
  ldx  #>error
  rts
.endproc 

