mcode1	segment	public
global	diskdir:proc
mcode1	ends

@DISKDIR macro	filename,ldir,print
	push	bx
	push	ax
	push	si
	mov	bx,offset filename
IFB	<print>
	xor	ax,ax
ELSE
	mov	ax,offset print
ENDIF
	mov	si,offset ldir
	call	far ptr diskdir
	pop	si
	pop	ax
	pop	bx
	endm
