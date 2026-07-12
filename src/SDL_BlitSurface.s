.include "include/SDL.inc"
.include "telestrat.inc"

.export SDL_BlitSurface

.import sdl_table_6
.import sdl_line_hires_address_low
.import sdl_line_hires_address_high


.proc SDL_BlitSurface
    ;;@proto int SDL_BlitSurface(SDL_Surface *src, void *srcrect, SDL_Surface *dst, void *dstrect);
    ;;@brief Performs a fast blit from the source surface to the destination surface.
    ;;@details This function copies pixel data from the source surface to the destination surface.
    ;;@details Currently, the srcrect parameter is ignored and the entire source surface is blitted.
    ;;@details srcrect Currently ignored. Intended for source rectangle definition (not implemented).
    ;;@inputA src Pointer to the source SDL_Surface structure (low)
    ;;@inputX src Pointer to the source SDL_Surface structure (high)
    ;;@paramMEM_RES src Pointer to the destination SDL_Surface structure (2 bytes)
    ;;@paramMEM_HRS2  dstrect Pointer to SDL_Rect structure representing the x and y position in the destination surface, or NULL for (0,0). Width and height are taken from the source surface.
    ;;@note This is a simplified implementation that always blits the entire source surface.

    dest_surface := RES ; 2 bytes for dst SDL_Surface*
    src_surface  := RESB ; 2 bytes for src SDL_Surface*
    blit_surface_address := TR0
    src_surface_pixels := TR2
    width  := HRS1
    height := HRS1 + 1
    dstrect := HRS2


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



    ldy     #SDL_Surface::w ; It's provides in pixel eg : 240 instead of 40, let's convert it
    lda     (src_surface),y ; get ptr low dest surface

    tax
    lda     sdl_table_6,x

    sta     width

    ldy     #SDL_Surface::h
    lda     (src_surface),y ; get ptr low dest surface
    sta     height


    ; Now compute position
    lda     dstrect
    bne     @compute_dest_position
    lda     dstrect + 1
    beq     @blit_now

@compute_dest_position:

    ldy     #SDL_Rect::rect_y
    lda     (dstrect),y ; get Y
    tax
    lda     sdl_line_hires_address_low,x
    sta     blit_surface_address
    lda     sdl_line_hires_address_high,x
    sta     blit_surface_address + 1


    ldy     #SDL_Rect::rect_x
    lda     (dstrect),y ; get X
    tax
    lda     sdl_table_6,x
    clc
    adc     blit_surface_address
    bcc     @no_inc
    inc     blit_surface_address + 1

@no_inc:
    sta     blit_surface_address





    ; blit_surface_address

@blit_now:
    ; Blit now
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
