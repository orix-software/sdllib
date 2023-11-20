.export _SDL_BlitSprite4x18

.import SDL_HiresTableHigh,SDL_HiresTableLow

.import popax
.importzp ptr1,ptr2,tmp1,tmp2

TABLE_LOW_HIRES:=SDL_HiresTableLow
TABLE_HIGH_HIRES:=SDL_HiresTableHigh

.proc _SDL_BlitSprite4x18
  ;  
  ; posy = y
  ; posx = a

  pha
  lda TABLE_LOW_HIRES,y
  sta ptr2
  lda TABLE_HIGH_HIRES,y
  sta ptr2+2
  pla 

  
  clc
  adc ptr2  ; $a002
  bcc skip3
  sta ptr2+1
skip3  :
  sta ptr2


  jsr popax
  sta ptr1
  stx ptr1+1


  ldx #72
loop:
  ldy #$00
  lda (ptr1),y
  sta (ptr2),y
  iny 
  lda (ptr1),y
  sta (ptr2),y
  iny
  lda (ptr1),y
  sta (ptr2),y

  lda ptr1
  clc
  adc #$03
  bcc skip
  inc ptr1+1
skip:
  sta ptr1

  lda ptr2
  clc
  adc #$28
  bcc skip2
  inc ptr2+1
skip2:
  sta ptr2

 
  
  dex 
  bne loop

  rts
.endproc


