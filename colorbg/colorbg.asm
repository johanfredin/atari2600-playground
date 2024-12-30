    PROCESSOR 6502

    include "../common/vcs.h"
    include "../common/macro.h"

    seg code
    org $F000       ; defines the origin of the ROM at $F000

START:
    CLEAN_START     ; Macro to safely clear the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #$1E        ; Load color yellow into A ($1E = NTSC yellow)
    sta COLUBK      ; Store A to bg color address $09

    jmp .           ; Repeat forever

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    .org $FFFC      
    .word START
    .word START
