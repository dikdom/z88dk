

	MODULE	generic_console

	SECTION	code_clib

        PUBLIC  generic_console_cls
        PUBLIC  generic_console_vpeek
        PUBLIC  generic_console_printc
        PUBLIC  generic_console_scrollup
        PUBLIC  generic_console_ioctl
        PUBLIC  generic_console_set_ink
        PUBLIC  generic_console_set_paper
        PUBLIC  generic_console_set_inverse

	PUBLIC	__cpc_mode

	EXTERN	CRT_FONT

	defc	SCREEN = 0xc000

generic_console_ioctl:
        scf
generic_console_set_ink:
generic_console_set_paper:
generic_console_set_inverse:
        ret

generic_console_vpeek:
	scf
	ret


generic_console_cls:
	ld	hl,SCREEN
	ld	de,SCREEN+1
	ld	bc,16383
	ld	(hl),0		;TODO
	ldir
	ret

generic_console_scrollup:
	ret

; c = x
; b = y
; a = d character to print
; e = raw
generic_console_printc:
	sub	32
	ld	l,a
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	de,(__cpc_font)
	add	hl,de
	push	hl		;Save font
	call	calc_screen_position
	pop	de
	; hl = screen address to place
	; de = font
	ld	a,(__cpc_mode)
	cp	2
	jr	z,handle_mode2
	and	a
	jr	z,handle_mode0

handle_mode1:
	;
	; b7   b6   b5   b4   b3   b2   b1   b0
	; p0-1 p1-1 p2-1 p3-1 p0-0 p1-0 p2-0 p3-0
	ld	b,8
handle_mode1_0:
	ld	a,(de)
	rrca
	rrca
	rrca
	rrca
	and	15
	ld	c,a	
	ld	a,(de)
	and	@11110000
	or	c
	ld	(hl),a
	inc	hl
	ld	a,(de)
	and	15
	ld	c,a	
	rlca
	rlca
	rlca
	rlca
	or	c
	ld	(hl),a
	dec	hl
	ld	a,h
	add	8
	ld	h,a
	inc	de
	djnz	handle_mode1_0
	ret

handle_mode2:
	ld	b,8
handle_mode2_1:
	ld	a,(de)
	ld	(hl),a
	ld	a,h
	add	8		;2048
	ld	h,a
	inc	de
	djnz	handle_mode2_1
	ret

handle_mode0:
	ld	b,8
	; b7    b6    b5    b4    b3    b2    b1    b0
	; p0-b0 p1-b0 p1-b2 p1-b2 p0-b1 p1-b1 p0-b3 p1-b3
handle_mode0_0:
	ld	a,(de)
	and	@11000000
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	(hl),a
	inc	hl
	ld	a,(de)
	and	@00110000
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	(hl),a
	inc	hl
	ld	a,(de)
	and	@00001100
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	(hl),a
	inc	hl
	ld	a,(de)
	and	@00000011
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	c,a
	rrca
	rrca
	or	c
	ld	(hl),a
	dec	hl
	dec	hl
	dec	hl
	inc	de
	ld	a,h
	add	8
	ld	h,a
	djnz	handle_mode0_0
	ret

; Entry: c = x (chars)
;        b = y (chars)
; Exit: hl = address
;      
; For a line:
;
; Address = 0xC000 + ((Line / 8) * 80) + ((Line % 8) * 2048)
calc_screen_position:
	; Convert column into byte
	; Mode 2 = no shifting (80max)
	; Mode 1 = 4 pixels per byte = *2 (40 max)
	; Mode 0 = 2 pixels per byte = *4 (20 max)
	ld	a,(__cpc_mode)
	cp	2
	jr	z,calc_address
	and	a
	jr	nz,check_mode1
	; Mode 0
	sla	c
check_mode1:
	sla	c
calc_address:
	ld	de,SCREEN
	; Considering x position
	ld	a,e
	add	c
	ld	e,a
	adc	d
	sub	e
	ld	d,a

	; Now we have to multiple by 80
	ld	a,b		;In the range 0-24
	add	a		; * 2
	add	a		; * 4
	add	a		; * 8
	ld	l,a
	ld	h,0
	add	hl,hl		;*16
	ld	b,h
	ld	c,l
	add	hl,hl		;*32
	add	hl,hl		;*64
	add	hl,bc		;*80
	; No need to do the last bit since we're whole character
	add	hl,de
	ret

	
	SECTION	data_clib

.__cpc_mode	defb	0
.__cpc_font	defw	CRT_FONT
