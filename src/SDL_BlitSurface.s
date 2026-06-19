.include "include/SDL.inc"
.include "telestrat.inc"

.export SDL_BlitSurface

.proc SDL_BlitSurface
    ;int SDL_BlitSurface(SDL_Surface *src, void *srcrect, SDL_Surface *dst, void *dstrect);
    ;Perform a fast blit from the source surface to the destination surface.
    ;DSTRECT and SRCRECT are currently ignored, as they are not used in the current implementation of SDL_BlitSurface. The function will always blit the entire source surface to the destination surface.
   
    ; RES  : dst SDL_Surface*
    ; A & X contains src ptr surface

    dest_surface := RES ; 2 bytes for dst SDL_Surface*
    src_surface  := RESB ; 2 bytes for src SDL_Surface*
    blit_surface_address := TR0
    src_surface_pixels := TR2
    width := HRS1
    height := HRS1 + 1


    ; Get src and blitting parameters from the stack
    ; A & X : src SDL_Surface*

    sta     src_surface
    stx     src_surface + 1

    ; Get pixels ptr from dst surface

    ; Get 
    ldy     #SDL_Surface::pixels
    lda     (dest_surface),y ; get ptr low dest surface
    sta     blit_surface_address
    iny
    lda     (dest_surface),y
    sta     blit_surface_address + 1


    ldy     #SDL_Surface::pixels
    lda     (src_surface),y ; get ptr low dest surface
    sta     src_surface_pixels
    iny
    lda     (src_surface),y
    sta     src_surface_pixels + 1

    ldy     #SDL_Surface::w
    lda     (src_surface),y ; get ptr low dest surface
    sta     width

    ldy     #SDL_Surface::h
    lda     (src_surface),y ; get ptr low dest surface
    sta     height

    ldx     #$00
@restart:
    ldy     #$00
@L1:
    lda     (src_surface_pixels),y ; Get pixels from dst SDL_Surface*
    sta     (blit_surface_address),y
    iny
    cpy     width
    bne     @L1
    tya
    clc
    adc     src_surface_pixels
    bcc     @no_inc_surface_pixels
    inc     src_surface_pixels + 1
@no_inc_surface_pixels:
    sta     src_surface_pixels

    lda     blit_surface_address
    clc
    adc     #$28
    bcc     @no_inc_surface_address
    inc     blit_surface_address + 1
@no_inc_surface_address:
    sta     blit_surface_address

    inx
    cpx     height
    bne     @restart



    rts
.endproc
