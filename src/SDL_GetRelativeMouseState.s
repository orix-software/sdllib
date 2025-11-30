.include "telestrat.inc"
.include "ch376.inc"

.export SDL_GetRelativeMouseState

.import ch376_wait_response
.import ch376_set_usb_speed

.proc SDL_GetRelativeMouseState
    ;;@brief Get mouse relative state
    ;;@inputMEM_RES ptr X position (unsigned byte)
    ;;@inputMEM_RESB ptr X position (unsigned byte)
    ;;@```asm
    ;;@` rts
    ;;@```



;100 OUT CMD,&15:OUT DAT,&7 :' Initialize device in usb HOST mode, reset USB bus
    lda     #$15
    sta     CH376_COMMAND

    lda     #$07
    sta     CH376_DATA

;110 OUT CMD,&15:OUT DAT,&6 :' Initialize device in usb HOST mode, produce SOF

    lda     #$15
    sta     CH376_COMMAND

    lda     #$06
    sta     CH376_DATA
;120 OUT CMD,&B:OUT DAT,&17:OUT DAT,&D8 :' Set USB device speed?


    lda     #$02
    jsr     ch376_set_usb_speed

    lda     #$0B ; ?CH376_CMD_SET_REGISTER ?
    sta     CH376_COMMAND

    lda     #$17
    sta     CH376_DATA

    lda     #$D8
    sta     CH376_DATA

;130 OUT CMD,&45:OUT DAT,&1:v =INP(dat) :' Set device address

    lda     #$45
    sta     CH376_COMMAND

    lda     #$01
    sta     CH376_DATA

  ;  lda     CH376_DATA
; ;140 GOSUB 510
    jsr     ch376_wait_response

;150 OUT CMD,&13:OUT DAT,&1 :' Set CH376 address

    lda     #$13 ;CH376_SET_USB_ADDR all data will be sent to this address
    sta     CH376_COMMAND

    lda     #$01
    sta     CH376_DATA


;160 :' We can now select configuration 1. In a mouse, this is (usually?) the only available configuration.
;170 OUT CMD,&49:OUT DAT,&1 :' Select configuration 1
    lda     #$49 ; ch376_set_config
    sta     CH376_COMMAND

    lda     #$01
    sta     CH376_DATA

;180 GOSUB 510

    jsr     ch376_wait_response

@L1:
; 220 TOKEN = &0 :' TOKEN selects DATA0 or DATA1 packet. They must alternate!
; 230 OUT CMD,&4E
; 240 :' First parameter is the "sync token", bit 7 means "host endpoint synchronous trigger" (whatever...)


    lda     #$4E ; CH376_ISSUE_TKN_X
    sta     CH376_COMMAND
; 250 OUT DAT,TOKEN

    lda     token
    sta     CH376_DATA

; 260 :' Second byte is the operation descriptor.
; 270 :' High 4 bits define the endpoint
; 280 :' (here we use endpoint 1, which is the interrpt endpoint of the mouse)
; 290 :' low 4 bits define the operation (9 is a READ).
; 300 OUT DAT,&19 :' Read from endpoint 0
; 310 :' The mouse only sends reports when something actually changes (move or button state). If you want periodic reports, the HID "set idle" command can be used to configure it so.

    lda     #$19
    sta     CH376_DATA


; 320 TOKEN = TOKEN XOR &80 :'Alternate DATA0 - DATA1 packets
    lda     token
    eor     #$80
    sta     token

; 330 GOSUB 510

    jsr     ch376_wait_response

; 340 OUT CMD,&27 :' Get data from command RD_USB_DATA0
; 350 :' We use command &27 as usual to get the data
; 360 :' The first byte is the length of the report.
;CH376_CMD_RD_USB_DATA0  ch376->usb_mode == CH376_ARG_SET_USB_MODE_USB_HOST USB_MASS_STORAGE_CLASS

    lda     #$27
    sta     CH376_COMMAND

; 370 Ln = INP(dat)


    lda     CH376_DATA

; 380 IF Ln = 0 THEN GOTO 230 :' No data, try again?


    beq     @out

; 390 :' First byte of report has button states (lowest bit is button 1)
; 400 BTN=INP(dat)
; 410 xd=INP(dat):yd=INP(dat):w=INP(dat) :' Next are X-delta, Y-delta, and wheel-delta
; 420 LOCATE 1,3:PRINT"dX: &";HEX$(xd,2);"   dY: &";HEX$(yd,2);"   Wheel: &";HEX$(w,2);"   Buttons: &";HEX$(BTN,2);
; 430 :' Now perform some fixes for BASIC compatibility
; 440 IF xd > 127 THEN xd = xd - 256 :' Convert to signed
; 450 yd = yd XOR &FF:IF yd > 127 THEN yd = yd - 256
; 460 IF w > 127 THEN w = w - 256
; 470 :' And just plot a pixel at the current mouse position
; 480 x=x+xd:y=y+yd:DRAW x,y :' Move and draw cursor
; 490 GOTO 230



    lda     CH376_DATA ; get bouton
    lda     CH376_DATA ; get X

    ldy     #$00
    sta     (RES),y
    tax
    lda     CH376_DATA ; get Y
    ldy     #$00
    sta     (RESB),y
    pha
    lda     CH376_DATA ; get wheel
    pla
    rts

@out:
    ldx     #$00
    rts


token:
    .byt $00


;500 :' Wait for command to complete and read error code
;510 LOCATE 1,24:sta = INP(CMD):PRINT"Status: &";HEX$(sta,2);:IF sta > 127 THEN GOTO 510
;520 :' GET_STATUS
;530 OUT CMD,&22
;540 STATUS=INP(DAT):LOCATE 1,1:PRINT"Interrupt status (&14,&1D=OK) = ";HEX$(STATUS,2);
;550 RETURN

  rts
.endproc
