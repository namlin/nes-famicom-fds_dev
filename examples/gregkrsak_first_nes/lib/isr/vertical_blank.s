; After the NES displays a frame of graphics, it stops drawing for a while. This
; period is known as the vertical blank, or "vblank", and is a good choice for
; performing graphics updates. Note that this interrupt is non-maskable (NMI).
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

.PROC ISR_Vertical_Blank
  ; -------------------------------------------------
  ; Refresh DRAM-stored sprite data before it decays.
  ; -------------------------------------------------

  lda #$00
  sta _OAMADDR  ; Set the low byte (00) of the RAM address.

  lda #$02
  sta _OAMDMA  ; Set the high byte (02) of the RAM address and start the DMA transfer.
  ; ----------------------------
  ; Freeze the button positions.
  ; ----------------------------

  lda #$01
  sta _JOY1
  lda #$00
  sta _JOY1  ; Controllers for first and second player are now latched and will not change.
  ; --------------
  ; Read button A.
  ; --------------

  lda _JOY1
  and #%00000001  ; Only look at bit 0.
  beq readButtonAEnd  ; Branch to readButtonAEnd if button A is NOT pressed (0).
  jsr MoveLuigiRight  ; Call the procedure that moves the Luigi sprites right.
    readButtonAEnd:

    ; ---------------
    ; Read button B.
    ; ---------------
 
    lda _JOY1
    and #%00000001  ; Only look at bit 0.
    beq readButtonBEnd  ; Branch to readButtonBEnd if button B is NOT pressed (0).
    jsr MoveLuigiLeft  ; Call the procedure that moves the Luigi sprites left.

  readButtonBEnd:
  
    rti  ; Return from interrupt.

.ENDPROC
