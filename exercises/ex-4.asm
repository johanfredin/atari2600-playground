    processor 6502
    
    seg Code    ; Define a new segment named "Code"
    org $F000   ; Define the origin of the ROM code at memory address $F000
Start:
    lda #100    ; Load the A register with the literal decimal value 100
    clc         ; Add the decimal value 5 to the accumulator
    adc #5

    sec         ; Subtract the decimal value 10 from the accumulator
    sbc #10     
    
                ; Register A should now contain the decimal 95 (or $5F in hexadecimal)

    jmp Start

    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE