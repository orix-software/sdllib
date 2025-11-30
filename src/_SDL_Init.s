.include "SDL.inc"

.export _SDL_Init

.import SDL_Init

.proc _SDL_Init
  ;;@proto unsigned char SDL_Init(char value)
  ;;@brief Init sdl
  ;;@inputPARAM_value : value to init sdl with SDL_INIT_EVENTS
  jmp   SDL_Init

.endproc


