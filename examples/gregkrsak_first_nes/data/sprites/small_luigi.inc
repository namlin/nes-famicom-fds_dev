; Sample sprite data for an NES ROM. References the tile data in the data/tiles directory.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

_SPRITES:
; =================================
;     Y     TILE  ATTR        X
; =================================

; --- BEGIN Small Luigi ---
.BYTE 128,  $36,  %00000010,  128  ; Sprite 0
.BYTE 128,  $37,  %00000010,  136  ; Sprite 1
.BYTE 136,  $38,  %00000010,  128  ; Sprite 2
.BYTE 136,  $39,  %00000010,  136  ; Sprite 3
; --- END Small Luigi ---
