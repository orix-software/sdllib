.export _SDL_UpdateWindowSurface

.proc _SDL_UpdateWindowSurface
    ;;@proto void SDL_UpdateWindowSurface(SDL_Window *window);
    ;;@brief Update the display of the specified window.
    ;;@details This function does nothing in this implementation. It exists only for compatibility with the official SDL API syntax. The actual screen update is handled differently in this SDL library implementation.
    ;;@param window The window whose surface to update (not used in this implementation).

    rts
.endproc
