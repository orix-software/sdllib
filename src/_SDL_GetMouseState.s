.import ptr1
.import ptr2

.include "telestrat.inc"

.import popax

.proc _SDL_GetMouseState
    sta     ptr1
    stx     ptr1+1
    jsr     popax
    sta     ptr2
    stx     ptr2+1

;100 OUT CMD,&15:OUT DAT,&7 :' Initialize device in usb HOST mode, reset USB bus
;110 OUT CMD,&15:OUT DAT,&6 :' Initialize device in usb HOST mode, produce SOF
;120 OUT CMD,&B:OUT DAT,&17:OUT DAT,&D8 :' Set USB device speed?
;130 OUT CMD,&45:OUT DAT,&1:v =INP(dat) :' Set device address
;140 GOSUB 510

    lda     #$15
    sta     CH376_COMMAND

    lda     #$07
    sta     CH376_DATA

    lda #$15
    sta CH376_COMMAND

    lda     #$06
    sta     CH376_DATA

    lda     #$0B
    sta     CH376_COMMAND

    lda     #$17
    sta     CH376_DATA

    lda     #$D8
    sta     CH376_DATA

    lda     #$45
    sta     CH376_COMMAND

    lda     #$01
    sta     CH376_DATA

    lda     CH376_DATA
    jsr     wait_response





;150 OUT CMD,&13:OUT DAT,&1 :' Set CH376 address
;160 :' We can now select configuration 1. In a mouse, this is (usually?) the only available configuration.
;170 OUT CMD,&49:OUT DAT,&1 :' Select configuration 1
;180 GOSUB 510
   rts

wait_response:
@L1:
    lda     CH376_COMMAND
    and     #%10000000
    cmp     #128
    bne     @L1

@out:
    lda     #$22
    sta     CH376_COMMAND
    lda     CH376_DATA
    ; status
    rts
;500 :' Wait for command to complete and read error code
;510 LOCATE 1,24:sta = INP(CMD):PRINT"Status: &";HEX$(sta,2);:IF sta > 127 THEN GOTO 510
;520 :' GET_STATUS
;530 OUT CMD,&22
;540 STATUS=INP(DAT):LOCATE 1,1:PRINT"Interrupt status (&14,&1D=OK) = ";HEX$(STATUS,2);
;550 RETURN

.endproc