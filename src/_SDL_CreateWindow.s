.export _SDL_CreateWindow
.import SDL_CreateWindow

.include "include/SDL.inc"
.include "telestrat.inc"

.import popa, popax

.proc _SDL_CreateWindow
    ; SDL_Window* SDL_CreateWindow( const char *title, unsigned char x, unsigned char y, unsigned char w, unsigned char h, unsigned char flags);

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

