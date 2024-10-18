; ROM Header information required to output an iNES-format (.NES) file. This
; type of ROM file is commonly used by NES emulators, but is generally unsuitable
; for hardware cartridges. While iNES supports much larger ROM/VROM configurations,
; this is a "simple" header that only supports 1 (one) 16K PRG and 1 (one) 8K CHR.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

.BYTE   "NES", $1a
.BYTE   $01         ; 1x 16KB ROM (PRG).
.BYTE   $01         ; 1x 8KB VROM (CHR).
.BYTE   %00000001   ; Mapper nibble 0000 == No mapping (a simple 16KB PRG + 8KB CHR game).
                    ; Mirroring nibble 0001 == Vertical mirroring only.

; NOTE: The remainder of the header should be zero-padded to $10 (16) bytes.
; This should generally be accomplished by a linker (vs. doing it in code) if possible.
