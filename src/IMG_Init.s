.export IMG_Init


;This function loads dynamic libraries that SDL_image needs, and prepares them for use. This must be the first function you call in SDL_image, and if it fails you should not continue with the library.

  ;  IMG_Init(IMG_INIT_HIR);

.proc IMG_Init
    rts
.endproc

