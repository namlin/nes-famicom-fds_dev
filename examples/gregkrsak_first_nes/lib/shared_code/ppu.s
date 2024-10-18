; Common PPU-related routines.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

; ======================================================================================
; Subroutine to disable video output. This will cause a black screen and disable vblank.
; ======================================================================================

.PROC DisableVideoOutput
  lda #%00000000
  sta _PPUCTRL  ; Disable vertical blank interrupt.
  sta _PPUMASK  ; Disable sprite rendering.

  rts
    
.ENDPROC


; ===========================================================
; Subroutine to enable video output. This will enable vblank.
; ===========================================================

.PROC EnableVideoOutput
  lda #%10000000
  sta _PPUCTRL  ; Enable vertical blank interrupt.

  lda #%00010000
  sta _PPUMASK  ; Enable sprite rendering.

  rts

.ENDPROC


; ==============================
; Subroutine to wait for vblank.
; ==============================

.PROC WaitForVBlank
  vBlankWaitLoop:
    bit _PPUSTATUS
    bpl vBlankWaitLoop

    rts

.ENDPROC


; ====================================
; Subroutine to clear the vblank flag.
; ====================================

.PROC ClearVBlankFlag
  bit _PPUSTATUS
  rts

.ENDPROC


; ================================
; Subroutine to load palette data.
; ================================

.PROC LoadPaletteData
  lda  _PPUSTATUS  ; Reset the high/low latch to "high".

  lda #$3F
  sta _PPUADDR  ; Write the high byte of $3F00 address.

  lda #$00
  sta _PPUADDR  ; Write the low byte of $3F00 address.

  ldx #$00

  loadPalettesLoop:
    lda _PALETTE, x
    sta _PPUDATA  ; Write to PPU.
    inx
    cpx #32
    bne loadPalettesLoop

    rts

.ENDPROC 


; ===============================
; Subroutine to load sprite data.
; ===============================

.PROC LoadSpriteData
  ldx #$00

  loadSpritesLoop:
    lda _SPRITES, x
    sta $0200, x  ; Write to PPU.
    inx
    cpx #16
    bne loadSpritesLoop

    rts

.ENDPROC
