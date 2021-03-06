; ARCHITECTURE CONSTANTS

; SPECIAL MEMORY ADDRESSES
@define ADDR_ROM  0x0000
@define ADDR_BANK 0x8000
@define ADDR_RAM  0xC000
@define ADDR_STACK 0xFEFF

; SPECIAL MEMORY-MAPPED REGISTERS
@define ADDR_MB  0xFFFA
@define ADDR_MBL 0xFFFA
@define ADDR_MBH 0xFFFB

@define ADDR_SP  0xFFFC
@define ADDR_SPL 0xFFFC
@define ADDR_SPH 0xFFFD

@define ADDR_PC  0xFFFC
@define ADDR_PCL 0xFFFC
@define ADDR_PCH 0xFFFD

; FLAG INDICES
@define FLAG_L 0x01
@define FLAG_E 0x02
@define FLAG_C 0x03
@define FLAG_B 0x04
