.export _SDL_CreateWindow
.import SDL_CreateWindow

.include "include/SDL.inc"

.import popa, popax

.proc _SDL_CreateWindow
    ; SDL_Window* SDL_CreateWindow( const char *title, unsigned char x, unsigned char y, unsigned char w, unsigned char h, unsigned char flags);
    ; Drop flags
    jsr    popa ; h
    jsr    popa ; w
    jsr    popa ; y
    jsr    popa ; x
    jsr    popax ; title
    jmp    SDL_CreateWindow ; SDL_CreateWindow is implemented in SDL_CreateWindow.s

.endproc

