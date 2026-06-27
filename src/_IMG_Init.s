.export _IMG_Init
.import IMG_Init

.proc _IMG_Init
    ;;@proto void IMG_Init(int flags);
    ;;@brief init img
    ;;@details This function is a wrapper that directly jumps to the IMG_Init implementation.
    ;;@param flags Initialization flags for SDL_image subsystems (does not manage only IMG_INIT_HRS)
    jmp    IMG_Init ; IMG_Init is implemented in IMG_Init.s
.endproc


