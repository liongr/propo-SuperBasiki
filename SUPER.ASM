
@APO	= 40
@EOS	= 45
@OMADA	= 50

@YAPO	= 18
@YEOS	= 19
@YOMADA	= 20

@SIZE_ORO = 50

INCLUDE	globals.inc

stacks	segment	stack
	dw	500 dup(?)
stacks	ends

code	segment	public

	assume	cs:code

main	proc	far
	@STARTPRG
	@CHANGESEGM	ds,datas1
	@SETWINSEGM	WINDOWS
	@CLRCURS
	@KEYBRR	2,0
	@USERW	0,0

	@EMS_SETUP
	jc	ojo
	call	find_free

	call	clearvar
	call	screen
	call	copyright
	call	editor

ojo:	@EMS_FREE	cs:ems_handle
	@ENDPRG
	ret
main	endp

how_free	proc	near
	@PUSH
	@LTOAN	free_oroi,strbuf
	@WPRINT	73,24,strbuf
	@POP
 	ret
how_free	endp

find_free	proc	near
	@PUSH
	mov	ax,cs:ems_mem
	mov	dx,cs:ems_mem[2]
	mov	cx,1000
	div	cx
	push	dx
	xor	dx,dx
	mov	cx,@SIZE_ORO
	div	cx
	xor	dx,dx
	mov	cx,1024
	mul	cx
	mov	free_oroi,ax
	mov	free_oroi[2],dx
	xor	dx,dx
	pop	ax
	mov	cx,@SIZE_ORO
	div	cx
	add	free_oroi,ax
	adc	free_oroi[2],0
	@POP
	ret
find_free	endp

editor	proc	near
	@PUSH
edw:	call	how_free
	mov	ax,pliktro
	cmp	ax,0
	jne	edw1
	@CURSW	10,2
	@UPPERAX
edw1:	mov	pliktro,0
	lea	bx,edit0
	cmp	al,0
	je	alis0
	mov	ah,0
alis0:	cmp	word ptr [bx],0
	je	edw
	cmp	ax,[bx]
	jne	ed0al
	call	[bx+2]
	jmp	edw
ed0al:	add	bx,4
	jmp	alis0
	@POP
	ret
uesi	dw	0
editor	endp

basikh	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
	mov	cs:uesi,1
baserr:	call	editor3
	jc	bastaf
	call	chkedit
	jc	baserr
	cmp	editbuf[@APO]," "
	jne	basor
	@ITOAL	strbuf,2
	mov	al,[si]
	mov	editbuf[@EOS],al
	mov	al,[si+1]
	cmp	al,0
	jne	bas12
	mov	al," "
bas12:	mov	editbuf[@EOS+1],al
	mov	editbuf[@EOS+4],0
	@WPRINT	8,@YEOS,editbuf[@EOS]
basor:	call	editae
	jnc	bastaf
	jmp	baserr
bastaf:	cmp	editbuf[0]," "
	je	basesc
	call	chkedit
	jc	baserr
	cmp	editbuf[@APO]," "
	jne	bas14
	@ITOAL	strbuf,2
	mov	al,[si]
	mov	editbuf[@EOS],al
	mov	al,[si+1]
	cmp	al,0
	jne	bas13
	mov	al," "
bas13:	mov	editbuf[@EOS+1],al
	mov	editbuf[@EOS+4],0
	@WPRINT	9,@YEOS,editbuf[@EOS]
	cmp	editbuf[@APO]," "
	jne	bas14
	jmp	basor
bas14:	cmp	editbuf[@EOS]," "
	jne	basok
	jmp	basor
basok:	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
basesc:	@POP
	ret
basikh	endp

parast	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
	mov	cs:isposa,1
	mov	cs:isaster,1
	cmp	editbuf[3]," "
	jne	par0
	mov	cx,13
par1:	mov	byte ptr [bx],"*"
	add	bx,3
	loop	par1
	mov	cs:_edcx,10
	call	edb2scr
	mov	cs:uesi,1
par0:	mov	cs:isaster,1
	mov	eduesi[13],16
	call	editor3
	jc	partaf
	call	chkedit
	jc	par0
	mov	cs:uesi,1
parerr:	mov	cs:isaster,2
	mov	eduesi[13],0
	call	editor3
	jc	partaf
	call	chkedit
	jc	parerr
paror:	call	editae
	jnc	partaf
	jmp	par0
partaf:	cmp	editbuf[0]," "
	je	paresc
	mov	cs:isaster,0
	call	chkedit
	jc	par0
	mov	cs:isaster,2
	call	chkedit
	jc	parerr
	cmp	editbuf[@APO]," "
	jne	par14
	jmp	paror
par14:	cmp	editbuf[@EOS]," "
	jne	parok
	jmp	paror
parok:	mov	eduesi[13],16
	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
paresc:	mov	cs:isaster,0
	mov	eduesi[13],16
	@POP
	ret
parast	endp

barast	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
	mov	cs:isposa,1
	mov	cs:isaster,1
	cmp	editbuf[@APO]," "
	jne	bar0
	mov	cx,13
bar1:	mov	byte ptr [bx],"*"
	add	bx,3
	loop	bar1
	mov	cs:_edcx,10
	call	edb2scr
	mov	cs:uesi,1
bar0:	mov	cs:isaster,1
	mov	eduesi[13],16
	call	editor3
	jc	bartaf
	call	chkedit
	jc	bar0
baror:	call	editae
	jnc	bartaf
	jmp	bar0
bartaf:	cmp	editbuf[0]," "
	je	baresc
	mov	cs:isaster,0
	call	chkedit
	jc	bar0
	cmp	editbuf[@APO]," "
	jne	bar14
	jmp	baror
bar14:	cmp	editbuf[@EOS]," "
	jne	barok
	jmp	baror
barok:	mov	eduesi[13],16
	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
baresc:	mov	cs:isaster,0
	mov	eduesi[13],16
	@POP
	ret
barast	endp

monazi	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
	mov	cs:isposa,1
	mov	cs:uesi,1
mnzerr:	call	editor3
	jc	mnztaf
	call	chkedit
	jc	mnzerr
mnzor:	call	editmz
	jnc	mnztaf
	jmp	mnzerr
mnztaf:	cmp	editbuf[0]," "
	je	mnzesc
	call	chkedit
	jc	mnzerr
	cmp	editbuf[@APO]," "
	je	mnzor
mnzok:	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
mnzesc:	@POP
	ret
monazi	endp

plhres	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
	mov	cs:isposa,0
	mov	cs:uesi,1
plrerr:	call	editor3
	jc	plrtaf
	jmp	plrerr
plrtaf:	cmp	editbuf[0]," "
	je	plresc
	call	chkedit
	jc	plrerr
	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
plresc:	@POP
	ret
plhres	endp

basikh1	proc	near
	@PUSH
	call	basikh
	@POP
	ret
basikh1	endp

basikh2	proc	near
	@PUSH
	mov	cs:isposa,2
	call	basikh
	@POP
	ret
basikh2	endp

basikh3	proc	near
	@PUSH
	mov	cs:isposa,0
	call	basikh
	@POP
	ret
basikh3	endp

moria	proc	near
	@PUSH
	@CHANGESEGM	ds,DATAS1
	lea	bx,or_msg
mornxt:	cmp	[bx],al
	je	mor1
	add	bx,15
	jmp	mornxt
mor1:	mov	cs:_edcx,12
	inc	bx
	call	orkeim
	call	oria
	cmp	editbuf[0]," "
	je	moresc
	mov	al,scrpou
	mov	cs:_edcx,al
	add	al,5
	mov	scrpou,al
	call	edb2scr
moresc:	@POP
	ret
moria	endp

oria	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	lea	bx,editbuf
	mov	[bx],al
	@QPRINT	10,2,[bx],scrattr
	inc	bx
	mov	edbufi,bx
orerr:	call	editae
	jnc	ortaf
	jmp	orerr
ortaf:	@POP
	ret
oria	endp

editor3	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	@STARTRND	165,50
	cmp	cs:isaster,1
	je	isast31
	cmp	cs:isaster,2
	je	isast32
	jmp	isnast3
isast31:
	mov	cs:_cx,9
	mov	cs:_len,1
	jmp	ed3arx
isast32:
	mov	cs:_cx,11
	mov	cs:_len,1
	jmp	ed3arx
isnast3:
	mov	cs:_cx,9
	mov	cs:_len,3
ed3arx:	mov	bx,cs:uesi
ed31:	mov	al,eduesi[bx]
	cmp	al,255
	jne	ed39
	inc	bx
	jmp	ed31
ed39:	cmp	al,0
	jne	ed38
	dec	bx
	call	is3tel
ed38:	mov	cs:_cy,al
	call	cursp
	cmp	al,0
	je	ed37
	mov	ah,0
ed37:	mov	si,offset cs:_edit3
ed3ep:	cmp	word ptr cs:[si],0
	je	ed31
	cmp	cs:[si],ax
	jne	ed3al
	call	cs:[si+2]
	inc	bx
	jmp	ed31
ed3al:	add	si,4
	jmp	ed3ep
ed3taf:	@ENDRND
	@POP
	stc
	ret

is3up:	dec	bx
	dec	bx
	ret

is3dn:	ret

is3taf:	pop	ax
	jmp	ed3taf

is3tel:	pop	ax
	mov	cs:uesi,bx
	@ENDRND
	@POP
	clc
	ret

is3esc:	pop	ax
	@ZEROBBUF	editbuf,100," "
	mov	eduesi[13],16
	mov	cs:_edcx,10
	call	edb2scr
	jmp	ed3taf

isken:	mov	cs:_sim1," "
	mov	cs:_sim2," "
	mov	cs:_sim3," "
	call	ed3do
	ret

ispast:	cmp	cs:isaster,1
	je	ispst1
	dec	bx
	ret
ispst1:	mov	cs:_sim1,"*"
	call	ed3do
	ret

is31:	cmp	cs:isaster,1
	jne	is331
	dec	bx
	ret
is331:	mov	cs:_sim1,"1"
	mov	cs:_sim2," "
	mov	cs:_sim3," "
	call	ed3do
	ret

is32:	cmp	cs:isaster,1
	jne	is332
	dec	bx
	ret
is332:	mov	cs:_sim1,"2"
	mov	cs:_sim2," "
	mov	cs:_sim3," "
	call	ed3do
	ret

is33:	cmp	cs:isaster,1
	jne	is333
	dec	bx
	ret
is333:	mov	cs:_sim1,"X"
	mov	cs:_sim2," "
	mov	cs:_sim3," "
	call	ed3do
	ret

is34:	cmp	cs:isposa,1
	jne	is41
	dec	bx
	ret
is41:	mov	cs:_sim1,"1"
	mov	cs:_sim2,"2"
	mov	cs:_sim3," "
	call	ed3do
	ret

is35:	cmp	cs:isposa,1
	jne	is51
	dec	bx
	ret
is51:	mov	cs:_sim1,"X"
	mov	cs:_sim2,"2"
	mov	cs:_sim3," "
	call	ed3do
	ret

is36:	cmp	cs:isposa,1
	jne	is61
	dec	bx
	ret
is61:	mov	cs:_sim1,"1"
	mov	cs:_sim2,"X"
	mov	cs:_sim3," "
	call	ed3do
	ret

is37:	cmp	cs:isposa,0
	je	is71
	dec	bx
	ret
is71:	mov	cs:_sim1,"1"
	mov	cs:_sim2,"X"
	mov	cs:_sim3,"2"
	call	ed3do
	ret

isrnd:	@RND
	cmp	al,30
	ja	rnd0
	jmp	is31
rnd0:	cmp	al,60
	ja	rnd1
	jmp	is32
rnd1:	cmp	al,90
	ja	rnd2
	jmp	is33
rnd2:	cmp	al,110
	ja	rnd3
	jmp	is34
rnd3:	cmp	al,130
	ja	rnd4
	jmp	is35
rnd4:	cmp	al,150
	ja	rnd5
	jmp	is36
rnd5:	jmp	is37

ed3do:	cmp	cs:isaster,0
	je	isnast
	jmp	isast
isnast:	@QPRINT	9,cs:_cy,cs:_sim1,scrattr
	@QPRINT	10,cs:_cy,cs:_sim2,scrattr
	@QPRINT	11,cs:_cy,cs:_sim3,scrattr
	push	bx
	mov	ax,bx
	dec	ax
	mov	cl,3
	mul	cl
	add	ax,edbufi
	mov	bx,ax
	mov	al,cs:_sim1
	mov	[bx],al
	mov	al,cs:_sim2
	mov	[bx+1],al
	mov	al,cs:_sim3
	mov	[bx+2],al
	pop	bx
	ret

isast:	cmp	cs:isaster,1
	je	isast1
	@QPRINT	11,cs:_cy,cs:_sim1,scrattr
	push	bx
	mov	ax,bx
	dec	ax
	mov	cl,3
	mul	cl
	add	ax,edbufi
	mov	bx,ax
	mov	al,cs:_sim1
	mov	[bx+2],al
	pop	bx
	ret

isast1:	@QPRINT	9,cs:_cy,cs:_sim1,scrattr
	push	bx
	mov	ax,bx
	dec	ax
	mov	cl,3
	mul	cl
	add	ax,edbufi
	mov	bx,ax
	mov	al,cs:_sim1
	mov	[bx],al
	pop	bx
	ret
_sim1	db	0
_sim2	db	0
_sim3	db	0
isposa	db	0
isaster	db	0
_edit3	db	"1",0
	dw	offset	cs:is31
	db	"2",0
	dw	offset	cs:is32
	db	"3",0
	dw	offset	cs:is33
	db	"4",0
	dw	offset	cs:is34
	db	"5",0
	dw	offset	cs:is35
	db	"6",0
	dw	offset	cs:is36
	db	"*",0
	dw	offset	cs:ispast
	db	@ENTER,0
	dw	offset	cs:ispast
	db	"7",0
	dw	offset	cs:is37
	db	"0",0
	dw	offset	cs:isrnd
	db	" ",0
	dw	offset	cs:isken
	db	@TELOS,0
	dw	offset	cs:is3taf
	db	".",0
	dw	offset	cs:is3tel
	db	@ESCAPE,0
	dw	offset	cs:is3esc
	db	0,@UP_ARROW
	dw	offset	cs:is3up
	db	0,@DOWN_ARROW
	dw	offset	cs:is3dn
	db	@ENTER,0
	dw	offset	cs:is3dn
	dw	0
editor3	endp

editmz	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
edmz0:	mov	editbuf[@APO+4],0
	@CURSW	8,@YAPO
	@UPPERAX
	cmp	al,@ENTER
	jne	edmzne
	jmp	edmz1
edmzne:	cmp	al,"M"
	jne	emz01
	mov	editbuf[@APO],"M"
	jmp	emz02
emz01:	cmp	al,"Z"
	je	emz03
	jmp	emz02
emz03:	mov	editbuf[@APO],"Z"
emz02:	@QPRINT	8,@YAPO,editbuf[@APO],scrattr
	cmp	ah,@DOWN_ARROW
	jne	edmzd1
	jmp	edmz1
edmzd1:	cmp	ah,@UP_ARROW
	jne	edmzu1
	jmp	edmztc
edmzu1:	cmp	al,@ESCAPE
	jne	edmze1
	jmp	edmzc1
edmze1:	cmp	al,@TELOS
	jne	edmzt1
	jmp	edmzt
edmzt1:	cmp	al,"."
	jne	edmz10
	jmp	edmztc
edmz10:	jmp	edmz0
edmz1:	mov	editbuf[@OMADA+4],0
	@WINPUTNUMBER	8,@YOMADA,editbuf[@OMADA],edaepl
	jnc	edmz2
	cmp	ah,@UP_ARROW
	jne	edmzu2
	jmp	edmz0
edmzu2:	cmp	al," "
	jne	edmzd2
	mov	editbuf[@OMADA]," "
	mov	editbuf[@OMADA+1]," "
	mov	editbuf[@OMADA+2]," "
	mov	editbuf[@OMADA+3]," "
	jmp	edmz1
edmzd2:	cmp	al,@ESCAPE
	jne	edmze2
	jmp	edmzc1
edmze2:	cmp	al,@TELOS
	jne	edmzt2
	jmp	edmzt
edmzt2:	cmp	al,"."
	jne	edmz2
	jmp	edmztc
edmz2:	jmp	edmz1

edmzt:	call	echkmz
	jnc	edmzt3
	jmp	edmz0
edmzt3:	@POP
	clc
	ret

edmztc:	@POP
	stc
	ret

edmzc1:	@ZEROBBUF	editbuf,100," "
	mov	eduesi[13],16
	mov	cs:_edcx,10
	call	edb2scr
	@POP
	clc
	ret

editmz	endp

echkmz	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	cmp	editbuf[@APO]," "
	jne	edmz90
	@POP
	stc
	ret
edmz90:	mov	al,editbuf[@OMADA]
	cmp	al," "
	jne	edmzx1
	mov	editbuf[@OMADA],"1"
	@QPRINT	8,@YOMADA,"1",scrattr
edmzx1:	@POP
	clc
	ret
echkmz	endp

editae	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
edae0:	mov	editbuf[@APO+4],0
	@WINPUTNUMBER	8,@YAPO,editbuf[@APO],edaepl
	jnc	edae1
	cmp	ah,@UP_ARROW
	jne	edaeu1
	jmp	edaetc
edaeu1:	cmp	al," "
	jne	edaed1
	mov	editbuf[@APO]," "
	mov	editbuf[@APO+1]," "
	mov	editbuf[@APO+2]," "
	mov	editbuf[@APO+3]," "
	jmp	edae0
edaed1:	cmp	al,@ESCAPE
	jne	edaee1
	jmp	edaec1
edaee1:	cmp	al,@TELOS
	jne	edaet1
	jmp	edaet
edaet1:	cmp	al,"."
	jne	edae1
	jmp	edaetc

edae1:	mov	editbuf[@EOS+4],0
	@WINPUTNUMBER	8,@YEOS,editbuf[@EOS],edaepl
	jnc	edae2
	cmp	ah,@UP_ARROW
	jne	edaeu2
	jmp	edae0
edaeu2:	cmp	al," "
	jne	edaed2
	mov	editbuf[@EOS]," "
	mov	editbuf[@EOS+1]," "
	mov	editbuf[@EOS+2]," "
	mov	editbuf[@EOS+3]," "
	jmp	edae1
edaed2:	cmp	al,@ESCAPE
	jne	edaee2
	jmp	edaec1
edaee2:	cmp	al,@TELOS
	jne	edaet2
	jmp	edaet
edaet2:	cmp	al,"."
	jne	edae2
	jmp	edaetc

edae2:	mov	editbuf[@OMADA+4],0
	@WINPUTNUMBER	8,@YOMADA,editbuf[@OMADA],edaepl
	jnc	edae4
	cmp	ah,@UP_ARROW
	jne	edaeu5
	jmp	edae1
edaeu5:	cmp	al," "
	jne	edaed5
	mov	editbuf[@OMADA]," "
	mov	editbuf[@OMADA+1]," "
	mov	editbuf[@OMADA+2]," "
	mov	editbuf[@OMADA+3]," "
	jmp	edae4
edaed5:	cmp	al,@ESCAPE
	jne	edaee5
	jmp	edaec1
edaee5:	cmp	al,@TELOS
	jne	edaet5
	jmp	edaet
edaet5:	cmp	al,"."
	jne	edae4
	jmp	edaetc

edae4:	jmp	edae2
edaet:	call	echkae
	jnc	edaet51
	jmp	edae0
edaet51:	@POP
	clc
	ret

edaetc:	@POP
	stc
	ret

edaec1:	@ZEROBBUF	editbuf,100," "
	mov	eduesi[13],16
	mov	cs:_edcx,10
	call	edb2scr
	@POP
	clc
	ret
editae	endp

echkae	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	cmp	editbuf[@APO]," "
	je	edox90
	cmp	editbuf[@EOS]," "
	jne	edox91
edox90:	@POP
	stc
	ret
edox91:	cmp	editbuf[@OMADA]," "
	jne	edom1
	mov	editbuf[@OMADA],"1"
	@QPRINT	9,@YOMADA,"1",scrattr
edom1:	@POP
	clc
	ret
echkae	endp

chkedit	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	cmp	cs:isaster,2
	je	chke18
	lea	bx,editbuf
	inc	bx
	mov	cx,13
	xor	ax,ax
	mov	dl," "
chke2:	cmp	[bx],dl
	je	chke1
	inc	ax
chke1:	add	bx,3
	loop	chke2
	mov	cs:_met0,ax
	jmp	chke32

chke18:	mov	cs:_met0,0
	lea	bx,editbuf
	inc	bx
	inc	bx
	inc	bx
	mov	dl," "
	cmp	[bx],dl
	je	chke32
	mov	cs:_met0,1
chke32:	@POP
	mov	ax,cs:_met0
	cmp	ax,0
	jne	chke3
	stc
	ret
chke3:	clc
	ret
_met0	dw	0
chkedit	endp

cursp	proc	near
	@PUSH
	@INVERSE	1,cs:_cy,6
	@INVERSE	14,cs:_cy,64
cursw:	@INVERSE	cs:_cx,cs:_cy,cs:_len
	@WAIT	2
	pushf
	push	ax
	@INVERSE	cs:_cx,cs:_cy,cs:_len
	pop	ax
	popf
	jc	curst
	@WAIT	2
	jc	curst
	jmp	cursw
curst:	@INVERSE	1,cs:_cy,6
	@INVERSE	14,cs:_cy,64
	mov	cs:_plik,ax
	@POP
	mov	ax,cs:_plik
	@UPPERAX
	ret
_plik	dw	0
_len	db	0
cursp	endp

orkeim	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
	mov	cx,13
	lea	si,eduesi
	inc	si
orkep:	@QPRINT	cs:_edcx,[si],[bx],scrattr
	inc	si
	inc	bx
	loop	orkep
orktl:	@POP
	ret
orkeim	endp

edb2scr	proc	near
	@PUSH
	@CHANGESEGM	ds,datas1
edb2s2:	lea	si,editbuf
	mov	al,cs:_edcx
	push	ax
	@QPRINT	cs:_edcx,2,[si],scrattr
	mov	al,[si]
	lea	bx,or_msg
edb2s4:	cmp	byte ptr [bx],0
	je	edb2s7
	cmp	[bx],al
	je	edb2s5
	add	bx,15
	jmp	edb2s4
edb2s5:	inc	bx
	call	orkeim
	dec	cs:_edcx
	jmp	edb2s6

edb2s7:	dec	cs:_edcx
	lea	bx,eduesi
	inc	bx
	mov	cx,13
edb2s1:	inc	si
	mov	al,[bx]
	@QPRINT	cs:_edcx,al,[si],scrattr
	inc	si
	inc	cs:_edcx
	mov	al,[bx]
	@QPRINT	cs:_edcx,al,[si],scrattr
	inc	si
	inc	cs:_edcx
	mov	al,[bx]
	@QPRINT	cs:_edcx,al,[si],scrattr
	inc	bx
	dec	cs:_edcx
	dec	cs:_edcx
	loop	edb2s1
edb2s6:	dec	cs:_edcx
	mov	editbuf[@APO+4],0
	@WPRINT	cs:_edcx,@YAPO,editbuf[@APO]
	mov	editbuf[@EOS+4],0
	@WPRINT	cs:_edcx,@YEOS,editbuf[@EOS]
	mov	editbuf[@OMADA+4],0
	@WPRINT	cs:_edcx,@YOMADA,editbuf[@OMADA]
	inc	cs:_edcx
	pop	ax
	cmp	al,10
	je	edb2s3
	call	edb2mem
	@ZEROBBUF	editbuf,100," "
	mov	cs:_edcx,10
	jmp	edb2s2
edb2s3:	@POP
	ret
_edcx	db	0
edb2scr	endp

edb2mem	proc	near
	@PUSH
	@ADR2EMS	adr_point
	mov	di,ax
	mov	ax,cs:ems_win
	mov	es,ax
	mov	si,offset editbuf
	mov	al,[si]
	mov	es:[di],al
	inc	si
	inc	di
	mov	cx,13
edb2m1:	call	sim2cod
	mov	es:[di],al
	inc	di
	add	si,3
	loop	edb2m1
	@ATOL	editbuf[@APO]
	mov	es:[di][0],ax
	mov	es:[di][2],dx
	add	di,4
	@ATOL	editbuf[@EOS]
	mov	es:[di][0],ax
	mov	es:[di][2],dx
	add	di,4
	@ATOL	editbuf[@OMADA]
	mov	es:[di][0],ax
	mov	es:[di][2],dx

	add	adr_point,@SIZE_ORO
	adc	adr_point,0

	sub	free_oroi,1
	sbb	free_oroi[2],0

	@POP
	ret
edb2mem	endp

sim2cod	proc	near	;[si],[si+1],[si+2]->3 bytes (1x2) ,ax->1 byte
	@PUSHAX
	mov	ax,0
	mov	cx,3
	cmp	byte ptr [si],"*"
	jne	simal
	mov	ax,9
	@POPAX
	ret
simal:	cmp	byte ptr [si],"2"
	jne	sim2
	or	al,00000100b
	jmp	alsim
sim2:	cmp	byte ptr [si],"X"
	jne	simx
	or	al,00000010b
	jmp	alsim
simx:	cmp	byte ptr [si],"1"
	jne	sim1
	or	al,00000001b
	jmp	alsim
sim1:
alsim:	inc	si
	loop	simal
	@POPAX
	ret
sim2cod	endp

cod2sim	proc	near	;al->1 byte , [si],[si+1],[si+2]->3 bytes (1x2)
	@PUSH
	mov	bx,0
	mov	cx,9
sim01:	cmp	al,cs:psim[bx]
	je	brika
	add	bx,4
	loop	sim01
	@EXIT
brika:	mov	al,cs:psim[bx][1]
	mov	[si][0],al
	mov	al,cs:psim[bx][2]
	mov	[si][1],al
	mov	al,cs:psim[bx][3]
	mov	[si][2],al
	@POP
	ret
psim	db	0,"   "
	db	1,"1  "
	db	2,"X  "
	db	3,"1X "
	db	4,"2  "
	db	5,"12 "
	db	6,"1X "
	db	7,"1X2"
	db	9,"*  "
cod2sim	endp

screen  proc    near
	@PUSH
	@CHANGESEGM	ds,datas1
	@FILLSCR	" ",scrattr
	@SELECTWI	0
	mov     cx,13
	mov     cs:_cx,4
	mov	cs:_cy,4
	mov	ax,1
scr1:	@ITOA	strbuf,2
	@WPRINT	cs:_cx,cs:_cy,strbuf
	inc     cs:_cy
	inc	ax
	loop    scr1
	@WPRINT	1,2,scrmsg[18]
	@WPRINT	1,18,scrmsg
	@WPRINT	1,19,scrmsg[6]
	@WPRINT	1,20,scrmsg[12]
	mov     cx,78
	mov     cs:_cx,0
scr3:	@QPRINT	cs:_cx,1,205,scrattr
	@QPRINT	cs:_cx,3,196,scrattr
	@QPRINT	cs:_cx,17,196,scrattr
	@QPRINT	cs:_cx,21,196,scrattr
	inc     cs:_cx
	loop    scr300
	jmp	malak
scr300:	jmp	scr3
malak:	mov     cx,20
	mov     cs:_cy,1
scr6:	cmp	cs:_cy,1
	je	scr62
	mov	cs:_2prt,179
	jmp	scr63
scr62:	mov	cs:_2prt,209	;216
scr63:	@QPRINT	0,cs:_cy,cs:_2prt,scrattr
	@QPRINT	7,cs:_cy,cs:_2prt,scrattr
	@QPRINT	13,cs:_cy,219,scrattr
	inc     cs:_cy
	loop    scr6
scr67:	mov	cx,13
	mov	cs:_cx,18
scr8:	mov	cs:_cy,1
	push	cx
	mov	cx,20
scr7:	cmp	cs:_cy,1
	je	scr72
	cmp	cs:_cy,3
	je	scr74
	cmp	cs:_cy,17
	je	scr74
	mov	cs:_2prt,179
	jmp	scr73
scr74:	mov	cs:_2prt,197
	jmp	scr73
scr72:	mov	cs:_2prt,209
	jmp	scr73
scr73:	@QPRINT	cs:_cx,cs:_cy,cs:_2prt,scrattr
	inc	cs:_cy
	loop	scr7
	add	cs:_cx,5
	pop	cx
	loop	scr8

	mov	cx,13
	mov	cs:_cx,18
scr81:	@QPRINT	cs:_cx,21,193,scrattr
	add	cs:_cx,5
	loop	scr81

	@QPRINT	7,21,193,scrattr
	@QPRINT	13,21,223,scrattr
	@QPRINT	0,1,213,scrattr
	@QPRINT	78,1,184,scrattr
	@QPRINT	7,3,197,scrattr
	@QPRINT	7,17,197,scrattr
	@QPRINT	0,3,195,scrattr
	@QPRINT	78,3,180,scrattr
	@QPRINT	0,17,195,scrattr
	@QPRINT	78,17,180,scrattr
	@QPRINT	78,21,217,scrattr
	@QPRINT	0,21,192,scrattr
	@QPRINT	13,18,221,scrattr
	@QPRINT	13,19,221,scrattr
	@QPRINT	13,20,221,scrattr
	@INVERSE 0,24,80
	@POP
	ret
_cx	db	0
_cy	db	0
_2prt	db	0
screen  endp

clearvar proc	near
	@PUSH
	mov	scrpou,16
	@POP
	ret
clearvar endp

code	ends
	end	main
