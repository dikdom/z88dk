; ----------------------------------------------------------------
; Z88DK INTERFACE LIBRARY FOR THE BIFROST*2 ENGINE
;
; See "bifrost2.h" for further details
; ----------------------------------------------------------------

; void BIFROST2_start(void)

SECTION code_clib
SECTION code_bifrost2

PUBLIC _BIFROST2_start

EXTERN asm_BIFROST2_start

defc _BIFROST2_start = asm_BIFROST2_start
