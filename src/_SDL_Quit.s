.export _SDL_Quit

.import SDL_Quit

.proc _SDL_Quit
    ;;@proto void SDL_Quit(void);
    ;;@brief Shutdown the SDL library.
    ;;@details This function cleans up all initialized SDL subsystems and deallocates any resources allocated by them. It should be called before exiting the program.
    ;;@note The actual implementation is in SDL_Quit. This is a wrapper function.

    jmp    SDL_Quit
.endproc
