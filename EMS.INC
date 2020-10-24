
INCLUDE	mylib.inc

global	adr2ems:proc
global	ems_setup:proc
global	ems_chk:proc
global	ems_handle:word
global	ems_win:word
global	ems_pages:word
global	ems_mem:word
global	ems_p_page:word

@EMS_CHK	macro			;ah=error
	mov	ah,64
	int	67h
	endm

@EMS_GETSEGM	macro		;ah=error
	mov	ah,65		;bx=segment of first ems window(16kb x 4win)
	int	67h
	endm

@EMS_GETFREE	macro		;ah=error
	mov	ah,66		;bx=free pages (1page=16kb)
	int	67h		;dx=total pages
	endm

@EMS_ALLOC	macro	pages	;ah=error
	mov	bx,pages	;bx=poses selides ton 16KB
	mov	ah,67		;dx=handle
	int	67h
	endm

@EMS_PAGE2WIN	macro	window,page,handle	;ah=error
	mov	bx,page		;(0-...)
	mov	al,window	;(0-3)
	mov	dx,handle	;handle
	mov	ah,68
	int	67h		;ah=error
	endm

@EMS_FREE	macro	handle
		mov	dx,handle
		mov	ah,69
		int	67h
		endm

@EMS_SETUP	macro
		call	ems_setup
		endm

@ADR2EMS	macro	adress
		mov	ax,word ptr adress
		mov	dx,word ptr adress[2]
		call	adr2ems
		endm
