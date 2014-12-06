
	INCLUDE	"hardware.inc"
	INCLUDE "header.inc"

;--------------------------------------------------------------------------

	SECTION	"Main",HOME

;--------------------------------------------------------------------------
;- Main()                                                                 -
;--------------------------------------------------------------------------

Main:

	; -------------------------------------------------------
	
	ld	a,$0A
	ld	[$0000],a ; enable ram
	
	ld	hl,$A000
	
	ld	a,LCDCF_ON|LCDCF_OBJON
	ld	[rLCDC],a
	
	; -------------------------------------------------------

PERFORM_TEST : MACRO
	di
	
	push	hl
	
	ld	bc,$007F
	ld	hl,\1
	ld	de,$FF80
	call	memcopy
	
	ld	b,42
	call	wait_ly
	
	
	ld	a,IEF_LCDC
	ld	[rIE],a
	ld	a,44
	ld	[rLYC],a
	ld	a,STATF_LYC
	ld	[rSTAT],a
	xor	a,a
	ld	[rIF],a
	halt ; wait for line 44 but don't jump to interrupt vector
	
	ld	a,TACF_START|TACF_262KHZ
	ld	[rTAC],a
	
	xor	a,a
	ld	c,rDIV & $FF
	ld	hl,rTIMA
	ld	[rTMA],a
	ld	[$FF00+c],a
	ld	[hl],a
	ld	[$FF00+c],a
	ld	[hl],a
	
	ld	b,45
	call	wait_ly
	
	ld	a,50
	ld	[rLYC],a
	ld	a,STATF_LYC
	ld	[rSTAT],a
	
	ld	a,IEF_LCDC
	ld	[rIE],a
	
	xor	a,a
	ld	[rIF],a
	
	pop	hl
	
	ei

	halt
ENDM

	ld	a,$80
	ld	[rNR52],a
	ld	a,$FF
	ld	[rNR51],a
	ld	a,$77
	ld	[rNR50],a
	
	ld	a,$C0
	ld	[rNR11],a
	ld	a,$E0
	ld	[rNR12],a
	ld	a,$00
	ld	[rNR13],a
	ld	a,$82
	ld	[rNR14],a
	
	PERFORM_TEST LCD_INT_HANDLER_STAT_0
	PERFORM_TEST LCD_INT_HANDLER_STAT_1
	PERFORM_TEST LCD_INT_HANDLER_STAT_2
	PERFORM_TEST LCD_INT_HANDLER_STAT_3
	PERFORM_TEST LCD_INT_HANDLER_STAT_4
	PERFORM_TEST LCD_INT_HANDLER_STAT_5
	PERFORM_TEST LCD_INT_HANDLER_STAT_6
	PERFORM_TEST LCD_INT_HANDLER_STAT_7
	PERFORM_TEST LCD_INT_HANDLER_STAT_8
	PERFORM_TEST LCD_INT_HANDLER_STAT_9
	PERFORM_TEST LCD_INT_HANDLER_STAT_10
	PERFORM_TEST LCD_INT_HANDLER_STAT_11
	PERFORM_TEST LCD_INT_HANDLER_STAT_12
	PERFORM_TEST LCD_INT_HANDLER_STAT_13
	PERFORM_TEST LCD_INT_HANDLER_STAT_14
	PERFORM_TEST LCD_INT_HANDLER_STAT_15
	PERFORM_TEST LCD_INT_HANDLER_STAT_16
	PERFORM_TEST LCD_INT_HANDLER_STAT_17
	PERFORM_TEST LCD_INT_HANDLER_STAT_18
	PERFORM_TEST LCD_INT_HANDLER_STAT_19
	PERFORM_TEST LCD_INT_HANDLER_STAT_20
	PERFORM_TEST LCD_INT_HANDLER_STAT_21
	PERFORM_TEST LCD_INT_HANDLER_STAT_22
	PERFORM_TEST LCD_INT_HANDLER_STAT_23
	PERFORM_TEST LCD_INT_HANDLER_STAT_24
	PERFORM_TEST LCD_INT_HANDLER_STAT_25
	PERFORM_TEST LCD_INT_HANDLER_STAT_26
	PERFORM_TEST LCD_INT_HANDLER_STAT_27
	PERFORM_TEST LCD_INT_HANDLER_STAT_28
	PERFORM_TEST LCD_INT_HANDLER_STAT_29
	PERFORM_TEST LCD_INT_HANDLER_STAT_30
	PERFORM_TEST LCD_INT_HANDLER_STAT_31
	
	PERFORM_TEST LCD_INT_HANDLER_TIMA_0
	PERFORM_TEST LCD_INT_HANDLER_TIMA_1
	PERFORM_TEST LCD_INT_HANDLER_TIMA_2
	PERFORM_TEST LCD_INT_HANDLER_TIMA_3
	PERFORM_TEST LCD_INT_HANDLER_TIMA_4
	PERFORM_TEST LCD_INT_HANDLER_TIMA_5
	PERFORM_TEST LCD_INT_HANDLER_TIMA_6
	PERFORM_TEST LCD_INT_HANDLER_TIMA_7
	PERFORM_TEST LCD_INT_HANDLER_TIMA_8
	PERFORM_TEST LCD_INT_HANDLER_TIMA_9
	PERFORM_TEST LCD_INT_HANDLER_TIMA_10
	PERFORM_TEST LCD_INT_HANDLER_TIMA_11
	PERFORM_TEST LCD_INT_HANDLER_TIMA_12
	PERFORM_TEST LCD_INT_HANDLER_TIMA_13
	PERFORM_TEST LCD_INT_HANDLER_TIMA_14
	PERFORM_TEST LCD_INT_HANDLER_TIMA_15
	PERFORM_TEST LCD_INT_HANDLER_TIMA_16
	PERFORM_TEST LCD_INT_HANDLER_TIMA_17
	PERFORM_TEST LCD_INT_HANDLER_TIMA_18
	PERFORM_TEST LCD_INT_HANDLER_TIMA_19
	PERFORM_TEST LCD_INT_HANDLER_TIMA_20
	PERFORM_TEST LCD_INT_HANDLER_TIMA_21
	PERFORM_TEST LCD_INT_HANDLER_TIMA_22
	PERFORM_TEST LCD_INT_HANDLER_TIMA_23
	PERFORM_TEST LCD_INT_HANDLER_TIMA_24
	PERFORM_TEST LCD_INT_HANDLER_TIMA_25
	PERFORM_TEST LCD_INT_HANDLER_TIMA_26
	PERFORM_TEST LCD_INT_HANDLER_TIMA_27
	PERFORM_TEST LCD_INT_HANDLER_TIMA_28
	PERFORM_TEST LCD_INT_HANDLER_TIMA_29
	PERFORM_TEST LCD_INT_HANDLER_TIMA_30
	PERFORM_TEST LCD_INT_HANDLER_TIMA_31
	
	PERFORM_TEST LCD_INT_HANDLER_IF_0
	PERFORM_TEST LCD_INT_HANDLER_IF_1
	PERFORM_TEST LCD_INT_HANDLER_IF_2
	PERFORM_TEST LCD_INT_HANDLER_IF_3
	PERFORM_TEST LCD_INT_HANDLER_IF_4
	PERFORM_TEST LCD_INT_HANDLER_IF_5
	PERFORM_TEST LCD_INT_HANDLER_IF_6
	PERFORM_TEST LCD_INT_HANDLER_IF_7
	PERFORM_TEST LCD_INT_HANDLER_IF_8
	PERFORM_TEST LCD_INT_HANDLER_IF_9
	PERFORM_TEST LCD_INT_HANDLER_IF_10
	PERFORM_TEST LCD_INT_HANDLER_IF_11
	PERFORM_TEST LCD_INT_HANDLER_IF_12
	PERFORM_TEST LCD_INT_HANDLER_IF_13
	PERFORM_TEST LCD_INT_HANDLER_IF_14
	PERFORM_TEST LCD_INT_HANDLER_IF_15
	PERFORM_TEST LCD_INT_HANDLER_IF_16
	PERFORM_TEST LCD_INT_HANDLER_IF_17
	PERFORM_TEST LCD_INT_HANDLER_IF_18
	PERFORM_TEST LCD_INT_HANDLER_IF_19
	PERFORM_TEST LCD_INT_HANDLER_IF_20
	PERFORM_TEST LCD_INT_HANDLER_IF_21
	PERFORM_TEST LCD_INT_HANDLER_IF_22
	PERFORM_TEST LCD_INT_HANDLER_IF_23
	PERFORM_TEST LCD_INT_HANDLER_IF_24
	PERFORM_TEST LCD_INT_HANDLER_IF_25
	PERFORM_TEST LCD_INT_HANDLER_IF_26
	PERFORM_TEST LCD_INT_HANDLER_IF_27
	PERFORM_TEST LCD_INT_HANDLER_IF_28
	PERFORM_TEST LCD_INT_HANDLER_IF_29
	PERFORM_TEST LCD_INT_HANDLER_IF_30
	PERFORM_TEST LCD_INT_HANDLER_IF_31
	
	PERFORM_TEST LCD_INT_HANDLER_LY_0
	PERFORM_TEST LCD_INT_HANDLER_LY_1
	PERFORM_TEST LCD_INT_HANDLER_LY_2
	PERFORM_TEST LCD_INT_HANDLER_LY_3
	PERFORM_TEST LCD_INT_HANDLER_LY_4
	PERFORM_TEST LCD_INT_HANDLER_LY_5
	PERFORM_TEST LCD_INT_HANDLER_LY_6
	PERFORM_TEST LCD_INT_HANDLER_LY_7
	PERFORM_TEST LCD_INT_HANDLER_LY_8
	PERFORM_TEST LCD_INT_HANDLER_LY_9
	PERFORM_TEST LCD_INT_HANDLER_LY_10
	PERFORM_TEST LCD_INT_HANDLER_LY_11
	PERFORM_TEST LCD_INT_HANDLER_LY_12
	PERFORM_TEST LCD_INT_HANDLER_LY_13
	PERFORM_TEST LCD_INT_HANDLER_LY_14
	PERFORM_TEST LCD_INT_HANDLER_LY_15
	PERFORM_TEST LCD_INT_HANDLER_LY_16
	PERFORM_TEST LCD_INT_HANDLER_LY_17
	PERFORM_TEST LCD_INT_HANDLER_LY_18
	PERFORM_TEST LCD_INT_HANDLER_LY_19
	PERFORM_TEST LCD_INT_HANDLER_LY_20
	PERFORM_TEST LCD_INT_HANDLER_LY_21
	PERFORM_TEST LCD_INT_HANDLER_LY_22
	PERFORM_TEST LCD_INT_HANDLER_LY_23
	PERFORM_TEST LCD_INT_HANDLER_LY_24
	PERFORM_TEST LCD_INT_HANDLER_LY_25
	PERFORM_TEST LCD_INT_HANDLER_LY_26
	PERFORM_TEST LCD_INT_HANDLER_LY_27
	PERFORM_TEST LCD_INT_HANDLER_LY_28
	PERFORM_TEST LCD_INT_HANDLER_LY_29
	PERFORM_TEST LCD_INT_HANDLER_LY_30
	PERFORM_TEST LCD_INT_HANDLER_LY_31
	
	; --------------------------------
	
	ld	a,$00
	ld	[$0000],a ; disable ram
	
	call	CPU_fast
	
	
	; --------------------------------
	
	ld	a,$0A
	ld	[$0000],a ; enable ram
	
	; ---------------------------------

	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_0
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_1
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_2
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_3
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_4
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_5
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_6
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_7
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_8
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_9
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_10
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_11
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_12
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_13
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_14
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_15
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_16
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_17
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_18
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_19
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_20
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_21
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_22
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_23
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_24
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_25
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_26
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_27
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_28
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_29
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_30
	PERFORM_TEST LCD_INT_HANDLER_STAT_GBC_31
	
	jp Main2
	
	; ---------------------------------

	SECTION "MAIN2",ROMX,BANK[1]

Main2:
	
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_0
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_1
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_2
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_3
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_4
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_5
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_6
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_7
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_8
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_9
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_10
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_11
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_12
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_13
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_14
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_15
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_16
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_17
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_18
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_19
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_20
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_21
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_22
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_23
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_24
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_25
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_26
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_27
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_28
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_29
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_30
	PERFORM_TEST LCD_INT_HANDLER_TIMA_GBC_31
	
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_0
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_1
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_2
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_3
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_4
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_5
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_6
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_7
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_8
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_9
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_10
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_11
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_12
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_13
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_14
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_15
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_16
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_17
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_18
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_19
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_20
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_21
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_22
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_23
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_24
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_25
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_26
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_27
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_28
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_29
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_30
	PERFORM_TEST LCD_INT_HANDLER_IF_GBC_31
	
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_0
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_1
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_2
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_3
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_4
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_5
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_6
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_7
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_8
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_9
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_10
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_11
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_12
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_13
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_14
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_15
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_16
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_17
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_18
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_19
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_20
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_21
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_22
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_23
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_24
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_25
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_26
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_27
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_28
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_29
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_30
	PERFORM_TEST LCD_INT_HANDLER_LY_GBC_31

	; -------------------------------------------------------
	
	ld	a,$80
	ld	[rNR52],a
	ld	a,$FF
	ld	[rNR51],a
	ld	a,$77
	ld	[rNR50],a
	
	ld	a,$C0
	ld	[rNR11],a
	ld	a,$E0
	ld	[rNR12],a
	ld	a,$00
	ld	[rNR13],a
	ld	a,$87
	ld	[rNR14],a
	
	push	hl
	ld	[hl],$12
	inc hl
	ld	[hl],$34
	inc hl
	ld	[hl],$56
	inc hl
	ld	[hl],$78
	pop	hl
	
	ld	a,$00
	ld	[$0000],a ; disable ram

.endloop:
	halt
	jr	.endloop

; --------------------------------------------------------------

	SECTION "functions",ROMX,BANK[1]
	
LCD_INT_HANDLER_MACRO : MACRO
	ld	a,[rLYC]
	inc	a
	ld	[rLYC],a
	
	ld	b,23
.loop\@:
	dec	b
	jr	nz,.loop\@
	
	REPT \1
	nop
	ENDR
	ld	a,[\2]
	ld	[hl+],a
	ret
ENDM

LCD_INT_HANDLER_STAT_0: LCD_INT_HANDLER_MACRO 0,rSTAT
LCD_INT_HANDLER_STAT_1: LCD_INT_HANDLER_MACRO 1,rSTAT
LCD_INT_HANDLER_STAT_2: LCD_INT_HANDLER_MACRO 2,rSTAT
LCD_INT_HANDLER_STAT_3: LCD_INT_HANDLER_MACRO 3,rSTAT
LCD_INT_HANDLER_STAT_4: LCD_INT_HANDLER_MACRO 4,rSTAT
LCD_INT_HANDLER_STAT_5: LCD_INT_HANDLER_MACRO 5,rSTAT
LCD_INT_HANDLER_STAT_6: LCD_INT_HANDLER_MACRO 6,rSTAT
LCD_INT_HANDLER_STAT_7: LCD_INT_HANDLER_MACRO 7,rSTAT
LCD_INT_HANDLER_STAT_8: LCD_INT_HANDLER_MACRO 8,rSTAT
LCD_INT_HANDLER_STAT_9: LCD_INT_HANDLER_MACRO 9,rSTAT
LCD_INT_HANDLER_STAT_10: LCD_INT_HANDLER_MACRO 10,rSTAT
LCD_INT_HANDLER_STAT_11: LCD_INT_HANDLER_MACRO 11,rSTAT
LCD_INT_HANDLER_STAT_12: LCD_INT_HANDLER_MACRO 12,rSTAT
LCD_INT_HANDLER_STAT_13: LCD_INT_HANDLER_MACRO 13,rSTAT
LCD_INT_HANDLER_STAT_14: LCD_INT_HANDLER_MACRO 14,rSTAT
LCD_INT_HANDLER_STAT_15: LCD_INT_HANDLER_MACRO 15,rSTAT
LCD_INT_HANDLER_STAT_16: LCD_INT_HANDLER_MACRO 16,rSTAT
LCD_INT_HANDLER_STAT_17: LCD_INT_HANDLER_MACRO 17,rSTAT
LCD_INT_HANDLER_STAT_18: LCD_INT_HANDLER_MACRO 18,rSTAT
LCD_INT_HANDLER_STAT_19: LCD_INT_HANDLER_MACRO 19,rSTAT
LCD_INT_HANDLER_STAT_20: LCD_INT_HANDLER_MACRO 20,rSTAT
LCD_INT_HANDLER_STAT_21: LCD_INT_HANDLER_MACRO 21,rSTAT
LCD_INT_HANDLER_STAT_22: LCD_INT_HANDLER_MACRO 22,rSTAT
LCD_INT_HANDLER_STAT_23: LCD_INT_HANDLER_MACRO 23,rSTAT
LCD_INT_HANDLER_STAT_24: LCD_INT_HANDLER_MACRO 24,rSTAT
LCD_INT_HANDLER_STAT_25: LCD_INT_HANDLER_MACRO 25,rSTAT
LCD_INT_HANDLER_STAT_26: LCD_INT_HANDLER_MACRO 26,rSTAT
LCD_INT_HANDLER_STAT_27: LCD_INT_HANDLER_MACRO 27,rSTAT
LCD_INT_HANDLER_STAT_28: LCD_INT_HANDLER_MACRO 28,rSTAT
LCD_INT_HANDLER_STAT_29: LCD_INT_HANDLER_MACRO 29,rSTAT
LCD_INT_HANDLER_STAT_30: LCD_INT_HANDLER_MACRO 30,rSTAT
LCD_INT_HANDLER_STAT_31: LCD_INT_HANDLER_MACRO 31,rSTAT

LCD_INT_HANDLER_TIMA_0: LCD_INT_HANDLER_MACRO 0,rTIMA
LCD_INT_HANDLER_TIMA_1: LCD_INT_HANDLER_MACRO 1,rTIMA
LCD_INT_HANDLER_TIMA_2: LCD_INT_HANDLER_MACRO 2,rTIMA
LCD_INT_HANDLER_TIMA_3: LCD_INT_HANDLER_MACRO 3,rTIMA
LCD_INT_HANDLER_TIMA_4: LCD_INT_HANDLER_MACRO 4,rTIMA
LCD_INT_HANDLER_TIMA_5: LCD_INT_HANDLER_MACRO 5,rTIMA
LCD_INT_HANDLER_TIMA_6: LCD_INT_HANDLER_MACRO 6,rTIMA
LCD_INT_HANDLER_TIMA_7: LCD_INT_HANDLER_MACRO 7,rTIMA
LCD_INT_HANDLER_TIMA_8: LCD_INT_HANDLER_MACRO 8,rTIMA
LCD_INT_HANDLER_TIMA_9: LCD_INT_HANDLER_MACRO 9,rTIMA
LCD_INT_HANDLER_TIMA_10: LCD_INT_HANDLER_MACRO 10,rTIMA
LCD_INT_HANDLER_TIMA_11: LCD_INT_HANDLER_MACRO 11,rTIMA
LCD_INT_HANDLER_TIMA_12: LCD_INT_HANDLER_MACRO 12,rTIMA
LCD_INT_HANDLER_TIMA_13: LCD_INT_HANDLER_MACRO 13,rTIMA
LCD_INT_HANDLER_TIMA_14: LCD_INT_HANDLER_MACRO 14,rTIMA
LCD_INT_HANDLER_TIMA_15: LCD_INT_HANDLER_MACRO 15,rTIMA
LCD_INT_HANDLER_TIMA_16: LCD_INT_HANDLER_MACRO 16,rTIMA
LCD_INT_HANDLER_TIMA_17: LCD_INT_HANDLER_MACRO 17,rTIMA
LCD_INT_HANDLER_TIMA_18: LCD_INT_HANDLER_MACRO 18,rTIMA
LCD_INT_HANDLER_TIMA_19: LCD_INT_HANDLER_MACRO 19,rTIMA
LCD_INT_HANDLER_TIMA_20: LCD_INT_HANDLER_MACRO 20,rTIMA
LCD_INT_HANDLER_TIMA_21: LCD_INT_HANDLER_MACRO 21,rTIMA
LCD_INT_HANDLER_TIMA_22: LCD_INT_HANDLER_MACRO 22,rTIMA
LCD_INT_HANDLER_TIMA_23: LCD_INT_HANDLER_MACRO 23,rTIMA
LCD_INT_HANDLER_TIMA_24: LCD_INT_HANDLER_MACRO 24,rTIMA
LCD_INT_HANDLER_TIMA_25: LCD_INT_HANDLER_MACRO 25,rTIMA
LCD_INT_HANDLER_TIMA_26: LCD_INT_HANDLER_MACRO 26,rTIMA
LCD_INT_HANDLER_TIMA_27: LCD_INT_HANDLER_MACRO 27,rTIMA
LCD_INT_HANDLER_TIMA_28: LCD_INT_HANDLER_MACRO 28,rTIMA
LCD_INT_HANDLER_TIMA_29: LCD_INT_HANDLER_MACRO 29,rTIMA
LCD_INT_HANDLER_TIMA_30: LCD_INT_HANDLER_MACRO 30,rTIMA
LCD_INT_HANDLER_TIMA_31: LCD_INT_HANDLER_MACRO 31,rTIMA

LCD_INT_HANDLER_IF_0: LCD_INT_HANDLER_MACRO 0,rIF
LCD_INT_HANDLER_IF_1: LCD_INT_HANDLER_MACRO 1,rIF
LCD_INT_HANDLER_IF_2: LCD_INT_HANDLER_MACRO 2,rIF
LCD_INT_HANDLER_IF_3: LCD_INT_HANDLER_MACRO 3,rIF
LCD_INT_HANDLER_IF_4: LCD_INT_HANDLER_MACRO 4,rIF
LCD_INT_HANDLER_IF_5: LCD_INT_HANDLER_MACRO 5,rIF
LCD_INT_HANDLER_IF_6: LCD_INT_HANDLER_MACRO 6,rIF
LCD_INT_HANDLER_IF_7: LCD_INT_HANDLER_MACRO 7,rIF
LCD_INT_HANDLER_IF_8: LCD_INT_HANDLER_MACRO 8,rIF
LCD_INT_HANDLER_IF_9: LCD_INT_HANDLER_MACRO 9,rIF
LCD_INT_HANDLER_IF_10: LCD_INT_HANDLER_MACRO 10,rIF
LCD_INT_HANDLER_IF_11: LCD_INT_HANDLER_MACRO 11,rIF
LCD_INT_HANDLER_IF_12: LCD_INT_HANDLER_MACRO 12,rIF
LCD_INT_HANDLER_IF_13: LCD_INT_HANDLER_MACRO 13,rIF
LCD_INT_HANDLER_IF_14: LCD_INT_HANDLER_MACRO 14,rIF
LCD_INT_HANDLER_IF_15: LCD_INT_HANDLER_MACRO 15,rIF
LCD_INT_HANDLER_IF_16: LCD_INT_HANDLER_MACRO 16,rIF
LCD_INT_HANDLER_IF_17: LCD_INT_HANDLER_MACRO 17,rIF
LCD_INT_HANDLER_IF_18: LCD_INT_HANDLER_MACRO 18,rIF
LCD_INT_HANDLER_IF_19: LCD_INT_HANDLER_MACRO 19,rIF
LCD_INT_HANDLER_IF_20: LCD_INT_HANDLER_MACRO 20,rIF
LCD_INT_HANDLER_IF_21: LCD_INT_HANDLER_MACRO 21,rIF
LCD_INT_HANDLER_IF_22: LCD_INT_HANDLER_MACRO 22,rIF
LCD_INT_HANDLER_IF_23: LCD_INT_HANDLER_MACRO 23,rIF
LCD_INT_HANDLER_IF_24: LCD_INT_HANDLER_MACRO 24,rIF
LCD_INT_HANDLER_IF_25: LCD_INT_HANDLER_MACRO 25,rIF
LCD_INT_HANDLER_IF_26: LCD_INT_HANDLER_MACRO 26,rIF
LCD_INT_HANDLER_IF_27: LCD_INT_HANDLER_MACRO 27,rIF
LCD_INT_HANDLER_IF_28: LCD_INT_HANDLER_MACRO 28,rIF
LCD_INT_HANDLER_IF_29: LCD_INT_HANDLER_MACRO 29,rIF
LCD_INT_HANDLER_IF_30: LCD_INT_HANDLER_MACRO 30,rIF
LCD_INT_HANDLER_IF_31: LCD_INT_HANDLER_MACRO 31,rIF

LCD_INT_HANDLER_LY_0: LCD_INT_HANDLER_MACRO 0,rLY
LCD_INT_HANDLER_LY_1: LCD_INT_HANDLER_MACRO 1,rLY
LCD_INT_HANDLER_LY_2: LCD_INT_HANDLER_MACRO 2,rLY
LCD_INT_HANDLER_LY_3: LCD_INT_HANDLER_MACRO 3,rLY
LCD_INT_HANDLER_LY_4: LCD_INT_HANDLER_MACRO 4,rLY
LCD_INT_HANDLER_LY_5: LCD_INT_HANDLER_MACRO 5,rLY
LCD_INT_HANDLER_LY_6: LCD_INT_HANDLER_MACRO 6,rLY
LCD_INT_HANDLER_LY_7: LCD_INT_HANDLER_MACRO 7,rLY
LCD_INT_HANDLER_LY_8: LCD_INT_HANDLER_MACRO 8,rLY
LCD_INT_HANDLER_LY_9: LCD_INT_HANDLER_MACRO 9,rLY
LCD_INT_HANDLER_LY_10: LCD_INT_HANDLER_MACRO 10,rLY
LCD_INT_HANDLER_LY_11: LCD_INT_HANDLER_MACRO 11,rLY
LCD_INT_HANDLER_LY_12: LCD_INT_HANDLER_MACRO 12,rLY
LCD_INT_HANDLER_LY_13: LCD_INT_HANDLER_MACRO 13,rLY
LCD_INT_HANDLER_LY_14: LCD_INT_HANDLER_MACRO 14,rLY
LCD_INT_HANDLER_LY_15: LCD_INT_HANDLER_MACRO 15,rLY
LCD_INT_HANDLER_LY_16: LCD_INT_HANDLER_MACRO 16,rLY
LCD_INT_HANDLER_LY_17: LCD_INT_HANDLER_MACRO 17,rLY
LCD_INT_HANDLER_LY_18: LCD_INT_HANDLER_MACRO 18,rLY
LCD_INT_HANDLER_LY_19: LCD_INT_HANDLER_MACRO 19,rLY
LCD_INT_HANDLER_LY_20: LCD_INT_HANDLER_MACRO 20,rLY
LCD_INT_HANDLER_LY_21: LCD_INT_HANDLER_MACRO 21,rLY
LCD_INT_HANDLER_LY_22: LCD_INT_HANDLER_MACRO 22,rLY
LCD_INT_HANDLER_LY_23: LCD_INT_HANDLER_MACRO 23,rLY
LCD_INT_HANDLER_LY_24: LCD_INT_HANDLER_MACRO 24,rLY
LCD_INT_HANDLER_LY_25: LCD_INT_HANDLER_MACRO 25,rLY
LCD_INT_HANDLER_LY_26: LCD_INT_HANDLER_MACRO 26,rLY
LCD_INT_HANDLER_LY_27: LCD_INT_HANDLER_MACRO 27,rLY
LCD_INT_HANDLER_LY_28: LCD_INT_HANDLER_MACRO 28,rLY
LCD_INT_HANDLER_LY_29: LCD_INT_HANDLER_MACRO 29,rLY
LCD_INT_HANDLER_LY_30: LCD_INT_HANDLER_MACRO 30,rLY
LCD_INT_HANDLER_LY_31: LCD_INT_HANDLER_MACRO 31,rLY

LCD_INT_HANDLER_GBC_MACRO : MACRO
	ld	a,[rLYC]
	inc	a
	ld	[rLYC],a

	ld	b,50
.loop2\@:
	dec	b
	jr	nz,.loop2\@
	
	REPT \1
	nop
	ENDR
	ld	a,[\2]
	ld	[hl+],a
	ret
ENDM

LCD_INT_HANDLER_STAT_GBC_0: LCD_INT_HANDLER_GBC_MACRO 0,rSTAT
LCD_INT_HANDLER_STAT_GBC_1: LCD_INT_HANDLER_GBC_MACRO 1,rSTAT
LCD_INT_HANDLER_STAT_GBC_2: LCD_INT_HANDLER_GBC_MACRO 2,rSTAT
LCD_INT_HANDLER_STAT_GBC_3: LCD_INT_HANDLER_GBC_MACRO 3,rSTAT
LCD_INT_HANDLER_STAT_GBC_4: LCD_INT_HANDLER_GBC_MACRO 4,rSTAT
LCD_INT_HANDLER_STAT_GBC_5: LCD_INT_HANDLER_GBC_MACRO 5,rSTAT
LCD_INT_HANDLER_STAT_GBC_6: LCD_INT_HANDLER_GBC_MACRO 6,rSTAT
LCD_INT_HANDLER_STAT_GBC_7: LCD_INT_HANDLER_GBC_MACRO 7,rSTAT
LCD_INT_HANDLER_STAT_GBC_8: LCD_INT_HANDLER_GBC_MACRO 8,rSTAT
LCD_INT_HANDLER_STAT_GBC_9: LCD_INT_HANDLER_GBC_MACRO 9,rSTAT
LCD_INT_HANDLER_STAT_GBC_10: LCD_INT_HANDLER_GBC_MACRO 10,rSTAT
LCD_INT_HANDLER_STAT_GBC_11: LCD_INT_HANDLER_GBC_MACRO 11,rSTAT
LCD_INT_HANDLER_STAT_GBC_12: LCD_INT_HANDLER_GBC_MACRO 12,rSTAT
LCD_INT_HANDLER_STAT_GBC_13: LCD_INT_HANDLER_GBC_MACRO 13,rSTAT
LCD_INT_HANDLER_STAT_GBC_14: LCD_INT_HANDLER_GBC_MACRO 14,rSTAT
LCD_INT_HANDLER_STAT_GBC_15: LCD_INT_HANDLER_GBC_MACRO 15,rSTAT
LCD_INT_HANDLER_STAT_GBC_16: LCD_INT_HANDLER_GBC_MACRO 16,rSTAT
LCD_INT_HANDLER_STAT_GBC_17: LCD_INT_HANDLER_GBC_MACRO 17,rSTAT
LCD_INT_HANDLER_STAT_GBC_18: LCD_INT_HANDLER_GBC_MACRO 18,rSTAT
LCD_INT_HANDLER_STAT_GBC_19: LCD_INT_HANDLER_GBC_MACRO 19,rSTAT
LCD_INT_HANDLER_STAT_GBC_20: LCD_INT_HANDLER_GBC_MACRO 20,rSTAT
LCD_INT_HANDLER_STAT_GBC_21: LCD_INT_HANDLER_GBC_MACRO 21,rSTAT
LCD_INT_HANDLER_STAT_GBC_22: LCD_INT_HANDLER_GBC_MACRO 22,rSTAT
LCD_INT_HANDLER_STAT_GBC_23: LCD_INT_HANDLER_GBC_MACRO 23,rSTAT
LCD_INT_HANDLER_STAT_GBC_24: LCD_INT_HANDLER_GBC_MACRO 24,rSTAT
LCD_INT_HANDLER_STAT_GBC_25: LCD_INT_HANDLER_GBC_MACRO 25,rSTAT
LCD_INT_HANDLER_STAT_GBC_26: LCD_INT_HANDLER_GBC_MACRO 26,rSTAT
LCD_INT_HANDLER_STAT_GBC_27: LCD_INT_HANDLER_GBC_MACRO 27,rSTAT
LCD_INT_HANDLER_STAT_GBC_28: LCD_INT_HANDLER_GBC_MACRO 28,rSTAT
LCD_INT_HANDLER_STAT_GBC_29: LCD_INT_HANDLER_GBC_MACRO 29,rSTAT
LCD_INT_HANDLER_STAT_GBC_30: LCD_INT_HANDLER_GBC_MACRO 30,rSTAT
LCD_INT_HANDLER_STAT_GBC_31: LCD_INT_HANDLER_GBC_MACRO 31,rSTAT

LCD_INT_HANDLER_TIMA_GBC_0: LCD_INT_HANDLER_GBC_MACRO 0,rTIMA
LCD_INT_HANDLER_TIMA_GBC_1: LCD_INT_HANDLER_GBC_MACRO 1,rTIMA
LCD_INT_HANDLER_TIMA_GBC_2: LCD_INT_HANDLER_GBC_MACRO 2,rTIMA
LCD_INT_HANDLER_TIMA_GBC_3: LCD_INT_HANDLER_GBC_MACRO 3,rTIMA
LCD_INT_HANDLER_TIMA_GBC_4: LCD_INT_HANDLER_GBC_MACRO 4,rTIMA
LCD_INT_HANDLER_TIMA_GBC_5: LCD_INT_HANDLER_GBC_MACRO 5,rTIMA
LCD_INT_HANDLER_TIMA_GBC_6: LCD_INT_HANDLER_GBC_MACRO 6,rTIMA
LCD_INT_HANDLER_TIMA_GBC_7: LCD_INT_HANDLER_GBC_MACRO 7,rTIMA
LCD_INT_HANDLER_TIMA_GBC_8: LCD_INT_HANDLER_GBC_MACRO 8,rTIMA
LCD_INT_HANDLER_TIMA_GBC_9: LCD_INT_HANDLER_GBC_MACRO 9,rTIMA
LCD_INT_HANDLER_TIMA_GBC_10: LCD_INT_HANDLER_GBC_MACRO 10,rTIMA
LCD_INT_HANDLER_TIMA_GBC_11: LCD_INT_HANDLER_GBC_MACRO 11,rTIMA
LCD_INT_HANDLER_TIMA_GBC_12: LCD_INT_HANDLER_GBC_MACRO 12,rTIMA
LCD_INT_HANDLER_TIMA_GBC_13: LCD_INT_HANDLER_GBC_MACRO 13,rTIMA
LCD_INT_HANDLER_TIMA_GBC_14: LCD_INT_HANDLER_GBC_MACRO 14,rTIMA
LCD_INT_HANDLER_TIMA_GBC_15: LCD_INT_HANDLER_GBC_MACRO 15,rTIMA
LCD_INT_HANDLER_TIMA_GBC_16: LCD_INT_HANDLER_GBC_MACRO 16,rTIMA
LCD_INT_HANDLER_TIMA_GBC_17: LCD_INT_HANDLER_GBC_MACRO 17,rTIMA
LCD_INT_HANDLER_TIMA_GBC_18: LCD_INT_HANDLER_GBC_MACRO 18,rTIMA
LCD_INT_HANDLER_TIMA_GBC_19: LCD_INT_HANDLER_GBC_MACRO 19,rTIMA
LCD_INT_HANDLER_TIMA_GBC_20: LCD_INT_HANDLER_GBC_MACRO 20,rTIMA
LCD_INT_HANDLER_TIMA_GBC_21: LCD_INT_HANDLER_GBC_MACRO 21,rTIMA
LCD_INT_HANDLER_TIMA_GBC_22: LCD_INT_HANDLER_GBC_MACRO 22,rTIMA
LCD_INT_HANDLER_TIMA_GBC_23: LCD_INT_HANDLER_GBC_MACRO 23,rTIMA
LCD_INT_HANDLER_TIMA_GBC_24: LCD_INT_HANDLER_GBC_MACRO 24,rTIMA
LCD_INT_HANDLER_TIMA_GBC_25: LCD_INT_HANDLER_GBC_MACRO 25,rTIMA
LCD_INT_HANDLER_TIMA_GBC_26: LCD_INT_HANDLER_GBC_MACRO 26,rTIMA
LCD_INT_HANDLER_TIMA_GBC_27: LCD_INT_HANDLER_GBC_MACRO 27,rTIMA
LCD_INT_HANDLER_TIMA_GBC_28: LCD_INT_HANDLER_GBC_MACRO 28,rTIMA
LCD_INT_HANDLER_TIMA_GBC_29: LCD_INT_HANDLER_GBC_MACRO 29,rTIMA
LCD_INT_HANDLER_TIMA_GBC_30: LCD_INT_HANDLER_GBC_MACRO 30,rTIMA
LCD_INT_HANDLER_TIMA_GBC_31: LCD_INT_HANDLER_GBC_MACRO 31,rTIMA

LCD_INT_HANDLER_IF_GBC_0: LCD_INT_HANDLER_GBC_MACRO 0,rIF
LCD_INT_HANDLER_IF_GBC_1: LCD_INT_HANDLER_GBC_MACRO 1,rIF
LCD_INT_HANDLER_IF_GBC_2: LCD_INT_HANDLER_GBC_MACRO 2,rIF
LCD_INT_HANDLER_IF_GBC_3: LCD_INT_HANDLER_GBC_MACRO 3,rIF
LCD_INT_HANDLER_IF_GBC_4: LCD_INT_HANDLER_GBC_MACRO 4,rIF
LCD_INT_HANDLER_IF_GBC_5: LCD_INT_HANDLER_GBC_MACRO 5,rIF
LCD_INT_HANDLER_IF_GBC_6: LCD_INT_HANDLER_GBC_MACRO 6,rIF
LCD_INT_HANDLER_IF_GBC_7: LCD_INT_HANDLER_GBC_MACRO 7,rIF
LCD_INT_HANDLER_IF_GBC_8: LCD_INT_HANDLER_GBC_MACRO 8,rIF
LCD_INT_HANDLER_IF_GBC_9: LCD_INT_HANDLER_GBC_MACRO 9,rIF
LCD_INT_HANDLER_IF_GBC_10: LCD_INT_HANDLER_GBC_MACRO 10,rIF
LCD_INT_HANDLER_IF_GBC_11: LCD_INT_HANDLER_GBC_MACRO 11,rIF
LCD_INT_HANDLER_IF_GBC_12: LCD_INT_HANDLER_GBC_MACRO 12,rIF
LCD_INT_HANDLER_IF_GBC_13: LCD_INT_HANDLER_GBC_MACRO 13,rIF
LCD_INT_HANDLER_IF_GBC_14: LCD_INT_HANDLER_GBC_MACRO 14,rIF
LCD_INT_HANDLER_IF_GBC_15: LCD_INT_HANDLER_GBC_MACRO 15,rIF
LCD_INT_HANDLER_IF_GBC_16: LCD_INT_HANDLER_GBC_MACRO 16,rIF
LCD_INT_HANDLER_IF_GBC_17: LCD_INT_HANDLER_GBC_MACRO 17,rIF
LCD_INT_HANDLER_IF_GBC_18: LCD_INT_HANDLER_GBC_MACRO 18,rIF
LCD_INT_HANDLER_IF_GBC_19: LCD_INT_HANDLER_GBC_MACRO 19,rIF
LCD_INT_HANDLER_IF_GBC_20: LCD_INT_HANDLER_GBC_MACRO 20,rIF
LCD_INT_HANDLER_IF_GBC_21: LCD_INT_HANDLER_GBC_MACRO 21,rIF
LCD_INT_HANDLER_IF_GBC_22: LCD_INT_HANDLER_GBC_MACRO 22,rIF
LCD_INT_HANDLER_IF_GBC_23: LCD_INT_HANDLER_GBC_MACRO 23,rIF
LCD_INT_HANDLER_IF_GBC_24: LCD_INT_HANDLER_GBC_MACRO 24,rIF
LCD_INT_HANDLER_IF_GBC_25: LCD_INT_HANDLER_GBC_MACRO 25,rIF
LCD_INT_HANDLER_IF_GBC_26: LCD_INT_HANDLER_GBC_MACRO 26,rIF
LCD_INT_HANDLER_IF_GBC_27: LCD_INT_HANDLER_GBC_MACRO 27,rIF
LCD_INT_HANDLER_IF_GBC_28: LCD_INT_HANDLER_GBC_MACRO 28,rIF
LCD_INT_HANDLER_IF_GBC_29: LCD_INT_HANDLER_GBC_MACRO 29,rIF
LCD_INT_HANDLER_IF_GBC_30: LCD_INT_HANDLER_GBC_MACRO 30,rIF
LCD_INT_HANDLER_IF_GBC_31: LCD_INT_HANDLER_GBC_MACRO 31,rIF

LCD_INT_HANDLER_LY_GBC_0: LCD_INT_HANDLER_GBC_MACRO 0,rLY
LCD_INT_HANDLER_LY_GBC_1: LCD_INT_HANDLER_GBC_MACRO 1,rLY
LCD_INT_HANDLER_LY_GBC_2: LCD_INT_HANDLER_GBC_MACRO 2,rLY
LCD_INT_HANDLER_LY_GBC_3: LCD_INT_HANDLER_GBC_MACRO 3,rLY
LCD_INT_HANDLER_LY_GBC_4: LCD_INT_HANDLER_GBC_MACRO 4,rLY
LCD_INT_HANDLER_LY_GBC_5: LCD_INT_HANDLER_GBC_MACRO 5,rLY
LCD_INT_HANDLER_LY_GBC_6: LCD_INT_HANDLER_GBC_MACRO 6,rLY
LCD_INT_HANDLER_LY_GBC_7: LCD_INT_HANDLER_GBC_MACRO 7,rLY
LCD_INT_HANDLER_LY_GBC_8: LCD_INT_HANDLER_GBC_MACRO 8,rLY
LCD_INT_HANDLER_LY_GBC_9: LCD_INT_HANDLER_GBC_MACRO 9,rLY
LCD_INT_HANDLER_LY_GBC_10: LCD_INT_HANDLER_GBC_MACRO 10,rLY
LCD_INT_HANDLER_LY_GBC_11: LCD_INT_HANDLER_GBC_MACRO 11,rLY
LCD_INT_HANDLER_LY_GBC_12: LCD_INT_HANDLER_GBC_MACRO 12,rLY
LCD_INT_HANDLER_LY_GBC_13: LCD_INT_HANDLER_GBC_MACRO 13,rLY
LCD_INT_HANDLER_LY_GBC_14: LCD_INT_HANDLER_GBC_MACRO 14,rLY
LCD_INT_HANDLER_LY_GBC_15: LCD_INT_HANDLER_GBC_MACRO 15,rLY
LCD_INT_HANDLER_LY_GBC_16: LCD_INT_HANDLER_GBC_MACRO 16,rLY
LCD_INT_HANDLER_LY_GBC_17: LCD_INT_HANDLER_GBC_MACRO 17,rLY
LCD_INT_HANDLER_LY_GBC_18: LCD_INT_HANDLER_GBC_MACRO 18,rLY
LCD_INT_HANDLER_LY_GBC_19: LCD_INT_HANDLER_GBC_MACRO 19,rLY
LCD_INT_HANDLER_LY_GBC_20: LCD_INT_HANDLER_GBC_MACRO 20,rLY
LCD_INT_HANDLER_LY_GBC_21: LCD_INT_HANDLER_GBC_MACRO 21,rLY
LCD_INT_HANDLER_LY_GBC_22: LCD_INT_HANDLER_GBC_MACRO 22,rLY
LCD_INT_HANDLER_LY_GBC_23: LCD_INT_HANDLER_GBC_MACRO 23,rLY
LCD_INT_HANDLER_LY_GBC_24: LCD_INT_HANDLER_GBC_MACRO 24,rLY
LCD_INT_HANDLER_LY_GBC_25: LCD_INT_HANDLER_GBC_MACRO 25,rLY
LCD_INT_HANDLER_LY_GBC_26: LCD_INT_HANDLER_GBC_MACRO 26,rLY
LCD_INT_HANDLER_LY_GBC_27: LCD_INT_HANDLER_GBC_MACRO 27,rLY
LCD_INT_HANDLER_LY_GBC_28: LCD_INT_HANDLER_GBC_MACRO 28,rLY
LCD_INT_HANDLER_LY_GBC_29: LCD_INT_HANDLER_GBC_MACRO 29,rLY
LCD_INT_HANDLER_LY_GBC_30: LCD_INT_HANDLER_GBC_MACRO 30,rLY
LCD_INT_HANDLER_LY_GBC_31: LCD_INT_HANDLER_GBC_MACRO 31,rLY

; --------------------------------------------------------------

