
INCLUDE	globals.inc

CODE	segment	public

	assume	cs:code

copyright	proc	near
		@PUSH
		mov	cs:_how,0
		@FILLSTR	strbuf," ",80
		@WPRINT	0,24,strbuf
		@CHANGESEGM	DS,WINDOWS
		@USERBOX	"�"
		mov	wcright[@WIN_BOX],0
		@SETWIND	wcright
		@SELECTWIND	wcright
		xor	bx,bx
edo:		mov	al,cs:_puse[bx]
		cmp	al,0
		je	fige
		mov	ah,cs:_puse[bx+1]
		mov	cl,cs:_puse[bx+2]
		@WPRINTCH al,ah,cl,wcright[@WIN_ATR]
		cmp	cs:_how,1
		je	snex1
		push	ax
		@WAIT	1
		jnc	snex0
		mov	cs:_how,1
snex0:		pop	ax
snex1:		add	bx,3
		jmp	edo
fige:		mov	al,35
		mov	cx,28
edo1:		@WPRINTCH al,ah,"�",wcright[@WIN_ATR]
		cmp	cs:_how,1
		je	snex11
		push	ax
		@WAIT	1
		jnc	snex10
		mov	cs:_how,1
snex10:		pop	ax
snex11:		dec	al
		loop	edo1
		@WPRINTCH al,ah,"�",wcright[@WIN_ATR]
		push	ax
		@WAIT	1
		pop	ax
		dec	ah
		mov	cx,5
edo2:		@WPRINTCH al,ah,"�",wcright[@WIN_ATR]
		cmp	cs:_how,1
		je	snex21
		push	ax
		@WAIT	1
		jnc	snex20
		mov	cs:_how,1
snex20:		pop	ax
snex21:		dec	ah
		loop	edo2
		@WPRINTCH al,ah,"�",wcright[@WIN_ATR]
		push	ax
		@WAIT	1
		pop	ax
		inc	al
		mov	cx,23
edo3:		@WPRINTCH al,ah,"�",wcright[@WIN_ATR]
		cmp	cs:_how,1
		je	snex31
		push	ax
		@WAIT	1
		jnc	snex30
		mov	cs:_how,1
snex30:		pop	ax
snex31:		inc	al
		loop	edo3
		xor	dx,dx

arxi:		mov	ax,dx
		mov	bl,0
		mov	cx,44
edi1:		and	ax,1
		jz	eki
		@WPRINTCH bl,0,"�",wcright[@WIN_ATR]
		jmp	neki
eki:		@WPRINTCH bl,0," ",wcright[@WIN_ATR]
neki:		inc	ax
		inc	bx
		loop	edi1

		mov	bl,0
		mov	cx,14
edi10:		and	ax,1
		jz	eki0
		@WPRINTCH 0,bl,"�",wcright[@WIN_ATR]
		jmp	neki0
eki0:		@WPRINTCH 0,bl," ",wcright[@WIN_ATR]
neki0:		inc	ax
		inc	bx
		loop	edi10

		mov	bl,0
		mov	cx,44
edi11:		and	ax,1
		jz	eki1
		@WPRINTCH bl,13,"�",wcright[@WIN_ATR]
		jmp	neki1
eki1:		@WPRINTCH bl,13," ",wcright[@WIN_ATR]
neki1:		inc	ax
		inc	bx
		loop	edi11

		mov	bl,0
		mov	cx,14
edi12:		and	ax,1
		jz	eki2
		@WPRINTCH 43,bl,"�",wcright[@WIN_ATR]
		jmp	neki2
eki2:		@WPRINTCH 43,bl," ",wcright[@WIN_ATR]
neki2:		inc	ax
		inc	bx
		loop	edi12
		@WAIT	2
		jc	figi

s4:		inc	dx
		jmp	arxi

figi:		@DELWIND	wcright
		@CHANGESEGM	DS,DATAS1
		@WPRINT	0,24,genesis
		@POP
		ret
_how	db	0
_puse	db	13,3,"�"		;"S"
	db	12,3,"�"
	db	11,3,"�"
	db	10,3,"�"
	db	9,3,"�"
	db	9,4,"�"
	db	9,5,"�"
	db	10,5,"�"
	db	11,5,"�"
	db	12,5,"�"
	db	13,5,"�"
	db	13,6,"�"
	db	13,7,"�"
	db	12,7,"�"
	db	11,7,"�"
	db	10,7,"�"
	db	9,7,"�"

	db	15,3,"�"		;"U"
	db	15,4,"�"
	db	15,5,"�"
	db	15,6,"�"
	db	15,7,"�"
	db	16,7,"�"
	db	17,7,"�"
	db	18,7,"�"
	db	19,7,"�"
	db	19,6,"�"
	db	19,5,"�"
	db	19,4,"�"
	db	19,3,"�"

	db	21,5,"�"		;"P"
	db	22,5,"�"
	db	23,5,"�"
	db	24,5,"�"
	db	25,5,"�"
	db	25,4,"�"
	db	25,3,"�"
	db	24,3,"�"
	db	23,3,"�"
	db	22,3,"�"
	db	21,3,"�"
	db	21,4,"�"
	db	21,5,"�"
	db	21,6,"�"
	db	21,7,"�"

	db	30,3,"�"		;"E"
	db	29,3,"�"
	db	28,3,"�"
	db	27,3,"�"
	db	26,3,"�"
	db	26,4,"�"
	db	26,5,"�"
	db	26,6,"�"
	db	26,7,"�"
	db	27,7,"�"
	db	28,7,"�"
	db	29,7,"�"
	db	30,7,"�"
	db	26,5,"�"
	db	27,5,"�"
	db	28,5,"�"

	db	32,5,"�"		;"R"
	db	33,5,"�"
	db	34,5,"�"
	db	35,5,"�"
	db	36,5,"�"
	db	36,4,"�"
	db	36,3,"�"
	db	35,3,"�"
	db	34,3,"�"
	db	33,3,"�"
	db	32,3,"�"
	db	32,4,"�"
	db	32,5,"�"
	db	32,6,"�"
	db	32,7,"�"
	db	35,5,"�"
	db	35,6,"�"
	db	36,6,"�"
	db	36,7,"�"
	db	36,8,"�"
	db	0
copyright	endp

code	ends
	end
