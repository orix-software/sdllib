.include "SDL.inc"

.export _SDL_Init

.import SDL_Init

.proc _SDL_Init
    ;;@proto unsigned char SDL_Init(unsigned char flags);
    ;;@brief Initialize the SDL library.
    ;;@details This function initializes the SDL library with the specified subsystems. In this implementation, it supports SDL_INIT_VIDEO and other standard SDL initialization flags.
    ;;@param flags Initialization flags (e.g., SDL_INIT_VIDEO).
    ;;@returns Returns 0 on success, or a non-zero error code on failure.
    ;;@note The actual implementation is in SDL_Init.

  jmp   SDL_Init

.endproc


