.export _SDL_Delay

.import SDL_Delay

.proc _SDL_Delay
    ;;@proto void SDL_Delay(unsigned int delay);
    ;;@brief Delay execution for a specified number of milliseconds.
    ;;@details This function pauses the program execution for the given number of milliseconds.
    ;;@param delay The number of milliseconds to delay.
    ;;@note The actual implementation is in SDL_Delay.

    jmp     SDL_Delay
.endproc
