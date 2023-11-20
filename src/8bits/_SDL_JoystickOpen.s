.export _SDL_JoystickOpen
; SDL_Joystick* SDL_JoystickOpen(int index)
.proc _SDL_JoystickOpen

  rts

joystick1:
  .res  1
.endproc

; int SDL_JoystickEventState(int state)
; state : si oui (SDL_ENABLE) ou non (SDL_DISABLE) vous voulez récupérer les actions de l'utilisateur à travers le système d'événements de la SDL. Il est possible d'utiliser la valeur spéciale SDL_QUERY pour connaître l'état actuel.
; retourne l'état actuellement défini si state est SDL_QUERY ou state dans les autres cas.