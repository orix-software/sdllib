.export IMG_Load
.include "include/SDL.inc"
.include "telestrat.inc"
.include "fcntl.inc"
.include "stdio.inc"
.include "SDK_file.mac"


.import load_img_error

.import sdl_new_surface
.import sdl_surface_update_with_size_by_id
.import sdl_get_surface_data_ptr_by_id


.proc IMG_Load
    ;;@brief Load an image from a file and return an SDL_Surface pointer. We only manage files smaller than 64KB. It means that a file larger than 64KB will be loaded but only the first 64KB will be used.
    ;;@inputA ptr to a null-terminated string containing the file path of the image to load (low byte)
    ;;@inputX ptr to a null-terminated string containing the file path of the image to load. (high byte)
    ;;@returnsA pointer to an SDL_Surface containing the loaded image, or NULL on failure.
    ;;@returnsY pointer to an SDL_Surface containing the loaded image, or NULL on failure.
    ;;@```asm
    ;;@  lda  #<filename
    ;;@  ldx  #>filename
    ;;@` jsr  IMG_Load
    ;;@` rts
    ;;@```

    ;fopen ,O_RDONLY,,fp ; open the filename located in ptr 'basic11_ptr2', in readonly and store the fp in fp address

    ; Checking if the file is a .hir

    fp       := TR2 ; and TR3

    filesize := TR3 ; and TR4
    filename := RES ; 2 bytes

    sdl_surface_struct := HRS4 ; 2 bytes
    sdl_current_surface_id := HRS2 ; 1 bytes
    sdl_tmp := HRS2 + 1



    sta     filename
    stx     filename + 1

    ; Check if we load .hrs
    ldy     #$00
@check_end:
    lda     (filename),y
    beq     @L1
    iny
    bne     @check_end

@L1:
    ; Check .hir
    dey
    lda     (filename),y
    beq     @EOS
    cmp     #'r'
    bne     @L1
    dey
    lda     (filename),y
    cmp     #'i'
    bne     @EOS
    dey
    lda     (filename),y
    cmp     #'h'
    bne     @EOS
    dey
    lda     (filename),y
    cmp     #'.'
    ; file is a .hir file, we can load it
    beq     @load_file
    ; No branch we did not found .hir

@EOS:
    ; not a .hir file, we return an error
    lda     #IMG_ERROR_UNSUPPORTED_FORMAT
    sta     load_img_error
    lda     #$00
    tax
    rts

@load_file:
    fopen (filename), O_RDONLY,,fp  ; RES, A X Y, TR7, XOPEN_SAVE XOPEN_FLAGS, XOPEN_RES_SAVE, XOPEN_SAVEA
    cmp     #$FF
    bne     load
    cpx     #$FF
    bne     load
    ; Load file X and A contains $FF if error

    lda     #IMG_ERROR_CANNOT_OPEN_FILE
    sta     load_img_error

    ; Return null
    lda     #$00
    tax

    rts

load:

; [IN] X whence
; [IN] AY position 0 to 15
; [IN] RESB position 0 to 31
; [IN] RES fd

    jsr     sdl_new_surface ; Get ptr
    ; A and Y contains ptr struct
    ; X contains the id of the surface

    sta     sdl_surface_struct ; $51 $52 val = $5350
    sty     sdl_surface_struct + 1
    stx     sdl_current_surface_id


    jsr     sdl_get_surface_data_ptr_by_id

@no_carry2:
    ; FIXME !!! compute length of the file or else it should generate an overflow

    sta    PTR_READ_DEST     ; $537C
    sty    PTR_READ_DEST + 1

    ; Get length of the file in A and X

    lda    #$FF
    ldy    #$FF
    ldx    fp

    BRK_TELEMON XFREAD ; RES, PTR_READ_DEST, TR0

    ; A and X contains length
    stx     sdl_tmp
    ldy     sdl_tmp
    ; Update size

    ldx     sdl_current_surface_id ; Get surface id
    jsr     sdl_surface_update_with_size_by_id

    fclose(fp)

    ; Now update ptr

    ldx     sdl_current_surface_id
    jsr     sdl_get_surface_data_ptr_by_id
    ; A and Y contains ptr

    sty     sdl_tmp

    ; Update pixels ptr in surface struct
    ldy     #SDL_Surface::pixels
    sta     (sdl_surface_struct),y
    iny
    lda     sdl_tmp
    sta     (sdl_surface_struct),y

    ; Return surface ptr
    lda     sdl_surface_struct
    ldx     sdl_surface_struct + 1


    rts


.endproc
