.export SDL_Delay

.include "telestrat.inc"

; CH376 Hardware registers (from telestrat.inc)
; The CH376 is connected to ports $0340 (DATA) and $0341 (COMMAND) on Oric


; CH376 Commands
CH376_GET_STATUS = $22

.proc SDL_Delay
    ;;@brief Delay in milliseconds
    ;;@input A : Delay in milliseconds (0-255)
    ;;@modify A, X, Y
    ;;@returns A : 0
    ;;@```asm
    ;;@` lda    #$FF
    ;;@` ldx    #$FF
    ;;@` jsr    SDL_Delay
    ;;@```
    tay
@delay_loop:
    ; Create a delay by reading/writing to CH376 ports
    ; Each I/O access takes multiple cycles on the bus

    ; Write a dummy command (GET_STATUS) - 4 cycles


    ; Read the DATA port - 4 cycles


    ; Inner loop of 256 iterations to create a delay
    ; 256 * (2+2+1) = 1280 cycles per outer loop
    ; Plus I/O accesses = ~1300 cycles = ~1.3ms per iteration
    ;ldx #$00
@inner_loop:
    nop         ; 1 cycle
    nop         ; 1 cycle
    dex         ; 2 cycles
    bne @inner_loop  ; 2-3 cycles (3 when branch, 2 when not)

    ; One iteration of @delay_loop = ~1.3ms
    dey
    bne @delay_loop

@exit:
    lda #$00  ; Return 0 (success)
    rts

.endproc
