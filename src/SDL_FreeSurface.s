
.export SDL_FreeSurface
.include "telestrat.inc"
.include "SDK_memory.mac"

.proc SDL_FreeSurface
    stx     RES
    ; A contains low
    ldy     RES + 1
    BRK_TELEMON XFREE
    rts
.endproc