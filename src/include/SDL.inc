SDL_QUIT = 27

SDL_ERROR_MESSAGE_LENGTH = 100


.define SDL_WINDOWPOS_CENTERED $2F

.define SDL_CAN_NOT_BE_STORE_INTO_READ_ONLY_STORAGE $FE

.define SDL_MAX_SURFACE 1 ; Can not be greater than 127 !

.define SDL_SIZE_DATA_SURFACE 500

; Since 2026.3
.struct SDL_Surface
   pixels .word ; pixels
   w .byte ; w
   h .byte; h
.endstruct

.struct SDL_Window
   id .byte ; id
   w .byte ; w
   h .byte; h
   surface .tag SDL_Surface
.endstruct

; SDL_Rect structure for blitting operations
.struct SDL_Rect
   rect_x .byte ; x position
   rect_y .byte ; y position
   rect_w .byte ; width
   rect_h .byte ; height
.endstruct

IMG_ERROR_OK = 0
IMG_ERROR_UNSUPPORTED_FORMAT = 1
IMG_ERROR_CANNOT_OPEN_FILE = 2
IMG_ERROR_NOT_INITIALIZED = 3
IMG_ERROR_OUT_OF_MEMORY = 4
IMG_ERROR_ALLOCATION_FAILED = 5


SDL_INIT_VIDEO = $20

IMG_INIT_JPG = 1
IMG_INIT_PNG = 2
IMG_INIT_TIF = 4
IMG_INIT_WEBP = 8
IMG_INIT_JXL = 16
IMG_INIT_AVIF = 32
IMG_INIT_HRS = 64

SDL_IS_RUNNING_UNDER_XORIX = 0
SDL_IS_NOT_RUNNING_UNDER_XORIX = 1
