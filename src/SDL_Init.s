.include "include/SDL.inc"

.export sdl_error
.export sdl_init_state
.export load_img_error
.export sdl_is_running_under_xorix
.export sdl_window_main

.export sdl_all_surface_struct_ptr_low
.export sdl_all_surface_struct_ptr_high
.export sdl_data_ptr_low
.export sdl_data_ptr_high
.export sdl_number_of_surface



.export SDL_Init

.proc SDL_Init
    ;;@brief Sdl initialization
    ;;@inputA value to init sdl with SDL_INIT_EVENTS
    ;;@returnsA error code in sdl_error or A $00 if no error, else SDL_CAN_NOT_BE_STORE_INTO_READ_ONLY_STORAGE if lib is stored into read-only storage
    ;;@```asm
    ;;@  lda  #SDL_INIT_EVENTS
    ;;@` jsr  SDL_Init
    ;;@` rts
    ;;@```

    ; FIXME in the future : Check if it runs on XORIX
    lda     #SDL_IS_NOT_RUNNING_UNDER_XORIX
    sta     sdl_is_running_under_xorix


    lda    #$FF
    sta    sdl_error
    lda    sdl_error
    cmp    #$FF
    bne    no_error
    lda    #SDL_CAN_NOT_BE_STORE_INTO_READ_ONLY_STORAGE
    rts

no_error:
    lda    #$00
    sta    sdl_error

    rts
.endproc

sdl_window_main:
    .tag SDL_Window

; Tag only One SDL_WINDOW structure, the content will be defined later when we will implement SDL_CreateWindow
sdl_is_running_under_xorix:
    .byt 0

sdl_error:
    .byt 0

sdl_init_state:
    .byt 0

load_img_error:
    .byt 0

sdl_all_surface_struct_ptr_low:
    .res SDL_MAX_SURFACE

sdl_all_surface_struct_ptr_high:
    .res SDL_MAX_SURFACE


; In order to avoid malloc
sdl_data_ptr_low:
    .res SDL_MAX_SURFACE

sdl_data_ptr_high:
    .res SDL_MAX_SURFACE

sdl_number_of_surface:
    .byt 0

; error:
;   .res SDL_ERROR_MESSAGE_LENGTH

