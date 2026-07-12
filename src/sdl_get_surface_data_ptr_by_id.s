.export sdl_get_surface_data_ptr_by_id

.import sdl_data_ptr_low
.import sdl_data_ptr_high

.proc sdl_get_surface_data_ptr_by_id

    lda sdl_data_ptr_low,x
    ldy sdl_data_ptr_high,x

    rts
.endproc
