.export _SDL_GetWindowSurface
.import SDL_GetWindowSurface

.proc _SDL_GetWindowSurface
    ;;@proto SDL_Surface* SDL_GetWindowSurface(SDL_Window *window);
    ;;@brief Get the surface associated with a window.
    ;;@details This function returns the surface associated with the specified window. The surface can be used for drawing operations.
    ;;@param window The window whose surface to retrieve.
    ;;@returns A pointer to the SDL_Surface associated with the window, or NULL on failure.
    ;;@note The actual implementation is in SDL_GetWindowSurface.s.

    jmp   SDL_GetWindowSurface ; SDL_GetWindowSurface is implemented in SDL_GetWindowSurface.s
.endproc
