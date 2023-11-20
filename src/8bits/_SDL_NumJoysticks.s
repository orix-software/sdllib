.export _SDL_NumJoysticks

;unsigned char SDL_NumJoysticks(void);
.proc _SDL_NumJoysticks
  lda     #$02
  rts
.endproc
