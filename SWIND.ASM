
INCLUDE	globals.inc

CODE	segment	public

	assume	cs:code

eis_filename	proc	near
		@PUSH
		@CHANGESEGM	DS,WINDOWS
		@SETWIND	w_nfile
		@SELECTWIND	w_nfile
		@CHANGESEGM	DS,DATAS1
		@FILLSTR	strbuf," ",8
		@WINPUT	21,4,strbuf
		pushf
		@CHANGESEGM	DS,WINDOWS
		@DELWIND	w_nfile
		popf
		@POP
		ret
eis_filename	endp

help	proc	near
	@PUSH
        @CHANGESEGM	DS,WINDOWS
        @SETWIND	helpw
	@SELECTWIND	helpw
	mov	dx,cs:_phelp
	push	dx
	jmp	nent
wesc:	@INVERSE	cs:_cx,cs:_cy,25
	@WAITL
	@INVERSE	cs:_cx,cs:_cy,25
	push	dx
	call	plelex
	jnc	help0
	pop	dx
	@UPPERAX
	jmp	helpt
help0:	cmp	dx,0
	jne	nent
	mov	ah,cs:_cy
	mov	al,cs:_cx
	@CHANGESEGM	ds,DATAS1
	@TAKECURSWORD	strbuf,ax
	mov	al,strbuf
	pop	dx
	jmp	helpt
nent:	pop	ax
	xor	ax,ax
	mov	al,dl
	dec	ax
	mov	cl,25
	mul	cl
	inc	ax
	cmp	ax,51
	jbe	help1
	mov	ax,51
	mov	dl,3
help1:	mov	cs:_cx,al
	cmp	dh,9
	jbe	help2
	mov	dh,9
help2:	mov	cs:_cy,dh
	jmp	wesc
helpt:	@CHANGESEGM	ds,DATAS1
	mov	pliktro,ax
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	helpw
	mov	cs:_phelp,dx
	@POP
        ret
_cx	db	0
_cy	db	0
_phelp	label	word
	db	1,1
help	endp

hmetr	proc	near
	@PUSH
        @CHANGESEGM	DS,WINDOWS
        @SETWIND	menu_metrhtes
	@SELECTWIND	menu_metrhtes
	mov	dx,cs:_pmetr
	push	dx
	jmp	hent
hmm1:	@INVERSE	cs:_cx,cs:_cy,34
	@WAITL
	@INVERSE	cs:_cx,cs:_cy,34
	push	dx
	call	plelex
	jnc	hmet0
	pop	dx
	@UPPERAX
	jmp	hmett1
hmet0:	cmp	dx,0
	jne	hent
	mov	ah,cs:_cy
	mov	al,cs:_cx
	inc	ax
	@CHANGESEGM	ds,DATAS1
	@TAKECURSWORD	strbuf,ax
	mov	al,strbuf
	pop	dx
	jmp	hmett
hent:	pop	ax
	mov	cs:_cx,3
	cmp	dh,10
	jbe	hmet2
	mov	dh,10
hmet2:	cmp	dh,2
	jae	hmet1
	mov	dh,2
hmet1:	mov	cs:_cy,dh
	jmp	hmm1
hmett:	@CHANGESEGM	ds,WINDOWS
	mov	ah,0
	sub	ax,49
	mov	bx,ax
	mov	ah,m_metr_p[bx]
	mov	al,0
hmett1:	cmp	al,"0"
	jb	hmett9
	cmp	al,"9"
	ja	hmett9
	jmp	hmett
hmett9:	@CHANGESEGM	ds,DATAS1
	mov	pliktro,ax
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	menu_metrhtes
	mov	cs:_pmetr,dx
	@POP
        ret
_pmetr	label	word
	db	1,1
hmetr	endp

homad	proc	near
	@PUSH
        @CHANGESEGM	DS,WINDOWS
        @SETWIND	menu_omadvn
	@SELECTWIND	menu_omadvn
	mov	dx,cs:_pomad
	push	dx
	jmp	homt
hoo1:	@INVERSE	cs:_cx,cs:_cy,38
	@WAITL
	@INVERSE	cs:_cx,cs:_cy,38
	push	dx
	call	plelex
	jnc	homa0
	pop	dx
	@UPPERAX
	jmp	homat1
homa0:	cmp	dx,0
	jne	homt
	mov	ah,cs:_cy
	mov	al,cs:_cx
	inc	ax
	@CHANGESEGM	ds,DATAS1
	@TAKECURSWORD	strbuf,ax
	mov	al,strbuf
	pop	dx
	jmp	homat
homt:	pop	ax
	mov	cs:_cx,3
	cmp	dh,9
	jbe	homa2
	mov	dh,9
homa2:	cmp	dh,2
	jae	homa1
	mov	dh,2
homa1:	mov	cs:_cy,dh
	jmp	hoo1
homat:	@CHANGESEGM	ds,WINDOWS
	mov	ah,0
	sub	ax,49
	mov	bx,ax
	mov	ah,m_omad_p[bx]
	mov	al,0
homat1:	cmp	al,"0"
	jb	homat9
	cmp	al,"9"
	ja	homat9
	jmp	homat
homat9:	@CHANGESEGM	ds,DATAS1
	mov	pliktro,ax
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	menu_omadvn
	mov	cs:_pomad,dx
	@POP
        ret
_pomad	label	word
	db	1,1
homad	endp

hfile	proc	near
	@PUSH
        @CHANGESEGM	DS,WINDOWS
        @SETWIND	menu_arxeia
	@SELECTWIND	menu_arxeia
	mov	dx,cs:_pfile
	push	dx
	jmp	hflt
hff1:	@INVERSE	cs:_cx,cs:_cy,33
	@WAITL
	@INVERSE	cs:_cx,cs:_cy,33
	push	dx
	call	plelex
	jnc	hfil0
	pop	dx
	@UPPERAX
	jmp	hfilt1
hfil0:	cmp	dx,0
	jne	hflt
	mov	ah,cs:_cy
	mov	al,cs:_cx
	inc	ax
	@CHANGESEGM	ds,DATAS1
	@TAKECURSWORD	strbuf,ax
	mov	al,strbuf
	pop	dx
	jmp	hfilt
hflt:	pop	ax
	mov	cs:_cx,3
	cmp	dh,10
	jbe	hfil2
	mov	dh,10
hfil2:	cmp	dh,2
	jae	hfil1
	mov	dh,2
hfil1:	mov	cs:_cy,dh
	jmp	hff1
hfilt:	@CHANGESEGM	ds,WINDOWS
	mov	ah,0
	sub	ax,49
	mov	bx,ax
	mov	ah,m_file_p[bx]
	mov	al,0
hfilt1:	cmp	al,"0"
	jb	hfilt9
	cmp	al,"9"
	ja	hfilt9
	jmp	hfilt
hfilt9:	@CHANGESEGM	ds,DATAS1
	mov	pliktro,ax
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	menu_arxeia
	mov	cs:_pfile,dx
	@POP
        ret
_pfile	label	word
	db	1,1
hfile	endp

plelex	proc	near
	@PUSH
	cmp	al,0
	je	pll9
	mov	ah,0
pll9:	mov	bx,offset cs:plpin
pll2:	cmp	word ptr cs:[bx],0
	je	pll0
	cmp	ax,cs:[bx]
	jne	pll1
	call	cs:[bx+2]
	mov	cs:_sdx,dx
	@POP
	mov	dx,cs:_sdx
	clc
	ret
pll1:	add	bx,4
	jmp	pll2
pll0:	@POP
	mov	dx,cs:_sdx
	stc
	ret
_sdx	dw	0
plpin	db	0,@UP_ARROW
	dw	offset	up00
	db	0,@DOWN_ARROW
	dw	offset	dn00
	db	0,@RIGHT_ARROW
	dw	offset	ri00
	db	0,@LEFT_ARROW
	dw	offset	le00
	db	0,@PG_UP
	dw	offset	pu00
	db	0,@PG_DOWN
	dw	offset	pd00
	db	0,@HOME
	dw	offset	ho00
	db	0,@END
	dw	offset	en00
	db	@ENTER,0
	dw	offset	ok00
	db	0,0
up00:	dec	dh
	jnz	up01
	inc	dh
up01:	ret
dn00:	inc	dh
	ret
ri00:	inc	dl
	ret
le00:	dec	dl
	jnz	le01
	inc	dl
le01:	ret
pu00:	mov	dh,1
	ret
pd00:	mov	dh,26
	ret
ho00:	mov	dh,1
	mov	dl,1
	ret
en00:	mov	dl,81
	mov	dh,26
	ret
ok00:	mov	dx,0
	stc
	ret
plelex	endp

code	ends
	end
