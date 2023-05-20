;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Parallax
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _DMA
	.globl _memcpy
	.globl _cpu_fast
	.globl _set_bkg_palette_entry
	.globl _set_bkg_submap
	.globl _set_bkg_data
	.globl _set_interrupts
	.globl _joypad
	.globl _add_VBL
	.globl _halfTileY
	.globl _scrollYCompare2
	.globl _scrollYCompare
	.globl _scrollY
	.globl _scrollXCompare
	.globl _scrollX
	.globl _dynamicMapAddress2
	.globl _dynamicMapAddress
	.globl _YVelocity
	.globl _isAHeld
	.globl _tileAddress3
	.globl _tileAddress2
	.globl _tileAddress
	.globl _shadowMapAddress
	.globl _spriteMapAddress
	.globl _downshiftedSpriteY
	.globl _downshiftedSpriteX
	.globl _spriteY
	.globl _spriteX
	.globl _lastSpriteY
	.globl _lastSpriteX
	.globl _getTile
	.globl _joyState
	.globl _timer2
	.globl _timer
	.globl _GraphicsOffsetX
	.globl _GraphicsOffset
	.globl _scrollLookupTable
	.globl _DMAInit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_GraphicsOffset::
	.ds 1
_GraphicsOffsetX::
	.ds 1
_timer::
	.ds 1
_timer2::
	.ds 1
_joyState::
	.ds 1
_getTile::
	.ds 1
_lastSpriteX::
	.ds 2
_lastSpriteY::
	.ds 2
_spriteX::
	.ds 2
_spriteY::
	.ds 2
_downshiftedSpriteX::
	.ds 2
_downshiftedSpriteY::
	.ds 1
_spriteMapAddress::
	.ds 2
_shadowMapAddress::
	.ds 2
_tileAddress::
	.ds 2
_tileAddress2::
	.ds 2
_tileAddress3::
	.ds 2
_isAHeld::
	.ds 1
_YVelocity::
	.ds 1
_dynamicMapAddress::
	.ds 2
_dynamicMapAddress2::
	.ds 2
_scrollX::
	.ds 2
_scrollXCompare::
	.ds 2
_scrollY::
	.ds 2
_scrollYCompare::
	.ds 2
_scrollYCompare2::
	.ds 2
_halfTileY::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;Parallax.c:64: void main() NONBANKED
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-5
;Parallax.c:66: if (DEVICE_SUPPORTS_COLOR)
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;Parallax.c:67: cpu_fast();
	call	_cpu_fast
	jr	00106$
;Parallax.c:70: while(1)
00102$:
	jr	00102$
00106$:
;Parallax.c:74: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;Parallax.c:75: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;Parallax.c:76: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;Parallax.c:77: set_bkg_palette_entry(0,0,TreeBaseTilesCGBPal0c0);
	ld	de, #0x4720
	push	de
	xor	a, a
	rrca
	push	af
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:78: set_bkg_palette_entry(0,1,TreeBaseTilesCGBPal0c1);
	ld	de, #0x5260
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:79: set_bkg_palette_entry(0,2,TreeBaseTilesCGBPal0c2);
	ld	de, #0x40e1
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:80: set_bkg_palette_entry(0,3,TreeBaseTilesCGBPal0c3);
	ld	de, #0x0000
	push	de
	ld	hl, #0x300
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:81: set_bkg_palette_entry(1,0,TreeBaseTilesCGBPal1c0);
	ld	de, #0x77ed
	push	de
	ld	hl, #0x01
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:82: set_bkg_palette_entry(1,1,TreeBaseTilesCGBPal1c1);
	ld	de, #0x4b80
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:83: set_bkg_palette_entry(1,2,TreeBaseTilesCGBPal1c2);
	ld	de, #0x31a1
	push	de
	ld	hl, #0x201
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:84: set_bkg_palette_entry(1,3,TreeBaseTilesCGBPal1c3);
	ld	de, #0x0000
	push	de
	ld	hl, #0x301
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:85: set_bkg_palette_entry(2,0,TreeBaseTilesCGBPal2c0);
	ld	de, #0x17bc
	push	de
	ld	hl, #0x02
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:86: set_bkg_palette_entry(2,1,TreeBaseTilesCGBPal2c1);
	ld	de, #0x22e7
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:87: set_bkg_palette_entry(2,2,TreeBaseTilesCGBPal2c2);
	ld	de, #0x19c4
	push	de
	ld	hl, #0x202
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:88: set_bkg_palette_entry(2,3,TreeBaseTilesCGBPal2c3);
	ld	de, #0x14e0
	push	de
	ld	hl, #0x302
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:89: set_bkg_palette_entry(3,0,TreeBaseTilesCGBPal3c0);
	ld	de, #0x17bc
	push	de
	ld	hl, #0x03
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:90: set_bkg_palette_entry(3,1,TreeBaseTilesCGBPal3c1);
	ld	de, #0x22e7
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:91: set_bkg_palette_entry(3,2,TreeBaseTilesCGBPal3c2);
	ld	de, #0x19c4
	push	de
	ld	hl, #0x203
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:92: set_bkg_palette_entry(3,3,TreeBaseTilesCGBPal3c3);
	ld	de, #0x14e0
	push	de
	ld	hl, #0x303
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:93: set_bkg_palette_entry(4,0,TreeBaseTilesCGBPal4c0);
	ld	de, #0x17bc
	push	de
	ld	hl, #0x04
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:94: set_bkg_palette_entry(4,1,TreeBaseTilesCGBPal4c1);
	ld	de, #0x22e7
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:95: set_bkg_palette_entry(4,2,TreeBaseTilesCGBPal4c2);
	ld	de, #0x19c4
	push	de
	ld	hl, #0x204
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:96: set_bkg_palette_entry(4,3,TreeBaseTilesCGBPal4c3);
	ld	de, #0x14e0
	push	de
	ld	hl, #0x304
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:97: set_bkg_palette_entry(5,0,TreeBaseTilesCGBPal5c0);
	ld	de, #0x17bc
	push	de
	ld	hl, #0x05
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:98: set_bkg_palette_entry(5,1,TreeBaseTilesCGBPal5c1);
	ld	de, #0x22e7
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:99: set_bkg_palette_entry(5,2,TreeBaseTilesCGBPal5c2);
	ld	de, #0x19c4
	push	de
	ld	hl, #0x205
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:100: set_bkg_palette_entry(5,3,TreeBaseTilesCGBPal5c3);
	ld	de, #0x14e0
	push	de
	ld	hl, #0x305
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:101: set_bkg_palette_entry(6,0,TreeBaseTilesCGBPal6c0);
	ld	de, #0x17bc
	push	de
	ld	hl, #0x06
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:102: set_bkg_palette_entry(6,1,TreeBaseTilesCGBPal6c1);
	ld	de, #0x22e7
	push	de
	ld	hl, #0x106
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:103: set_bkg_palette_entry(6,2,TreeBaseTilesCGBPal6c2);
	ld	de, #0x19c4
	push	de
	ld	hl, #0x206
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:104: set_bkg_palette_entry(6,3,TreeBaseTilesCGBPal6c3);
	ld	de, #0x14e0
	push	de
	ld	hl, #0x306
	push	hl
	call	_set_bkg_palette_entry
	add	sp, #4
;Parallax.c:105: set_bkg_data(10,2,TreeBaseTiles);
	ld	de, #_TreeBaseTiles
	push	de
	ld	hl, #0x20a
	push	hl
	call	_set_bkg_data
	add	sp, #4
;Parallax.c:106: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
;Parallax.c:107: set_bkg_submap(0,0,32,32,FGMapPLN1,32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	de, #_FGMapPLN1
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_submap
	add	sp, #7
;Parallax.c:108: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG + 0), a
;Parallax.c:109: LYC_REG = 143;
	ld	a, #0x8f
	ldh	(_LYC_REG + 0), a
;Parallax.c:120: __endasm;
	ld	hl, #_DMAInit
	ld	c, #0x51
	 100$:
	ld	a, (hl+)
	.db	#0xE2;
	inc	c
	ld	a, c
	cp	a, #0x55
	jp	nz, 100$
;Parallax.c:121: memcpy(_RAMBANK + 0x410,ForegroundTiles, 256);
	xor	a, a
	inc	a
	push	af
	ld	de, #_ForegroundTiles
	push	de
	ld	de, #(__RAMBANK + 1040)
	push	de
	call	_memcpy
	add	sp, #6
;Parallax.c:122: while(dynamicMapAddress < 1024)
00107$:
	ld	hl, #_dynamicMapAddress
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	sub	a, #0x04
	jr	NC, 00109$
;Parallax.c:124: _RAMBANK[0x740 + dynamicMapAddress] = (FGMap[dynamicMapAddress]) - 1;
	ld	hl,#0x0740 + __RAMBANK
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, #<(_FGMapPLN0)
	ld	hl, #_dynamicMapAddress
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, #>(_FGMapPLN0)
	adc	a, (hl)
;Parallax.c:125: dynamicMapAddress ++;
	dec	hl
	ld	d, a
	ld	a, (de)
	dec	a
	ld	(bc), a
	inc	(hl)
	jr	NZ, 00107$
	inc	hl
	inc	(hl)
	jr	00107$
00109$:
;Parallax.c:127: dynamicMapAddress = 0;
	xor	a, a
	ld	hl, #_dynamicMapAddress
	ld	(hl+), a
	ld	(hl), a
;Parallax.c:129: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;Parallax.c:130: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;Parallax.c:131: STAT_REG = 0xC5;
	ld	a, #0xc5
	ldh	(_STAT_REG + 0), a
;Parallax.c:132: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;Parallax.c:133: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;Parallax.c:134: add_VBL(DMA);
	ld	de, #_DMA
	push	de
	call	_add_VBL
	pop	hl
;Parallax.c:136: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
;Parallax.c:143: __endasm;
	ld	sp,#0xD000
	jp	232$
	ret
	 232$:
;Parallax.c:145: while(1)
00166$:
;Parallax.c:147: if (timer2 == 1)
	ld	a, (#_timer2)
	dec	a
	jp	NZ,00156$
;Parallax.c:149: joyState = joypad();
	call	_joypad
	ld	hl, #_joyState
	ld	(hl), e
;Parallax.c:150: SCX_REG = scrollX;
	ld	a, (#_scrollX)
	ldh	(_SCX_REG + 0), a
;Parallax.c:151: SCY_REG = scrollY;
	ld	a, (#_scrollY)
	ldh	(_SCY_REG + 0), a
;Parallax.c:152: lastSpriteY = spriteY;
	ld	a, (#_spriteY)
	ld	(#_lastSpriteY),a
	ld	a, (#_spriteY + 1)
	ld	(#_lastSpriteY + 1),a
;Parallax.c:153: if (joyState & J_RIGHT)
	ld	hl, #_joyState
	ld	c, (hl)
	bit	0, c
	jr	Z, 00111$
;Parallax.c:156: spriteX += 8;
	ld	hl, #_spriteX
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	b, l
	ld	a, h
	ld	hl, #_spriteX
	ld	(hl), b
	inc	hl
	ld	(hl), a
00111$:
;Parallax.c:158: if (joyState & J_LEFT)
	bit	1, c
	jr	Z, 00113$
;Parallax.c:161: spriteX -= 8;
	ld	hl, #_spriteX
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, e
	add	a, #0xf8
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	(hl), e
	inc	hl
	ld	(hl), a
00113$:
;Parallax.c:163: if (joyState & J_UP)
	bit	2, c
	jr	Z, 00115$
;Parallax.c:166: spriteY -= 8;
	ld	hl, #_spriteY
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, e
	add	a, #0xf8
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	(hl), e
	inc	hl
	ld	(hl), a
00115$:
;Parallax.c:168: if (joyState & J_DOWN)
	bit	3, c
	jr	Z, 00119$
;Parallax.c:171: if (YVelocity < 110)
	ld	hl, #_YVelocity
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xee
	jr	NC, 00119$
;Parallax.c:173: YVelocity += 10;
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
00119$:
;Parallax.c:176: if (joyState & J_A)
	bit	4, c
	jr	Z, 00123$
;Parallax.c:178: if (isAHeld == 0)
	ld	a, (#_isAHeld)
	or	a, a
	jr	NZ, 00124$
;Parallax.c:180: YVelocity = -30;
	ld	hl, #_YVelocity
	ld	(hl), #0xe2
;Parallax.c:181: isAHeld = 1;
	ld	hl, #_isAHeld
	ld	(hl), #0x01
	jr	00124$
00123$:
;Parallax.c:186: isAHeld = 0;
	ld	hl, #_isAHeld
	ld	(hl), #0x00
00124$:
;Parallax.c:188: if (YVelocity < 110)
	ld	hl, #_YVelocity
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xee
	jr	NC, 00126$
;Parallax.c:190: YVelocity ++;
	inc	(hl)
00126$:
;Parallax.c:192: downshiftedSpriteY = ((spriteY + YVelocity) >> 7);
	ld	a, (#_YVelocity)
	ld	e, a
	rlca
	sbc	a, a
	ld	hl, #_spriteY
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ldhl	sp,	#2
	ld	(hl), e
	inc	hl
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_downshiftedSpriteY
	ld	(hl), c
;Parallax.c:193: downshiftedSpriteX = (spriteX >> 4);
	ld	hl, #_spriteX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_downshiftedSpriteX
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Parallax.c:194: getTile = FGMap[((downshiftedSpriteY << 5) + (downshiftedSpriteX >> 3))];
	ld	hl, #_downshiftedSpriteY
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, (#_downshiftedSpriteX)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_downshiftedSpriteX + 1)
	ldhl	sp,	#1
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_FGMapPLN0
	add	hl, de
	ld	a, (hl)
	ld	(#_getTile),a
;Parallax.c:195: if (getTile >= 78 & getTile < 91 & YVelocity >= 0)
	ld	hl, #_getTile
	ld	a, (hl)
	sub	a, #0x4e
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
	ld	a, (hl)
	sub	a, #0x5b
	ld	a, #0x00
	rla
	and	a, e
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_YVelocity)
	rlca
	and	a,#0x01
	xor	a, #0x01
	ldhl	sp,	#4
	and	a,(hl)
	jr	Z, 00128$
;Parallax.c:197: spriteY = lastSpriteY;
	ld	a, (#_lastSpriteY)
	ld	(#_spriteY),a
	ld	a, (#_lastSpriteY + 1)
	ld	hl, #_spriteY + 1
;Parallax.c:198: spriteY = (((spriteY + YVelocity) >> 4) >> 3) << 7;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	xor	a, a
	rr	d
	rr	e
	rra
	ld	hl, #_spriteY
	ld	(hl+), a
;Parallax.c:199: downshiftedSpriteY = (spriteY >> 7) - 1;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	dec	a
	ld	(#_downshiftedSpriteY),a
;Parallax.c:200: YVelocity = 0;
	ld	hl, #_YVelocity
	ld	(hl), #0x00
00128$:
;Parallax.c:202: spriteY += YVelocity;
	ld	a, (#_YVelocity)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_spriteY
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_spriteY + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	e, l
	ld	a, h
	ld	hl, #_spriteY
	ld	(hl), e
	inc	hl
	ld	(hl), a
;Parallax.c:203: scrollX = (spriteX >> 4) - 80;
	ld	a, c
	add	a, #0xb0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	hl, #_scrollX
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:204: scrollY = (spriteY >> 4) - 72;
	ld	hl, #_spriteY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	a, c
	add	a, #0xb8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	hl, #_scrollY
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:205: if (scrollX > 65405)
	ld	hl, #_scrollX
	ld	a, #0x7d
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	jr	NC, 00130$
;Parallax.c:207: scrollX = 0;
	xor	a, a
	ld	hl, #_scrollX
	ld	(hl+), a
	ld	(hl), a
00130$:
;Parallax.c:209: if (scrollX > 96 & scrollX <= 65405)
	ld	hl, #_scrollX
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, #0x60
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, #0x7d
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0x00
	rla
	xor	a, #0x01
	and	a,c
	jr	Z, 00132$
;Parallax.c:211: scrollX = 96;
	ld	hl, #_scrollX
	ld	a, #0x60
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00132$:
;Parallax.c:213: if (scrollY > 65405)
	ld	hl, #_scrollY
	ld	a, #0x7d
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	jr	NC, 00134$
;Parallax.c:215: scrollY = 0;
	xor	a, a
	ld	hl, #_scrollY
	ld	(hl+), a
	ld	(hl), a
00134$:
;Parallax.c:217: if (scrollY > 95 & scrollY <= 65405)
	ld	hl, #_scrollY
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, #0x5f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, #0x7d
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0x00
	rla
	xor	a, #0x01
	and	a,c
	jr	Z, 00137$
;Parallax.c:219: scrollY = 95;
	ld	hl, #_scrollY
	ld	a, #0x5f
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;Parallax.c:221: while (scrollX >= scrollXCompare)
00137$:
	ld	de, #_scrollX
	ld	hl, #_scrollXCompare
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00140$
;Parallax.c:223: scrollXCompare += 8;
	ld	hl, #_scrollXCompare
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x08
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:224: dynamicMapAddress ++;
	ld	hl, #_dynamicMapAddress
	inc	(hl)
	jr	NZ, 00356$
	inc	hl
	inc	(hl)
00356$:
;Parallax.c:225: dynamicMapAddress2 ++;
	ld	hl, #_dynamicMapAddress2
	inc	(hl)
	jr	NZ, 00137$
	inc	hl
	inc	(hl)
	jr	00137$
;Parallax.c:227: while (scrollX < scrollXCompare)
00140$:
	ld	de, #_scrollX
	ld	hl, #_scrollXCompare
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00143$
;Parallax.c:229: scrollXCompare -= 8;
	ld	hl, #_scrollXCompare
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:230: dynamicMapAddress --;
	ld	hl, #_dynamicMapAddress
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;Parallax.c:231: dynamicMapAddress2 --;
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00140$
;Parallax.c:233: while (scrollY >= scrollYCompare)
00143$:
	ld	de, #_scrollY
	ld	hl, #_scrollYCompare
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00146$
;Parallax.c:235: scrollYCompare += 8;
	ld	hl, #_scrollYCompare
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x08
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:236: dynamicMapAddress += 32;
	ld	hl, #_dynamicMapAddress
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x20
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:237: dynamicMapAddress2 += 64;
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x40
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00143$
;Parallax.c:239: while (scrollY < scrollYCompare)
00146$:
	ld	de, #_scrollY
	ld	hl, #_scrollYCompare
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00149$
;Parallax.c:241: scrollYCompare -= 8;
	ld	hl, #_scrollYCompare
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:242: dynamicMapAddress -= 32;
	ld	hl, #_dynamicMapAddress
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xe0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:243: dynamicMapAddress2 -= 64;
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xc0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00146$
;Parallax.c:245: while (scrollY >= scrollYCompare2)
00149$:
	ld	de, #_scrollY
	ld	hl, #_scrollYCompare2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00152$
;Parallax.c:247: scrollYCompare2 += 16;
	ld	hl, #_scrollYCompare2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x10
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:248: dynamicMapAddress2 -= 64;
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xc0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00149$
;Parallax.c:250: while (scrollY < scrollYCompare2)
00152$:
	ld	de, #_scrollY
	ld	hl, #_scrollYCompare2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00154$
;Parallax.c:252: scrollYCompare2 -= 16;
	ld	hl, #_scrollYCompare2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:253: dynamicMapAddress2 += 64;
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	b, (hl)
	dec	hl
	add	a, #0x40
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00152$
00154$:
;Parallax.c:255: GraphicsOffset = (scrollY >> 1) << 1;
	ld	hl, #_scrollY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	ld	a, c
	add	a, a
	ld	(#_GraphicsOffset),a
;Parallax.c:256: GraphicsOffsetX = ((scrollX >> 1)) & 7;
	ld	hl, #_scrollX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	ld	a, c
	and	a, #0x07
	ld	(#_GraphicsOffsetX),a
;Parallax.c:257: memcpy(_RAMBANK,(TreeBaseTiles - (GraphicsOffset & 15) + 32) + (scrollLookupTable[GraphicsOffsetX] << 3), 1040);		//DMA is strictly limited to 16-byte chunks. I get around this by copying to RAM first
	ld	a, (#_GraphicsOffset)
	and	a, #0x0f
	ld	b, a
	ld	c, #0x00
	ld	a, #<(_TreeBaseTiles)
	sub	a, b
	ld	e, a
	ld	a, #>(_TreeBaseTiles)
	sbc	a, c
	ld	d, a
	ld	hl, #0x0020
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_GraphicsOffsetX
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_scrollLookupTable
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x0410
	push	de
	push	hl
	ld	de, #__RAMBANK
	push	de
	call	_memcpy
	add	sp, #6
;Parallax.c:258: memcpy(_RAMBANK + 0x710,(TreeBaseTiles - (GraphicsOffset & 15) + 288), 32);
	ld	a, (#_GraphicsOffset)
	and	a, #0x0f
	ld	b, a
	ld	c, #0x00
	ld	a, #<(_TreeBaseTiles)
	sub	a, b
	ld	e, a
	ld	a, #>(_TreeBaseTiles)
	sbc	a, c
	ld	d, a
	ld	hl, #0x0120
	add	hl, de
	ld	de, #0x0020
	push	de
	push	hl
	ld	de, #(__RAMBANK + 1808)
	push	de
	call	_memcpy
	add	sp, #6
00156$:
;Parallax.c:260: if (timer2 == 0)
	ld	a, (#_timer2)
	or	a, a
	jp	NZ, 00158$
;Parallax.c:262: tileAddress = 0x4800 + (dynamicMapAddress2 - (dynamicMapAddress2 >> 1));
	ld	hl, #_dynamicMapAddress2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	srl	b
	rr	c
	ld	a, (hl+)
	sub	a, c
	ld	c, a
	ld	a, (hl)
	sbc	a, b
	ld	b, a
	add	a, #0x48
	ld	hl, #_tileAddress
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:263: tileAddress2 = 0x4000 + dynamicMapAddress;
	ld	hl, #_dynamicMapAddress
	ld	a, (hl+)
	ld	c, a
	ld	e, (hl)
	ld	a, e
	add	a, #0x40
	ld	hl, #_tileAddress2
	ld	(hl), c
	inc	hl
	ld	(hl), a
;Parallax.c:521: __endasm;
	ld	a, #19
	ld	(#0xCFE0), a
	ld	hl, #_tileAddress
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #_tileAddress2
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	h, b
	ld	l, c
	push	de
	ld	de, #0x9740
	add	hl, de
	pop	de
	 206$:
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	ld	a, (bc)
	cp	a, #77
	.db	#0x20, #0x02;
	ld	a, (de)
	ld	(hl), a
	inc	hl
	inc	de
	inc	bc
	push	de
	push	hl
	ld	h, b
	ld	l, c
	ld	de, #11
	add	hl, de
	ld	b, h
	ld	c, l
	pop	hl
	ld	e, #11
	add	hl, de
	pop	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (#0xCFE0)
	cp	a, #0x00
	dec	a
	ld	(#0xCFE0), a
	jp	nz, 206$
00158$:
;Parallax.c:523: timer2 ++;
	ld	hl, #_timer2
	inc	(hl)
;Parallax.c:524: if (timer2 == 1)
	ld	a, (hl)
	dec	a
	jr	NZ, 00160$
;Parallax.c:526: move_sprite(0,((spriteX >> 4) - scrollX) + 8,(spriteY >> 4) - scrollY);
	ld	hl, #_spriteY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	a, c
	ld	hl, #_scrollY
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	hl, #_spriteX
	ld	a, (hl+)
	ld	c, a
	ld	e, (hl)
	srl	e
	rr	c
	srl	e
	rr	c
	srl	e
	rr	c
	srl	e
	rr	c
	ld	a, c
	ld	hl, #_scrollX
	ld	c, (hl)
	sub	a, c
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;Parallax.c:526: move_sprite(0,((spriteX >> 4) - scrollX) + 8,(spriteY >> 4) - scrollY);
00160$:
;Parallax.c:528: if (timer2 > 1)
	ld	a, #0x01
	ld	hl, #_timer2
	sub	a, (hl)
	jr	NC, 00162$
;Parallax.c:530: timer2 = 0;
	ld	(hl), #0x00
00162$:
;Parallax.c:532: if (timer2 == 1)
	ld	hl, #_timer2
	ld	a, (hl)
	dec	a
	jp	NZ,00166$
;Parallax.c:537: __endasm;
	halt
	nop
	jp	00166$
;Parallax.c:540: }
	add	sp, #5
	ret
_DMAInit:
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
_scrollLookupTable:
	.dw #0x0000
	.dw #0x0082
	.dw #0x0104
	.dw #0x0186
	.dw #0x0208
	.dw #0x028a
	.dw #0x030c
	.dw #0x038e
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;Parallax.c:36: void DMA()
;	---------------------------------
; Function DMA
; ---------------------------------
_DMA::
;Parallax.c:51: __endasm;
	ld	hl, #0xFF51
	ld	(hl), #0xD0
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x90
	inc	hl
	ld	(hl), #0xC0
	inc	hl
	ld	(hl), #127
	ld	(hl), #175
;Parallax.c:52: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
