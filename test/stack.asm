; TEST
; a = 0x06
; b = 0x02
; c = 0x01
; d = 0x05
; l = 0xFF
; h = 0xFE
; [0xFEFF] = 0x03
; [0xFEFE] = 0x04


lda [0xFEFF]
sw [0xFFFC], l
sw [0xFFFD], h

push 0x06
pop a

push 0x01
push 0x02
pop b
pop c

push 0x03
push 0x04
push 0x05
pop d

halt
