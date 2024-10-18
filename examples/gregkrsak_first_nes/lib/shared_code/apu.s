; Common Audio-related routines.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

; ===================================
; Subroutine to disable audio output.
; ===================================

.PROC DisableAudioOutput
  lda #%01000000
  sta _FR_COUNTER  ; Disable APU frame IRQ.
  sta _DMC_FREQ  ; Disable digital sound IRQs.
  rts

.ENDPROC
