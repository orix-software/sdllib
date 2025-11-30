; SDL_GetRelativeMouseState(&x, &y);
.include "telestrat.inc"

.export _SDL_GetRelativeMouseState

.import SDL_GetRelativeMouseState
.import popax

.proc _SDL_GetRelativeMouseState
    ;;@proto unsigned char SDL_GetRelativeMouseState(unsigned char *x, unsigned char *y)
    ;;@brief Get relative mouse state
    ;;@inputPARAM_x : ptr x relative movement
    ;;@inputPARAM_y : ptr y relative movement
    sta     RESB
    stx     RESB + 1

    jsr     popax
    sta     RES
    stx     RES + 1

    jsr     SDL_GetRelativeMouseState
    ldx     #$00
    rts
.endproc
