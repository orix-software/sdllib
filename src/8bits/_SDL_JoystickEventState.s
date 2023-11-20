.export _SDL_JoystickEventState
;int SDL_JoystickEventState(int state)
;int SDL_JoystickEventState(int state)
;state : si oui (SDL_ENABLE) ou non (SDL_DISABLE) vous voulez récupérer les actions de l'utilisateur à travers le système d'événements de la SDL. Il est possible d'utiliser la valeur spéciale SDL_QUERY pour connaître l'état actuel.
;retourne l'état actuellement défini si state est SDL_QUERY ou state dans les autres cas.

.proc _SDL_JoystickEventState

  rts

.endproc

