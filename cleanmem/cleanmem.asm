    processor 6502

    seg code
    org $F000   ; Define the code origin at F000

Start:
    SEI         ; disable interrupts
    CLD         ; disable BCD decimal math mode
    ldx #$FF    ; Loads the x register with #$FF
    TSX         ; Transfer the x register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the zero page region ($00 to $FF)
; Meaning the entire RAM and the TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDA #0      ; A = 0
    LDX #$FF    ; X = FF
    STA $FF     ; empty memory location FF as x will become FE in fist iteration
MemLoop:
    DEX         ; x--
    STA $0,X    ; Store the value of A inside memory address 0 + X
    BNE MemLoop ; Loop until x is equal to zero (z-flag is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ORG $FFFC
    .word Start ; Reset vector at $FFFC (where the program starts)
    .word Start ; Interrupt vector at $FFFE (unused on the 2600 but required)