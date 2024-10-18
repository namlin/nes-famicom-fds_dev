; This Interrupt Service Routine is called when the NES is reset, including when
; it is turned on.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

.PROC ISR_PowerOn_Reset
  ; ----------------------------------------------------------------------------
  ; Initialization sequence for the NES. These tasks should generally be
  ; performed every time the system is reset.
  ; ----------------------------------------------------------------------------
  
  cld  ; Disable unsupported BCD mode (in case of using a 6502 debugger).

  ldx #255
  txs ; Set the value of the stack pointer to 255 (two hundred and fifty-five).
  jsr DisableVideoOutput
  jsr DisableAudioOutput

  ; Clear the vblank flag in case the NES was reset during vblank (the vblank
  ; flag won't be used much after this).
  jsr ClearVBlankFlag

  ; ----------------------------------------------------------------------------
  ; Note: When the system is first turned on or reset, the PPU may not be in a
  ; usable state right away. You should wait at least 30,000 (thirty thousand)
  ; CPU cycles for the PPU to initialize, which may be accomplished by waiting
  ; for 2 (two) vertical blank intervals.
  ; ----------------------------------------------------------------------------

  jsr WaitForVBlank

  jmp __ClearCPUMemory

  __CPUMemoryCleared:

  jsr WaitForVBlank

  ; ---------------------
  ; Now the PPU is ready.
  ; ---------------------

  jsr LoadPaletteData
  jsr LoadSpriteData
  jsr EnableVideoOutput

  ; -------------
  ; ENDLESS LOOP.
  ; -------------

  jsr EndlessLoop
  rti  ; This should never be called.

.ENDPROC 
