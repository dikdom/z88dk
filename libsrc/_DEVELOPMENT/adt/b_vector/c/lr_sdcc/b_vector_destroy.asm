
; void b_vector_destroy(b_vector_t *v)

XDEF b_vector_destroy

b_vector_destroy:

   pop af
   pop hl
   
   push hl
   push af

   jr asm_b_vector_destroy
   
   INCLUDE "../../z80/asm_b_vector_destroy.asm"
