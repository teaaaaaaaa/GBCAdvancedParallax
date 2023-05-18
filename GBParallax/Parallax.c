#include <gbdk/platform.h>
#include <string.h>
#include "TreeBaseTiles.h"
#include "FGTiles.h"
#include "FGMap.h"
#include "BGMap.h"
uint8_t GraphicsOffset;
uint8_t GraphicsOffsetX;
uint8_t timer;
uint8_t timer2;
uint8_t joyState;
uint8_t getTile;
uint16_t lastSpriteX;
uint16_t lastSpriteY;
uint16_t spriteX;
uint16_t spriteY;
uint16_t downshiftedSpriteX;
uint8_t downshiftedSpriteY;
uint16_t spriteMapAddress;
uint16_t shadowMapAddress;
uint16_t tileAddress;
uint16_t tileAddress2;
uint8_t isAHeld;
int8_t YVelocity;
uint16_t dynamicMapAddress;
uint16_t dynamicMapAddress2;
uint16_t scrollX;
uint16_t scrollXCompare;
uint16_t scrollY;
uint16_t scrollYCompare;
uint16_t scrollYCompare2;
uint8_t halfTileY;


void huge()
{
//DMA routine
__asm
ld hl, #0xFF51
ld (hl), #0xD0
inc hl
ld (hl), #0x00
inc hl
ld (hl), #0x90
inc hl
ld (hl), #0x20
inc hl
ld (hl), #127
ld (hl), #163
__endasm;
}

const uint8_t DMAInit[] =
{
0x40,0x00,0x90,0x00
};

const uint16_t scrollLookupTable[] =
{
0,130,260,390,520,650,780,910
};

void main() NONBANKED
{
	if (DEVICE_SUPPORTS_COLOR)
	cpu_fast();
	else
	{
	while(1)
	{
	}
	}
	NR52_REG = 0x80;
	NR51_REG = 0xFF;
	NR50_REG = 0x77;
	set_bkg_palette_entry(0,0,TreeBaseTilesCGBPal0c0);
	set_bkg_palette_entry(0,1,TreeBaseTilesCGBPal0c1);
	set_bkg_palette_entry(0,2,TreeBaseTilesCGBPal0c2);
	set_bkg_palette_entry(0,3,TreeBaseTilesCGBPal0c3);
	set_bkg_palette_entry(1,0,TreeBaseTilesCGBPal1c0);
	set_bkg_palette_entry(1,1,TreeBaseTilesCGBPal1c1);
	set_bkg_palette_entry(1,2,TreeBaseTilesCGBPal1c2);
	set_bkg_palette_entry(1,3,TreeBaseTilesCGBPal1c3);
	set_bkg_palette_entry(2,0,TreeBaseTilesCGBPal2c0);
	set_bkg_palette_entry(2,1,TreeBaseTilesCGBPal2c1);
	set_bkg_palette_entry(2,2,TreeBaseTilesCGBPal2c2);
	set_bkg_palette_entry(2,3,TreeBaseTilesCGBPal2c3);
	set_bkg_palette_entry(3,0,TreeBaseTilesCGBPal3c0);
	set_bkg_palette_entry(3,1,TreeBaseTilesCGBPal3c1);
	set_bkg_palette_entry(3,2,TreeBaseTilesCGBPal3c2);
	set_bkg_palette_entry(3,3,TreeBaseTilesCGBPal3c3);
	set_bkg_palette_entry(4,0,TreeBaseTilesCGBPal4c0);
	set_bkg_palette_entry(4,1,TreeBaseTilesCGBPal4c1);
	set_bkg_palette_entry(4,2,TreeBaseTilesCGBPal4c2);
	set_bkg_palette_entry(4,3,TreeBaseTilesCGBPal4c3);
	set_bkg_palette_entry(5,0,TreeBaseTilesCGBPal5c0);
	set_bkg_palette_entry(5,1,TreeBaseTilesCGBPal5c1);
	set_bkg_palette_entry(5,2,TreeBaseTilesCGBPal5c2);
	set_bkg_palette_entry(5,3,TreeBaseTilesCGBPal5c3);
	set_bkg_palette_entry(6,0,TreeBaseTilesCGBPal6c0);
	set_bkg_palette_entry(6,1,TreeBaseTilesCGBPal6c1);
	set_bkg_palette_entry(6,2,TreeBaseTilesCGBPal6c2);
	set_bkg_palette_entry(6,3,TreeBaseTilesCGBPal6c3);
	set_bkg_data(0,2,TreeBaseTiles);
	LYC_REG = 143;
	__asm		//Wonder if this code is even necessary?
	ld hl, #_DMAInit	//load array address into hl
	ld c, #0x51			//FF51: DMA register 1
	100$:
	ld a, (hl+)			//load value from address specified by hl then increment
	.db #0xE2;		//raw instruction value since the compiler doesn't seem to interpret this correctly. ld (#0xff00 + c), a
	inc c			//increment c
	ld a, c			//load from c for comparison
	cp a, #0x55		//compare
	jp nz, 100$		//jump if not equal
	__endasm;
	memcpy(_RAMBANK + 0x420,ForegroundTiles, 256);
	
	DISPLAY_ON;
	SHOW_BKG;
	STAT_REG = 0xC5;
	SHOW_SPRITES;
	SPRITES_8x16;
	add_VBL(huge);

	set_interrupts(VBL_IFLAG);

	__asm
	ld sp, #0xD000
	jp 232$
	ret
	232$:
	__endasm;

	while(1)
	{
	if (timer2 == 1)
	{
	joyState = joypad();
	SCX_REG = scrollX & 7;
	SCY_REG = scrollY & 7;
	lastSpriteY = spriteY;
	if (joyState & J_RIGHT)
	{
	//GraphicsOffsetX ++;
	spriteX += 8;
	}
	if (joyState & J_LEFT)
	{
	//GraphicsOffsetX ++;
	spriteX -= 8;
	}
	if (joyState & J_UP)
	{
	//GraphicsOffsetX ++;
	spriteY -= 8;
	}
	if (joyState & J_DOWN)
	{
	//GraphicsOffsetX ++;
	if (YVelocity < 110)
	{
	YVelocity += 10;
	}
	}
	if (joyState & J_A)
	{
	if (isAHeld == 0)
	{
	YVelocity = -30;
	isAHeld = 1;
	}
	}
	else
	{
	isAHeld = 0;
	}
	if (YVelocity < 110)
	{
	YVelocity ++;
	}
	downshiftedSpriteY = ((spriteY + YVelocity) >> 7);
	downshiftedSpriteX = (spriteX >> 4);
	getTile = FGMap[((downshiftedSpriteY * 50) + (downshiftedSpriteX >> 3))];
	if (getTile >= 0x45 & getTile < 0x7D & YVelocity >= 0)
	{
	spriteY = lastSpriteY;
	spriteY = (((spriteY + YVelocity) >> 4) >> 3) << 7;
	downshiftedSpriteY = (spriteY >> 7) - 1;
	YVelocity = 0;
	}
	spriteY += YVelocity;
	scrollX = (spriteX >> 4) - 80;
	scrollY = (spriteY >> 4) - 72;
	if (scrollX > 65405)
	{
	scrollX = 0;
	}
	if (scrollX > 248 & scrollX <= 65405)
	{
	scrollX = 248;
	}
	if (scrollY > 65405)
	{
	scrollY = 0;
	}
	if (scrollY > 248 & scrollY <= 65405)
	{
	scrollY = 248;
	}
	while (scrollX >= scrollXCompare)
	{
	scrollXCompare += 8;
	dynamicMapAddress ++;
	dynamicMapAddress2 ++;
	}
	while (scrollX < scrollXCompare)
	{
	scrollXCompare -= 8;
	dynamicMapAddress --;
	dynamicMapAddress2 --;
	}
	while (scrollY >= scrollYCompare)
	{
	scrollYCompare += 8;
	dynamicMapAddress += 50;
	dynamicMapAddress2 += 74;
	}
	while (scrollY < scrollYCompare)
	{
	scrollYCompare -= 8;
	dynamicMapAddress -= 50;
	dynamicMapAddress2 -= 74;
	}
	while (scrollY >= scrollYCompare2)
	{
	scrollYCompare2 += 16;
	dynamicMapAddress2 -= 74;
	}
	while (scrollY < scrollYCompare2)
	{
	scrollYCompare2 -= 16;
	dynamicMapAddress2 += 74;
	}
	GraphicsOffset = (scrollY >> 1) << 1;
	GraphicsOffsetX = ((scrollX >> 1)) & 7;
	}
	if (timer2 == 0)
	{
	tileAddress2 = 0x4000 + dynamicMapAddress;
	tileAddress = 0x49C4 + (dynamicMapAddress2 - (dynamicMapAddress2 >> 1));
	__asm
	ld hl, #_tileAddress
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld hl, #_tileAddress2
	ld c, (hl)
	inc hl
	ld b, (hl)
	ld hl, #0xD7E0
	206$:
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc
	
	ld a, (bc)
	cp a, #68
	.db #0x28, #0x06;
	dec a
	ld (hl+), a
	inc de
	inc bc
	.db #0x18, #0x04;
	
	ld a, (de)
	ld (hl+), a
	inc de
	inc bc

	push de
	push hl
	ld h, b
	ld l, c
	ld de, #29
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld e, #11
	add hl, de
	pop de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	ld a, h
	cp a, #0xDA
	jp c, 206$
	ld a, l
	cp a, #0x35
	jp c, 206$
	__endasm;
	memcpy(_RAMBANK,(TreeBaseTiles - (GraphicsOffset & 15) + 32) + (scrollLookupTable[GraphicsOffsetX] << 3), (66 << 4));		//DMA is strictly limited to 16-byte chunks. I get around this by copying to RAM first
	memcpy(_RAMBANK + 0x7B0,(TreeBaseTiles - (GraphicsOffset & 15) + 288), 32);
	}
	timer2 ++;
	if (timer2 == 1)
	{
	move_sprite(0,((spriteX >> 4) - scrollX) + 8,(spriteY >> 4) - scrollY);
	}
	if (timer2 > 1)
	{
	timer2 = 0;
	}
	if (timer2 == 1)
	{
	__asm
	halt
	nop
	__endasm;
	}
	}
}