
; int b_vector_at(b_vector_t *v, size_t idx)

XDEF b_vector_at_callee

LIB b_array_at_callee

defc b_vector_at_callee = b_array_at_callee

INCLUDE "../../z80/asm_b_vector_at.asm"
