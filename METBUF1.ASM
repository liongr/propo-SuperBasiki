
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
scrmsg	db	"  A",0,"  ",0,"",0," O",0
scrup	db	"                  ",0
genesis	db	" SUPER -  - @1995  E",0
edaepl	db	@TELOS,0,".",0," ",0
	db	0,@UP_ARROW,0,@DOWN_ARROW,0,0
pliktro	dw	0
filename db	20 dup (0)
directory db	"C:*.*",0

msave_1	db	"TO      ",0
msave_2	db	"  ?",0
mload	db	" ",0
mexit	db	"TE ",0
mneosys	db	"NEO ",0
mprosu	db	" ",0
msbisim	db	" ",0
mektor	db	"EKTY ",0
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
	db	"L","     ",0
	db	"Q","   ",0
	db	"P","    ",0
	db	"A","     ",0
	db	"S","        ",0
	db	"R"," O",0
	db	"K","ES EX",0
	db	"U","AL ",0
	db	"I","AL ",0
	db	"C"," ",0
	db	"V"," ",0
	db	"N"," 12   ",0
	db	"E","       ",0
	db	0

adr_point	dw	0,0
free_oroi	dw	0,0

DATAS1	ENDS


WINDOWS	SEGMENT	PUBLIC

wcright	db	1,10,5,42,12,70h,2
	db	0
	db	"                              ",0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	"       @1995   E",0
	db	"      ",0
	db	0

helpw	db	2,1,2,75,13,70h,1
	db      " 0 ..            P ..            Q ..",0
        db      " W ..H H         V ..      N .. 12",0
        db      " O ..        R ..    K .. ",0
	db	" X ..           Z ..-            Y .. ",0
        db      " A ..B 1X2 - 102      S .. 1X2 - 012   E ..",0
        db      " H ..          B ..   I ...",0
        db      " L .. 12         C .. .   U ...",0
        db      " F ..           J ..A.      D ..",0
	db	" T ..                     G ..                     M ..",0
	db	"Δ",1
	db	"        F2 ..E     F3 ..      F4 ..",0
	db	"Ν",1
        db      "                   @1995 SUPER -  , AAOOYO ENIA",0

menu_metrhtes	db	3,24,5,38,11,70h,1
		db	0
		db	"    1 ..          Alt ",0
		db	"    2 ..        Alt G",0
		db	"    3 ..       Alt C",0
		db	"    4 ..           Alt F",0
		db	"    5 ..       Alt V",0
		db	"    6 ..EI    Alt 8",0
		db	"    7 ..     Alt D",0
		db	"    8 ..     Alt Q",0
		db	"    9 ..       lt A",0
		db	0

menu_omadvn	db	4,28,7,42,10,70h,1
		db	0
		db	"    1 .. OMA            Alt 9",0
		db	"    2 ..          Alt 7",0
		db	"    3 ..            Alt 0",0
		db	"    4 ..  OY  Alt 6",0
		db	"    5 ..     Alt 5",0
		db	"    6 ..      Alt 4",0
		db	"    7 ..     Alt 3",0
		db	"    8 ..A      lt 2",0
		db	0

menu_arxeia	db	5,26,7,37,11,70h,1
		db	0
		db	"    1 ..    Alt S",0
		db	"    2 ..   Alt L",0
		db	"    3 ..        Alt P",0
		db	"    4 ..      Alt Z",0
		db	"    5 ..EO HMA         Alt N",0
		db	"    6 ..       Alt W",0
		db	"    7 ..EKT        Alt K",0
		db	"    8 ..EKTY           Alt R",0
		db	"    9 ..       Alt X",0
		db	0

w_nfile		db	6,30,6,32,5,70h,1
		db	0
		db	"         ",0
		db	0
		db	"    ON  :",0
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