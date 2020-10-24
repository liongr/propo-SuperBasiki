
INCLUDE	globals.inc

CODE	segment	public

	assume	cs:code,ds:datas1

ar_stilvn	proc	near
	mov	cx,13
	mov	bx,0
nxt2:	mov	stili1[bx],7
	inc	bx
	loop	nxt2
	mov	stili1[14],0
	mov	stili1[15],0
	mov	stili1[16],13
	mov	stili1[17],13

	mov	stili1[18],0

	mov	ar_stilon,0
	mov	ar_stilon[2],0
	call	genitr
	@LTOAN	ar_stilon,stili
	@WPRINT	1,1,stili
	@MBELL
	@PLHKTRO
	ret
ar_stilvn	endp

pin_elex	proc	near
		ret
pin_elex	endp

apla_deltia	proc	near
		ret
apla_deltia	endp

eisag_nik	proc	near
		ret
eisag_nik	endp

dialogi_scr	proc	near
		ret
dialogi_scr	endp

dialogi_dlt	proc	near
		ret
dialogi_dlt	endp

allagi_omad	proc	near
		ret
allagi_omad	endp

antigr_omad	proc	near
		ret
antigr_omad	endp

sbise_omad	proc	near
		ret
sbise_omad	endp

allagi_orivn	proc	near
		ret
allagi_orivn	endp

sbise_simio	proc	near
		ret
sbise_simio	endp

sbise_uesi	proc	near
		ret
sbise_uesi	endp

s_save		proc	near
		@PUSH
		call	eis_filename
		@POP
		ret
s_save		endp

s_load		proc	near
		@PUSH
		@NAIOXI mload,msave_1,msave_2
		jnc	sl0
		cmp	al,0
		je	sl1
sl2:		@POP
		ret
sl0:		call	s_save
		jc	sl2
sl1:		@DISKDIR filename,directory,mload
		@POP
		ret
s_load		endp

s_prosu_or	proc	near
		@PUSH
		@DISKDIR filename,directory,mprosu
		@POP
		ret
s_prosu_or	endp

s_sbise		proc	near
		ret
s_sbise		endp

s_neo		proc	near
		@PUSH
		@NAIOXI mneosys,msave_1,msave_2
		jnc	ts_n0
		cmp	al,0
		je	ts_n1
ts_n2:		@POP
		ret
ts_n0:		call	s_save
		jc	ts_n2
ts_n1:		call	clearvar
		call	screen
		call	copyright
		@POP
		ret
s_neo		endp

s_disk		proc	near
		@PUSH
		@INDISK	directory
		jc	sd00
		mov	directory,al
sd00:		@POP
		ret
s_disk		endp

ektip_orvn	proc	near
		ret
ektip_orvn	endp

ektip_inst	proc	near
		ret
ektip_inst	endp

telos_erg	proc	near
		@PUSH
		@NAIOXI mexit,msave_1,msave_2
		jnc	ter0
		cmp	al,0
		je	ter1
ter2:		@POP
		ret
ter0:		call	s_save
		jc	ter2
ter1:		@FILLSCR	" ",07h
		@EMS_FREE	cs:ems_handle
		@EXIT
		ret
telos_erg	endp

code	ends
	end
