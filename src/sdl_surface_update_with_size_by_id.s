.export sdl_surface_update_with_size_by_id

.include "telestrat.inc"

.import sdl_data_ptr_low
.import sdl_data_ptr_high

.proc  sdl_surface_update_with_size_by_id
    ; modify RES
    ; X the id of the surface
    ; A and Y the length
    ; Returns in  A = 0 Y = 0 if it fails

    cpx     #$00 ; Is it the first surface ? 
    bne     @realloc ; no we need to realloc


    ; A and Y the length
    BRK_TELEMON XMALLOC
    cmp     #$00
    bne     @not_oom
    cpy     #$00
    bne     @not_oom
    ; OOM
    rts

@not_oom:
    sta     sdl_data_ptr_low
    sty     sdl_data_ptr_high

    rts

@realloc:
    rts

    lda     sdl_data_ptr_high,x
    clc
    adc     RES
    inx
    sta     sdl_data_ptr_high,x
    dex


    clc
    adc     sdl_data_ptr_low,x
    bcc     @no_inc
    inx
    inc     sdl_data_ptr_high,x
    dex
@no_inc:
    inx
    sta     sdl_data_ptr_low,x

    ;sty     sdl_all_surface_struct_ptr_high,x

    rts
.endproc