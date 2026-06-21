.export IMG_Init

; IMG_Init - Initialize SDL_image library
; Loads dynamic libraries that SDL_image needs and prepares them for use.
; This must be the first function you call in SDL_image, and if it fails
; you should not continue with the library.
;
; Example usage:
;   IMG_Init(IMG_INIT_HRS);

.proc IMG_Init
    ;;@brief Initialize SDL_image library
    ;;@input A : Initialization flags (bitmask of IMG_INIT_* constants)
    ;;   IMG_INIT_JPG   = 1   - Initialize JPEG support not managed
    ;;   IMG_INIT_PNG   = 2   - Initialize PNG support not managed
    ;;   IMG_INIT_TIF   = 4   - Initialize TIFF support not managed
    ;;   IMG_INIT_WEBP  = 8   - Initialize WebP support  not managed
    ;;   IMG_INIT_JXL   = 16  - Initialize JPEG XL support  not managed
    ;;   IMG_INIT_AVIF  = 32  - Initialize AVIF support  not managed
    ;;   IMG_INIT_HRS   = 64  - Initialize HRS (Oric-specific) support
    ;;@modify A, X, Y
    rts
.endproc

