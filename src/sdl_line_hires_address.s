.export sdl_line_hires_address_low
.export sdl_line_hires_address_high

sdl_line_hires_address_low:
    .repeat 200, i
        .byte <($A000 + i * 40)
    .endrepeat

sdl_line_hires_address_high:
    .repeat 200, i
        .byte >($A000 + i * 40)
    .endrepeat