; CPU-Related assembler directives for Nintendo Entertainment System assembly
; language.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

; The NES's 6502 does not contain support for decimal mode. Both the CLD and SED
; opcodes function normally, but the 'd' bit of P is unused in both ADC and SBC.
; It is common practice for games to CLD prior to code execution, as the status
; of 'd' is unknown on power-on and on reset.
; 
; Audio registers are mapped internal to the CPU; all waveform generation is
; done internal to the CPU as well.

; CPU MEMORY MAP:
;
; --------------------------------------- $10000
; Upper Bank of Cartridge ROM
; --------------------------------------- $C000
; Lower Bank of Cartridge ROM
; --------------------------------------- $8000
; Cartridge RAM (may be battery-backed)
; --------------------------------------- $6000
; Expansion Modules
; --------------------------------------- $5000
; Input/Output
; --------------------------------------- $2000
; 2kB Internal RAM, mirrored 4 times
; --------------------------------------- $0000


_RAM_CLEAR_PATTERN_1	= $00
_RAM_CLEAR_PATTERN_2	= $FE
