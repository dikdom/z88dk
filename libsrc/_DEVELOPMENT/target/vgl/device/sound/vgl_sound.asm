SECTION data_clib


PUBLIC vgl_sound_off

vgl_sound_off:
	; Speaker off
	ld	a, 0h	; +20h
	out	(12h), a
	ret