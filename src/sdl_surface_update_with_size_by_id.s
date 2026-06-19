.export sdl_surface_update_with_size_by_id

.include "telestrat.inc"

.import sdl_data_ptr_low
.import sdl_data_ptr_high

.proc  sdl_surface_update_with_size_by_id
    ; modify RES
    ; X the id
    ; A and Y the length
    sty     RES
    pha
    lda     sdl_data_ptr_high,x
    clc
    adc     RES
    inx
    sta     sdl_data_ptr_high,x
    dex
    pla

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