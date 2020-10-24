
INCLUDE	globals.inc

CODE	segment	public

	assume	cs:code,ds:datas1

genitr	proc	near
	@PUSH
	xor	di,di
	mov	ax,1
	mov	[di],al
	mov	cx,3
sim01:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim02:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim03:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim04:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim05:	push	cx
	push	di
	call	basikes_koce
	jnc	sim051
	jmp	sim052

sim051:	inc	di
	mov	[di],al
	mov	cx,3
sim06:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim07:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim08:	push	cx
	push	di
	call	basikes_koce
	jnc	sim081
	jmp	sim082

sim081:	inc	di
	mov	[di],al
	mov	cx,3
sim09:	push	cx
	push	di
	call	basikes

	inc	di
	mov	[di],al
	mov	cx,3
sim10:	push	cx
	push	di
	call	basikes_koce
	jnc	sim101
	jmp	sim102

sim101:	inc	di
	mov	[di],al
	mov	cx,3
sim11:	push	cx
	push	di
	call	basikes_koce
	jnc	sim111
	jmp	sim112

sim111:	inc	di
	mov	[di],al
	mov	cx,3
sim12:	push	cx
	push	di
	call	basikes_koce
	jnc	sim121
	jmp	sim122

sim121:	inc	di
	mov	[di],al
	mov	cx,3
sim13:	push	cx
	push	di
	call	basikes

;*****************************************
	@PUSH
	call	basikes_oria
	jc	pida
	@INCL	ar_stilon
pida:	@POP
;*****************************************

	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim139
sim122:	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim129
sim112:	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim119
sim102:	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim109
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim099
sim082:	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim089
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim079
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim069
sim052:	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim059
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim049
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim039
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim029
	pop	di
	pop	cx
	shl	byte ptr [di],1
	loop	sim019
	@POP
	ret
sim139:	jmp	sim13
sim129:	jmp	sim12
sim119:	jmp	sim11
sim109:	jmp	sim10
sim099:	jmp	sim09
sim089:	jmp	sim08
sim079:	jmp	sim07
sim069:	jmp	sim06
sim059:	jmp	sim05
sim049:	jmp	sim04
sim039:	jmp	sim03
sim029:	jmp	sim02
sim019:	jmp	sim01
genitr	endp

basikes	proc	near
	lea	bx,stili1
	call	basiki
	ret
basikes	endp

basikes_koce	proc	near
	lea	bx,stili1
	call	basiki_koce
	ret
basikes_koce	endp

basikes_oria	proc	near
	lea	bx,stili1
	call	basiki_oria
	ret
basikes_oria	endp

basiki	proc	near
	push	ax
	mov	ah,[bx][di][18]
	mov	al,[di]
	and	al,[bx][di]
	jz	diaf3
	inc	ah
diaf3:	mov	[bx][di][18][1],ah
	pop	ax
	ret
basiki	endp

basiki_koce	proc	near
	push	ax
	mov	ah,[bx][di][18]
	mov	al,[di]
	and	al,[bx][di]
	jz	diaf4
	inc	ah
diaf4:	mov	[bx][di][18][1],ah

	cmp	ah,[bx][15]
	ja	diaf5
	mov	dx,12
	sub	dx,di
	add	dl,ah
	cmp	dl,[bx][14]
	jb	diaf5
	pop	ax
	clc
	ret

diaf5:	cmp	ah,[bx][17]
	ja	diaf6
	mov	dx,12
	sub	dx,di
	add	dl,ah
	cmp	dl,[bx][16]
	jb	diaf6
	pop	ax
	clc
	ret

diaf6:	pop	ax
	stc
	ret
basiki_koce	endp

basiki_oria	proc	near
	push	ax
	mov	ah,[bx][di][18]
	mov	al,[di]
	and	al,[bx][di]
	jz	diaf
	inc	ah

diaf:	cmp	ah,[bx][14]
	jb	diaf1
	cmp	ah,[bx][15]
	ja	diaf1
	pop	ax
	clc
	ret

diaf1:	cmp	ah,[bx][16]
	jb	diaf2
	cmp	ah,[bx][17]
	ja	diaf2
	pop	ax
	clc
	ret

diaf2:	pop	ax
	stc
	ret
basiki_oria	endp

code	ends
	end
