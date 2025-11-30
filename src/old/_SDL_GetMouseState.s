.importzp ptr1
.importzp ptr2

.include "telestrat.inc"

.import popax

.export _SDL_GetMouseState

.import SDL_GetMouseState

.proc _SDL_GetMouseState
    sta     ptr1
    stx     ptr1 + 1

    jsr     popax
    sta     ptr2
    stx     ptr2 + 1

    jmp     SDL_GetMouseState

.endproc