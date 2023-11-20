.export _SDL_JoystickName 

.proc _SDL_JoystickName
  lda #<str_joy
  ldx #>str_joy
  rts
str_joy:
  .asciiz "Telestrat joystick"
.endproc
