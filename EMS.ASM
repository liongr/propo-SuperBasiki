
INCLUDE	EMS.INC

code	segment	public

	assume	cs:code

ems_setup	proc	near
	@PUSH
	call	ems_chk
	jnc	nerr19

err19:	@POP
	stc
	ret

nerr19:	@EMS_CHK
	cmp	ah,0
	jne	err19

	@EMS_GETSEGM	;0-4000h-8000h-c000h
	mov	cs:ems_win,bx

	@EMS_GETFREE

ner2:	@EMS_ALLOC	bx
	cmp	ah,0
	je	ner1
	dec	bx
	cmp	bx,0
	je	err19
	jmp	ner2

ems_handle	dw	0
ems_win		dw	0
ems_pages	dw	0
ems_mem		dw	0,0

ner1:	mov	cs:ems_handle,dx
	mov	cs:ems_pages,bx
	mov	ax,bx
	mov	cx,16384
	mul	cx
	mov	cs:ems_mem[0],ax
	mov	cs:ems_mem[2],dx

	@EMS_PAGE2WIN	0,0,cs:ems_handle
	mov	cs:ems_p_page,0
	@POP
	clc
	ret
ems_setup	endp

ems_chk	proc	near
	@PUSH
	@GETINT	67h
	mov	bx,0
	mov	cx,8
emm1:	mov	al,cs:_emmstr[bx]
	cmp	es:[bx][10],al
	jne	emserr
	inc	bx
	loop	emm1
	@POP
	clc
	ret
emserr:	@POP
	stc
	ret
_emmstr	db	"EMMXXXX0"
ems_chk	endp

adr2ems	proc	near	;ax:dx physical adress * ax offset to win 0
	@PUSHAX
	mov	cx,16384
	div	cx
	push	dx
	cmp	ax,ems_pages
	jbe	exi
	pop	dx
	xor	ax,ax
	@POPAX
	stc
	ret
exi:	mov	cx,cs:ems_p_page
	cmp	ax,cx
	jne	load_it
	jmp	find_adr

load_it:
	mov	cs:ems_p_page,ax
	@EMS_PAGE2WIN	0,ax,cs:ems_handle

find_adr:
	pop	ax
	@POPAX
	clc
	ret
ems_p_page	dw	0
adr2ems	endp

code	ends
	end
