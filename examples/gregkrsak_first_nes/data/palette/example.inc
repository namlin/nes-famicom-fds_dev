; Palette data for a NES ROM.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

_PALETTE:

; Background palettes:
.BYTE $0f, $31, $32, $33
.BYTE $0f, $35, $36, $37
.BYTE $0f, $39, $3a, $3b
.BYTE $0f, $3d, $3e, $0f

; Sprite palettes (selected by the attribute bits 0-1 of the sprites):
.BYTE $0f, $1c, $15, $14
.BYTE $0f, $02, $38, $3c
.BYTE $0f, $30, $37, $1a  ; Luigi-like colors.
.BYTE $0f, $0f, $0f, $0f  ; All black.
