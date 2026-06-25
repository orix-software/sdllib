.include "SDL.inc"

.export IMG_GetError

.import load_img_error

.proc IMG_GetError
    ;;@proto const char* IMG_GetError;
    ;;@brief Get the last error message from SDL_image.
    ;;@returnsA pointer to a string containing the last error message, or an empty string if there is no error.

    ldy    load_img_error
    ldx    tab_img_error_messages_high,y
    lda    tab_img_error_messages_low,y

    rts
.endproc

tab_img_error_messages_low:
    .byte <ok_string
    .byte <unsupported_image_format_string
    .byte <unable_to_open_file_string
    .byte <not_initialized_string
    .byte <out_of_memory_string
    .byte <allocation_failed_string

tab_img_error_messages_high:
    .byte >ok_string
    .byte >unsupported_image_format_string
    .byte >unable_to_open_file_string
    .byte >not_initialized_string
    .byte >out_of_memory_string
    .byte >allocation_failed_string

ok_string:
    .byte "No error"

unsupported_image_format_string:
    .byte "Unsupported image format",0

unable_to_open_file_string:
    .byte "Couldn't open file",0

not_initialized_string:
    .byte "SDL_image not initialized",0  ;     IMG_Init() n'a pas été appelé avant d'utiliser IMG_Load.

out_of_memory_string:
    .byte "Out of memory",0

allocation_failed_string:
     .byte "Failed to allocate memory for image",0

;.byte "PNG support not available"
;.byte "JPG support not available"
;.byte "Error reading PNG file"
;.byte "Error reading JPEG file"
;.byte "Unsupported color depth"
