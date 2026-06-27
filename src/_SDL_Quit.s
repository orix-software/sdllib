.export _SDL_Quit

.import SDL_Quit

.proc _SDL_Quit
    ;;@proto void SDL_Quit(void);
    ;;@brief Shutdown the SDL library.
    ;;@details This function cleans up all initialized SDL subsystems and deallocates any resources allocated by them. It should be called before exiting the program.

    jmp    SDL_Quit
.endproc
