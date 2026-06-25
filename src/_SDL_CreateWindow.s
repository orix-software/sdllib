.export _SDL_CreateWindow
.import SDL_CreateWindow

.include "include/SDL.inc"
.include "telestrat.inc"

.import popa, popax

.proc _SDL_CreateWindow
    ;;@proto SDL_Window* SDL_CreateWindow(const char *title, unsigned char x, unsigned char y, unsigned char w, unsigned char h, unsigned char flags);
    ;;@brief Create a window with the specified title and flags.
    ;;@details In this implementation, the x, y, w, and h parameters are not taken into account. Only the title and flags are used.
    ;;@param title The title of the window.
    ;;@param x The x position - NOT USED in this implementation.
    ;;@param y The y position - NOT USED in this implementation.
    ;;@param w The width - NOT USED in this implementation.
    ;;@param h The height - NOT USED in this implementation.
    ;;@param flags Window creation flags.
    ;;@returns A pointer to the created SDL_Window, or NULL on failure.
    ;;@note The actual implementation is in SDL_CreateWindow.s. Position and size parameters (x, y, w, h) are ignored.

    ; Drop flags
    jsr    popa ; h
    sta    RESB
    jsr    popa ; w
    sta    RESB + 1
    jsr    popa ; y
    jsr    popa ; x
    jsr    popax ; title
    jmp    SDL_CreateWindow ; SDL_CreateWindow is implemented in SDL_CreateWindow.s

.endproc

