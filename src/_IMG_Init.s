.export _IMG_Init
.import IMG_Init

.proc _IMG_Init
    jmp    IMG_Init ; IMG_Init is implemented in IMG_Init.s
.endproc

