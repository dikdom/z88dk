; void UNSAFE_SMS_copySpritestoSAT(void)

SECTION code_clib
SECTION code_SMSlib

PUBLIC _UNSAFE_SMS_copySpritestoSAT

EXTERN asm_UNSAFE_SMSlib_copySpritestoSAT

defc _UNSAFE_SMS_copySpritestoSAT = asm_UNSAFE_SMSlib_copySpritestoSAT
