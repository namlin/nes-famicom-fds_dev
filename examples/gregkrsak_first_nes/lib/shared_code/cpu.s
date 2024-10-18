; Common CPU-related routines.

; ==============================================================================
; Subroutine to initiate an endless loop.
; ==============================================================================

.PROC EndlessLoop
  endlessLoop:
    jmp endlessLoop

    rts

.ENDPROC


; ==============================================================================
; Subroutine to clear the internal CPU RAM (unsafe)
; ==============================================================================

__ClearCPUMemory:
  ldx #$00

  __clearMemoryLoop:
    lda _RAM_CLEAR_PATTERN_1
    sta $0000, x
    sta $0100, x
    sta $0200, x
    sta $0400, x
    sta $0500, x
    sta $0600, x
    sta $0700, x
    lda _RAM_CLEAR_PATTERN_2
    sta $0300, x
    inx
    bne __clearMemoryLoop

    jmp ISR_PowerOn_Reset::__CPUMemoryCleared
