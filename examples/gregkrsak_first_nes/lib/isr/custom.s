; This Interrupt Service Routine is called when a BRK instruction is executed.
; This is a good location to place custom code, which will then trigger with
; every BRK instruction. Note that this interrupt is maskable (IRQ).
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

.PROC ISR_Custom
  nop  ; Do nothing.
  rti  ; Return from the interrupt.
    
.ENDPROC
