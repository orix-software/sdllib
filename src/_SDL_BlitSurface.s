.include "telestrat.inc"
.include "SDL.inc"

.export _SDL_BlitSurface
.import SDL_BlitSurface

.import popax

.proc _SDL_BlitSurface
    ;;@proto int SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect);
    ;;@brief Perform a fast blit from the source surface to the destination surface.

    ; DSTRECT and SRCRECT are currently ignored, as they are not used in the current implementation of SDL_BlitSurface. The function will always blit the entire source surface to the destination surface.

    ; Drop a & X
    sta     HRS2
    stx     HRS2 + 1


    jsr     popax ; dst
    ; store  dst SDL_Surface* in RES

    sta     RES
    stx     RES + 1

    jsr     popax ; srcrect : drop

    jsr     popax ; src SDL_Surface* in A and X

    ; A & X contains src SDL_Surface*



    jmp     SDL_BlitSurface ; SDL_BlitSurface is implemented in SDL_BlitSurface.s

.endproc