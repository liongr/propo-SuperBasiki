@WINDOWS = WINDOWS

INCLUDE	mylib.inc
INCLUDE	ems.inc
INCLUDE	keys.inc
INCLUDE	sdir.inc
INCLUDE	snaioxi.inc
INCLUDE	sindisk.inc

@TELOS=@TAB

DATAS1	SEGMENT	PUBLIC
;************************************
global	stili:byte:14
global	stili1:byte:100
global	ar_stilon:word:2
;************************************
global	file_basikes:byte
global	basikes_handle:word
global	mload:byte
global	mexit:byte
global	msave_1:byte
global	msave_2:byte
global	mneosys:byte
global	mprosu:byte
global	msbisim:byte
global	mektor:byte
global	eduesi:byte
global	scrattr:byte
global	editbuf:byte:55
global	edbufi:word
global	scrpou:byte
global	strbuf:byte:81
global	scrmsg:byte
global	genesis:byte
global	edaepl:byte
global	pliktro:word
global	edit0:byte
global	or_msg:byte
global	filename:byte:20
global	directory:byte
global	adr_point:word
global	free_oroi:word
DATAS1	ENDS

WINDOWS	SEGMENT	PUBLIC
global	wcright:byte
global	helpw:byte
global	menu_metrhtes:byte
global	menu_omadvn:byte
global	menu_arxeia:byte
global	w_nfile:byte
global	m_metr_p:byte
global	m_omad_p:byte
global	m_file_p:byte
WINDOWS	ENDS

CODE	SEGMENT	PUBLIC
global	copyright:proc
global	clearvar:proc
global	eis_filename:proc
global	ar_stilvn:proc
global	pin_elex:proc
global	apla_deltia:proc
global	eisag_nik:proc
global	dialogi_scr:proc
global	dialogi_dlt:proc
global	allagi_omad:proc
global	antigr_omad:proc
global	sbise_omad:proc
global	allagi_orivn:proc
global	sbise_simio:proc
global	sbise_uesi:proc
global	s_save:proc
global	s_load:proc
global	s_prosu_or:proc
global	s_sbise:proc
global	s_neo:proc
global	s_disk:proc
global	ektip_orvn:proc
global	ektip_inst:proc
global	telos_erg:proc
global	help:proc
global	hmetr:proc
global	homad:proc
global	hfile:proc
global	plhres:proc
global	basikh3:proc
global	basikh2:proc
global	basikh1:proc
global	monazi:proc
global	moria:proc
global	parast:proc
global	help:proc
global	exit0:proc
global	barast:proc
global	screen:proc
global	genitr:proc
CODE	ENDS
