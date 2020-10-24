
INCLUDE	globals.inc

DATAS1	SEGMENT	PUBLIC
;*********************************************
stili		db	14 dup(0)	;prepei na einai sthn arxh toy segment
stili1		db	100 dup(0)
ar_stilon	dw	2 dup (0)
;*********************************************
file_basikes	db	"C:BASIKES.TMP",0
basikes_handle	dw	0
eduesi	db	255,4,5,6,7,8,9,10,11,12,13,14,15,16,0
scrattr	db	07h
editbuf	db	100 dup(" ")
edbufi	dw	0
scrpou	db	0
strbuf	db	81 dup(0)
scrmsg	db	"  A",0,"  „—‘",0,"‹€ƒ€",0," O‘",0
scrup	db	"    ‹€ƒ„‘    „„„‚€‘ˆ€    €•„ˆ€    ƒˆ€”€  ",0
genesis	db	" SUPER -  - @1995 €€ƒ“Š‘ ŠE—Œˆƒ€‘",0
edaepl	db	@TELOS,0,".",0," ",0
	db	0,@UP_ARROW,0,@DOWN_ARROW,0,0
pliktro	dw	0
filename db	20 dup (0)
directory db	"C:*.*",0

msave_1	db	"TO ‘“‘’†‹€ ƒ„Œ „•„ˆ ‘—‡„ˆ ‘’Œ ƒˆ‘‰",0
msave_2	db	"Œ€ ’ ‘—‘—?",0
mload	db	"”’—‹€ ‘“‘’†‹€’‘",0
mexit	db	"TEŠ‘ „‚€‘ˆ€‘",0
mneosys	db	"NEO ‘“‘’†‹€",0
mprosu	db	"‘‡„‘† —Œ",0
msbisim	db	"‘†‘ˆ‹ €•„ˆ“",0
mektor	db	"EKTY—‘† —Œ",0
edit0	db	0,@ALT_F1
	dw	offset cs:copyright
	db	"0",0
	dw	offset cs:plhres
	db	"W",0
	dw	offset cs:basikh3
	db	"X",0
	dw	offset cs:basikh3
	db	"Z",0
	dw	offset cs:monazi
	db	"Y",0
	dw	offset cs:basikh2
	db	"B",0
	dw	offset cs:basikh3
	db	"O",0
	dw	offset cs:basikh2
	db	"Q",0
	dw	offset cs:barast
	db	"P",0
	dw	offset cs:barast
	db	"A",0
	dw	offset cs:barast
	db	"S",0
	dw	offset cs:barast
	db	"R",0
	dw	offset cs:barast
	db	"K",0
	dw	offset cs:barast
	db	"U",0
	dw	offset cs:barast
	db	"I",0
	dw	offset cs:barast
	db	"C",0
	dw	offset cs:barast
	db	"V",0
	dw	offset cs:barast
	db	"N",0
	dw	offset cs:barast
	db	"E",0
	dw	offset cs:barast
	db	"H",0
	dw	offset cs:parast
	db	"L",0
	dw	offset cs:barast
	db	0,@FUNC1
	dw	offset cs:help
	db	0,@FUNC2
	dw	offset cs:hmetr
	db	0,@FUNC3
	dw	offset cs:homad
	db	0,@FUNC4
	dw	offset cs:hfile
	db	0,@ALT_G
	dw	offset  ar_stilvn
	db	0,@ALT_C
	dw	offset  pin_elex
	db	0,@ALT_F
	dw	offset  apla_deltia
	db	0,@ALT_D
	dw	offset  dialogi_scr
	db	0,@ALT_8
	dw	offset  eisag_nik
	db	0,@ALT_Q
	dw	offset  dialogi_dlt
	db	0,@ALT_9
	dw	offset  allagi_omad
	db	0,@ALT_7
	dw	offset  antigr_omad
	db	0,@ALT_0
	dw	offset  sbise_omad
	db	0,@ALT_6
	dw	offset  allagi_orivn
	db	0,@ALT_5
	dw	offset  sbise_simio
	db	0,@ALT_4
	dw	offset  sbise_uesi
	db	0,@ALT_S
	dw	offset s_save
	db	0,@ALT_L
	dw	offset s_load
	db	0,@ALT_P
	dw	offset s_prosu_or
	db	0,@ALT_Z
	dw	offset s_sbise
	db	0,@ALT_N
	dw	offset s_neo
	db	0,@ALT_W
	dw	offset s_disk
	db	0,@ALT_K
	dw	offset ektip_orvn
	db	0,@ALT_R
	dw	offset ektip_inst
	db	0,@ALT_X
	dw	offset telos_erg
	dw	0,0

or_msg	db	0
	db	"L","€€‚—‚€     ",0
	db	"Q","‘“‹‹„’ˆ‰€   ",0
	db	"P","„Œ€ŠŠ€‚„‘    ",0
	db	"A","€‡ˆ‘‹€     ",0
	db	"S","€‘        ",0
	db	"R","ƒ“€ƒ„‘ ‘“Œ„•O",0
	db	"K","’ˆ€ƒES ‘“ŒEX",0
	db	"U","„€ŒAL ƒ“€ƒ„‘",0
	db	"I","„€ŒAL ’ˆ€ƒ„",0
	db	"C","‘“Œ„• ‘“‹‹„’",0
	db	"V","‹€ƒ„‘ „Œ€ŠŠ€",0
	db	"N","‹€ƒ„‘ 1•2   ",0
	db	"E","€Œ„‘       ",0
	db	0

adr_point	dw	0,0
free_oroi	dw	0,0

DATAS1	ENDS


WINDOWS	SEGMENT	PUBLIC

wcright	db	1,10,5,42,12,70h,2
	db	0
	db	"                              €‘ˆ‰†",0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	"       @1995  €€ƒ“Š‘ ŠE—Œˆƒ€‘",0
	db	"  €”ˆ„—‹„Œ ‘’Œ ”ˆŠ ’…—’…€‰† ƒ†‹†’†",0
	db	0

helpw	db	2,1,2,75,13,70h,1
	db      " 0 ..Œ„ Š†„‘           P ..„Œ€ŠŠ€‚„‘            Q ..‘“‹‹„’ˆ‰€",0
        db      " W ..€‘ˆ‰H ‘’†ŠH         V ..‹€ƒ„‘ „Œ€ŠŠ€‚—Œ     N ..‹€ƒ„‘ 1•2",0
        db      " O ..‹€ƒ„‘ ‘†‹„ˆ—Œ       R ..ƒ“€ƒ„‘ ‘“Œ„•‹„Œ„‘   K ..’ˆ€ƒ„‘ ‘“Œ„•‹„Œ„‘",0
	db	" X ..‘“Œ„•‹„Œ€           Z ..‹Œ€-…“‚€            Y ..‹€ƒ„‘ ‘“Œ„•‹„Œ—Œ",0
        db      " A ..B€‘ 1X2 - 102      S ..€‡ˆ‘‹€ 1X2 - 012   E ..€Œ„‘",0
        db      " H ..€€‘’€‘„ˆ‘          B ..’ˆŠ„‘ €€‘’€‘„ˆ‘  I ..„€Œ€Š†’.’ˆ€ƒ„‘",0
        db      " L ..€€‚—‚€ 1•2         C ..‘“Œ„•‹„Œ€ ‘“‹„’.   U ..„€Œ€Š†’.ƒ“€ƒ„‘",0
        db      " F ..‘“‹‹„’ˆ„‘           J ..A‡ˆ‘’.ˆŒ€‰€‘      D ..",0
	db	" T ..                     G ..                     M ..",0
	db	"Ä",1
	db	"        F2 ..E„„‚€‘ˆ„‘     F3 ..•„ˆˆ‘‹‘ ‹€ƒ—Œ     F4 ..€•„ˆ€",0
	db	"Í",1
        db      "                   @1995 SUPER -  , AAƒOOYŠO‘ ŠE—NIƒA‘",0

menu_metrhtes	db	3,24,5,38,11,70h,1
		db	0
		db	"    1 ..‹€ƒˆ†‘†          Alt ",0
		db	"    2 ..€ˆ‡‹‘ ‘’†Š—Œ       Alt G",0
		db	"    3 ..ˆŒ€‰„‘ „Š„‚•“      Alt C",0
		db	"    4 ..€Š€ ƒ„Š’ˆ€          Alt F",0
		db	"    5 ..ƒ„Š’ˆ€ Š†€‰ˆ€      Alt V",0
		db	"    6 ..EI‘€‚—‚† Œˆ‰†’ˆ€‘   Alt 8",0
		db	"    7 ..ƒˆ€Š‚† ‘’†Œ ‡Œ†   Alt D",0
		db	"    8 ..ƒˆ€Š‚† €Œ€ ƒ„Š’ˆ   Alt Q",0
		db	"    9 ..ƒˆ€Š‚† €•„ˆ—Œ      €lt A",0
		db	0

menu_omadvn	db	4,28,7,42,10,70h,1
		db	0
		db	"    1 ..€ŠŠ€‚† OMAƒ€‘            Alt 9",0
		db	"    2 ..€Œ’ˆ‚€”† ‹€ƒ€‘         Alt 7",0
		db	"    3 ..‘†‘ˆ‹ ‹€ƒ€‘           Alt 0",0
		db	"    4 ..€ŠŠ€‚† ˆ—Œ OY ‹€ƒ€‘ Alt 6",0
		db	"    5 ..‘†‘ˆ‹ ‘†‹„ˆ“ ‹€ƒ€‘   Alt 5",0
		db	"    6 ..‘†‘ˆ‹ ‡„‘„—Œ ‹€ƒ€‘    Alt 4",0
		db	"    7 ..‘†‹„ˆ ‘„ ‡„‘„ˆ‘ ‹€ƒ€‘  Alt 3",0
		db	"    8 ..AŠŠ€‚† ‘†‹„ˆ“ ‹€ƒ€‘    €lt 2",0
		db	0

menu_arxeia	db	5,26,7,37,11,70h,1
		db	0
		db	"    1 ..‘—‘ˆ‹ ‘“‘’†‹€’‘   Alt S",0
		db	"    2 ..”’—‹€ ‘“‘’†‹€’‘  Alt L",0
		db	"    3 ..‘‡„‘† —Œ       Alt P",0
		db	"    4 ..‘†‘ˆ‹ €•„ˆ“     Alt Z",0
		db	"    5 ..ŒEO ‘“‘’HMA         Alt N",0
		db	"    6 ..„ˆŠ‚† ƒˆ‘‰“      Alt W",0
		db	"    7 ..EKT“—‘† —Œ       Alt K",0
		db	"    8 ..EKTY—’†‘           Alt R",0
		db	"    9 ..’„Š‘ „‚€‘ˆ€‘      Alt X",0
		db	0

w_nfile		db	6,30,6,32,5,70h,1
		db	0
		db	"       ‘—‘ˆ‹  ‘“‘’†‹€’‘",0
		db	0
		db	"    ON‹€ €•„ˆ“ :",0
		db	0
		db	0

ldir	db	"C:*.*",0

m_metr_p	db	@ALT_O
		db	@ALT_G
		db	@ALT_C
		db	@ALT_F
		db	@ALT_V
		db	@ALT_8
		db	@ALT_D
		db	@ALT_Q
		db	@ALT_A

m_omad_p	db	@ALT_9
		db	@ALT_7
		db	@ALT_0
		db	@ALT_6
		db	@ALT_5
		db	@ALT_4

m_file_p	db	@ALT_S
		db	@ALT_L
		db	@ALT_P
		db	@ALT_Z
		db	@ALT_N
		db	@ALT_W
		db	@ALT_K
		db	@ALT_R
		db	@ALT_X
WINDOWS	ENDS
end
