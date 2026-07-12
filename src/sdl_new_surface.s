.export sdl_new_surface

.include "include/SDL.inc"

.include "telestrat.inc"

.include "SDK_memory.mac"

.import sdl_data_ptr_low
.import sdl_data_ptr_high
.import sdl_number_of_surface

.import sdl_all_surface_struct_ptr_low
.import sdl_all_surface_struct_ptr_high

XREALLOC = $02
    ;;XREALLOC
    ;;inputA contains the new size to allocate low (1 byte)
    ;;inputY contains the new size to allocate high (1 byte)
    ;;inputX reserved for future use, should be set to 0 by caller
    ;;inputMEM_RES contains the pointer to reallocate  (2 bytes)

.proc sdl_new_surface
    ; returns in A & Y the ptr of struct surface
    ; X contains the id of the surface
    lda     sdl_number_of_surface
    beq     @allocate
    cmp     #SDL_MAX_SURFACE

; $02

@allocate_next_surface:
    ldx     sdl_number_of_surface ; equal to 1
    cpx     #SDL_MAX_SURFACE
    beq     @oom

    ; Get previous surface ptr offset to store in the current offset
    dex
    lda     sdl_all_surface_struct_ptr_high,x
    inx
    sta     sdl_all_surface_struct_ptr_high,x

    dex
    lda     sdl_all_surface_struct_ptr_low,x
    inx
    sta     sdl_all_surface_struct_ptr_low,x
    ; Add the size of the SDL_Surface

    clc
    adc     #.sizeof(SDL_Surface)
    sta     sdl_all_surface_struct_ptr_low,x
    bcc     @no_inc

    inc     sdl_all_surface_struct_ptr_high,x

@no_inc:
    ; inc new surface
    inc     sdl_number_of_surface



    lda     sdl_all_surface_struct_ptr_low,x
    ldy     sdl_all_surface_struct_ptr_high,x
    ; X contains the id of the surface

    rts

@allocate:
    malloc #(.sizeof(SDL_Surface) * SDL_MAX_SURFACE)

    cmp    #$00
    bne    continue
    cpy    #$00
    bne    continue

@oom:
    lda    #$00 ; Not redundant it's used for @allocate_next_surface
    tay
    ; A & Y contains 0 if error
    rts

continue:
    inc     sdl_number_of_surface
    ; Store first offset of surface
    ; Ptr for sdl surface


    sta     sdl_all_surface_struct_ptr_low
    sty     sdl_all_surface_struct_ptr_high

;     ; Compute offset for data
;     sty     sdl_data_ptr_high
;     clc
;     adc     #(.sizeof(SDL_Surface) * SDL_MAX_SURFACE)
;     bcc     @no_inc_data_ptr
;     inc     sdl_data_ptr_high

; @no_inc_data_ptr:
;     sta     sdl_data_ptr_low

    ldx     #$00 ; First surface
    lda     sdl_all_surface_struct_ptr_low
    ldy     sdl_all_surface_struct_ptr_high
    ; A  and Y contains ptr of the struct
    ; X contain the id of the surface
    rts
.endproc

