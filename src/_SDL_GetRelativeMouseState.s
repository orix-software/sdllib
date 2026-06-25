; SDL_GetRelativeMouseState(&x, &y);
.include "telestrat.inc"

.export _SDL_GetRelativeMouseState

.import SDL_GetRelativeMouseState
.import popax

.proc _SDL_GetRelativeMouseState
    ;;@proto unsigned char SDL_GetRelativeMouseState(unsigned char *x, unsigned char *y);
    ;;@brief Get the relative mouse state (movement since last call).
    ;;@details This function retrieves the relative mouse movement (in pixels) since the last call. The values are stored in the provided x and y pointers.
    ;;@param x Pointer to store the relative x movement.
    ;;@param y Pointer to store the relative y movement.
    ;;@returns Returns 0 (always) in this implementation.
    ;;@note The actual implementation is in SDL_GetRelativeMouseState. This is a wrapper function.
    sta     RESB
    stx     RESB + 1

    jsr     popax
    sta     RES
    stx     RES + 1

    jsr     SDL_GetRelativeMouseState
    ldx     #$00
    rts
.endproc
