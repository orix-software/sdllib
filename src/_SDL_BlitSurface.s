.include "telestrat.inc"
.include "SDL.inc"

.export _SDL_BlitSurface
.import SDL_BlitSurface

.import popax

.proc _SDL_BlitSurface
    ;;@proto int SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect);
    ;;@brief Perform a fast blit from the source surface to the destination surface.
    ;;@details In this implementation, the srcrect parameter is currently ignored and the entire source surface is always blitted. For dstrect, only the x and y positions are used to determine the destination position; the width and height are taken from the source surface.
    ;;@param src Pointer to the source SDL_Surface structure.
    ;;@param srcrect Currently ignored. Intended for source rectangle definition (not implemented).
    ;;@param dst Pointer to the destination SDL_Surface structure.
    ;;@param dstrect Pointer to SDL_Rect structure. Only the x and y positions are used; width and height are ignored and taken from the source surface.
    ;;@returns Returns 0 on success, or -1 on failure.

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