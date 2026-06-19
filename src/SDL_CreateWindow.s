.export SDL_CreateWindow

.include "include/SDL.inc"
.include "telestrat.inc"

.import sdl_is_running_under_xorix
.import sdl_window_main

.proc SDL_CreateWindow
    lda     sdl_is_running_under_xorix
    beq     under_xorix
    ; Not under Xorix
    ; There is only one window, so we can ignore the parameters and return a pointer to the SDL_WINDOW structure

    ; Set offset of the surface
    lda     #$00
    sta     sdl_window_main + SDL_Window::surface + SDL_Surface::pixels
    lda     #$A0
    sta     sdl_window_main + SDL_Window::surface + SDL_Surface::pixels + 1

    ; start  XHIRES
    BRK_TELEMON XHIRES

    rts

under_xorix:
    rts
.endproc

