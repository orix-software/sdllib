.export _IMG_GetError
.import IMG_GetError

.proc _IMG_GetError
    ;;@proto const char* IMG_GetError(void);
    ;;@brief Get the last error message from SDL_image.
    ;;@returns pointer to a string containing the last error message, or an empty string if there is no error.
    jmp    IMG_GetError ; SDL_GetError is implemented in SDL_GetError.s
.endproc

