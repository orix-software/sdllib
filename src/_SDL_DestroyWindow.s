.export _SDL_DestroyWindow
.import SDL_DestroyWindow

.proc _SDL_DestroyWindow
    ;;@proto void SDL_DestroyWindow(SDL_Window *window);
    ;;@brief Destroy a window and free its resources.
    ;;@details This function destroys the specified window and releases all resources associated with it.
    ;;@param window The window to destroy.
    ;;@note The actual implementation is in SDL_DestroyWindow.

    rts
.endproc
