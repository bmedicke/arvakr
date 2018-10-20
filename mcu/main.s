	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"benbenben"
	.text
.global	send_instructions
	.type	send_instructions, @function
send_instructions:
.LFB6:
	.file 1 "main.c"
	.loc 1 16 26 view -0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 17 3 view .LVU1
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp uart_sendstring
.LVL0:
	.cfi_endproc
.LFE6:
	.size	send_instructions, .-send_instructions
	.section	.rodata.str1.1
.LC1:
	.string	"ben!ben!"
	.text
.global	write_stuff
	.type	write_stuff, @function
write_stuff:
.LFB7:
	.loc 1 20 20 view -0
	.cfi_startproc
	push r16
	.cfi_def_cfa_offset 3
	.cfi_offset 16, -2
	push r17
	.cfi_def_cfa_offset 4
	.cfi_offset 17, -3
	push r28
	.cfi_def_cfa_offset 5
	.cfi_offset 28, -4
	push r29
	.cfi_def_cfa_offset 6
	.cfi_offset 29, -5
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	.loc 1 21 3 view .LVU3
.LVL1:
	.loc 1 22 3 view .LVU4
.LBB2:
	.loc 1 22 8 view .LVU5
	.loc 1 22 8 is_stmt 0 view .LVU6
	ldi r16,lo8(.LC1)
	ldi r17,hi8(.LC1)
	.loc 1 22 12 view .LVU7
	ldi r29,0
	ldi r28,0
.LVL2:
.L3:
	.loc 1 23 5 is_stmt 1 discriminator 3 view .LVU8
	.loc 1 23 44 is_stmt 0 discriminator 3 view .LVU9
	movw r30,r16
	ld r22,Z+
	movw r16,r30
	.loc 1 23 5 discriminator 3 view .LVU10
	movw r24,r28
	call eeprom_update_byte
.LVL3:
	.loc 1 22 26 discriminator 3 view .LVU11
	adiw r28,1
.LVL4:
	.loc 1 22 3 discriminator 3 view .LVU12
	cpi r28,10
	cpc r29,__zero_reg__
	brne .L3
/* epilogue start */
.LBE2:
	.loc 1 24 1 view .LVU13
	pop r29
	pop r28
.LVL5:
	.loc 1 24 1 view .LVU14
	pop r17
	pop r16
	ret
	.cfi_endproc
.LFE7:
	.size	write_stuff, .-write_stuff
.global	read_stuff
	.type	read_stuff, @function
read_stuff:
.LFB8:
	.loc 1 26 19 is_stmt 1 view -0
	.cfi_startproc
	push r28
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 27 3 view .LVU16
.LVL6:
	.loc 1 28 3 view .LVU17
.LBB3:
	.loc 1 28 8 view .LVU18
	.loc 1 28 12 is_stmt 0 view .LVU19
	ldi r29,0
	ldi r28,0
.LVL7:
.L6:
	.loc 1 29 5 is_stmt 1 discriminator 3 view .LVU20
	.loc 1 29 12 is_stmt 0 discriminator 3 view .LVU21
	movw r24,r28
	call eeprom_read_byte
.LVL8:
	.loc 1 30 5 is_stmt 1 discriminator 3 view .LVU22
	call uart_transmit
.LVL9:
	.loc 1 28 26 is_stmt 0 discriminator 3 view .LVU23
	adiw r28,1
.LVL10:
	.loc 1 28 3 discriminator 3 view .LVU24
	cpi r28,10
	cpc r29,__zero_reg__
	brne .L6
/* epilogue start */
.LBE3:
	.loc 1 32 1 view .LVU25
	pop r29
	pop r28
.LVL11:
	.loc 1 32 1 view .LVU26
	ret
	.cfi_endproc
.LFE8:
	.size	read_stuff, .-read_stuff
.global	test
	.type	test, @function
test:
.LFB9:
	.loc 1 34 13 is_stmt 1 view -0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 35 3 view .LVU28
	ldi r24,lo8(49)
	jmp uart_transmit
.LVL12:
	.cfi_endproc
.LFE9:
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB10:
	.loc 1 38 12 view -0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 39 3 view .LVU30
	ldi r22,0
	ldi r23,lo8(-62)
	ldi r24,lo8(1)
	ldi r25,0
	call uart_init
.LVL13:
.L13:
	.loc 1 41 3 view .LVU31
	.loc 1 42 3 view .LVU32
	.loc 1 43 5 view .LVU33
	.loc 1 43 9 is_stmt 0 view .LVU34
	call uart_receive
.LVL14:
	.loc 1 44 5 is_stmt 1 view .LVU35
	cpi r24,lo8(116)
	breq .L11
	cpi r24,lo8(119)
	breq .L12
	cpi r24,lo8(114)
	brne .L13
	.loc 1 46 9 view .LVU36
	call read_stuff
.LVL15:
	.loc 1 47 9 view .LVU37
	rjmp .L13
.LVL16:
.L12:
	.loc 1 49 9 view .LVU38
	call write_stuff
.LVL17:
	.loc 1 50 9 view .LVU39
	rjmp .L13
.LVL18:
.L11:
	.loc 1 52 9 view .LVU40
	call test
.LVL19:
	.loc 1 53 9 view .LVU41
	rjmp .L13
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "uart.h"
	.file 3 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/eeprom.h"
	.file 4 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x252
	.word	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF1671
	.byte	0xc
	.long	.LASF1672
	.long	.LASF1673
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1651
	.uleb128 0x3
	.long	.LASF1674
	.byte	0x4
	.byte	0x7e
	.byte	0x16
	.long	0x3c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1652
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1653
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF1654
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1655
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1656
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1657
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF1658
	.uleb128 0x5
	.long	.LASF1675
	.byte	0x1
	.byte	0x26
	.byte	0x5
	.long	0x43
	.long	.LFB10
	.long	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0xe6
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0x29
	.byte	0x8
	.long	0xe6
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x7
	.long	.LVL13
	.long	0x20d
	.long	0xc1
	.uleb128 0x8
	.uleb128 0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x4
	.byte	0x8
	.byte	0xe1
	.byte	0x39
	.byte	0x24
	.byte	0
	.uleb128 0x9
	.long	.LVL14
	.long	0x219
	.uleb128 0x9
	.long	.LVL15
	.long	0x114
	.uleb128 0x9
	.long	.LVL17
	.long	0x17d
	.uleb128 0x9
	.long	.LVL19
	.long	0xed
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1659
	.uleb128 0xa
	.long	.LASF1660
	.byte	0x1
	.byte	0x22
	.byte	0x6
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x114
	.uleb128 0xb
	.long	.LVL12
	.long	0x225
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x2
	.byte	0x8
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF1661
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.long	.LFB8
	.long	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x17d
	.uleb128 0xc
	.long	.LASF1662
	.byte	0x1
	.byte	0x1b
	.byte	0xb
	.long	0x30
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0xd
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x1c
	.byte	0xc
	.long	0x43
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x7
	.long	.LVL8
	.long	0x231
	.long	0x172
	.uleb128 0x8
	.uleb128 0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x8c
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.long	.LVL9
	.long	0x225
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF1663
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d8
	.uleb128 0xe
	.long	.LASF1676
	.byte	0x1
	.byte	0x15
	.byte	0x9
	.long	0x1d8
	.uleb128 0x6
	.byte	0x3
	.long	.LC1
	.byte	0x9f
	.uleb128 0xd
	.long	.LBB2
	.long	.LBE2-.LBB2
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x16
	.byte	0xc
	.long	0x43
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0xf
	.long	.LVL3
	.long	0x23d
	.uleb128 0x8
	.uleb128 0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x8c
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x2
	.long	0xe6
	.uleb128 0xa
	.long	.LASF1664
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.long	.LFB6
	.long	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x20d
	.uleb128 0xb
	.long	.LVL0
	.long	0x249
	.uleb128 0x8
	.uleb128 0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF1665
	.long	.LASF1665
	.byte	0x2
	.byte	0x4
	.byte	0x6
	.uleb128 0x11
	.long	.LASF1666
	.long	.LASF1666
	.byte	0x2
	.byte	0x6
	.byte	0x9
	.uleb128 0x11
	.long	.LASF1667
	.long	.LASF1667
	.byte	0x2
	.byte	0x5
	.byte	0x6
	.uleb128 0x11
	.long	.LASF1668
	.long	.LASF1668
	.byte	0x3
	.byte	0x89
	.byte	0x9
	.uleb128 0x11
	.long	.LASF1669
	.long	.LASF1669
	.byte	0x3
	.byte	0xbf
	.byte	0x6
	.uleb128 0x11
	.long	.LASF1670
	.long	.LASF1670
	.byte	0x2
	.byte	0x8
	.byte	0x6
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS3:
	.uleb128 .LVU35
	.uleb128 .LVU37
	.uleb128 .LVU38
	.uleb128 .LVU39
	.uleb128 .LVU40
	.uleb128 .LVU41
.LLST3:
	.long	.LVL14
	.long	.LVL15-1
	.word	0x1
	.byte	0x68
	.long	.LVL16
	.long	.LVL17-1
	.word	0x1
	.byte	0x68
	.long	.LVL18
	.long	.LVL19-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LVUS1:
	.uleb128 .LVU17
	.uleb128 .LVU20
	.uleb128 .LVU22
	.uleb128 .LVU23
.LLST1:
	.long	.LVL6
	.long	.LVL7
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL8
	.long	.LVL9-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LVUS2:
	.uleb128 .LVU19
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU26
.LLST2:
	.long	.LVL6
	.long	.LVL7
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL7
	.long	.LVL11
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LVUS0:
	.uleb128 .LVU6
	.uleb128 .LVU8
	.uleb128 .LVU8
	.uleb128 .LVU14
.LLST0:
	.long	.LVL1
	.long	.LVL2
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL2
	.long	.LVL5
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB10
	.long	.LFE10-.LFB10
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB10
	.long	.LFE10
	.long	0
	.long	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.word	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.long	.LASF0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2
	.byte	0x5
	.uleb128 0x4
	.long	.LASF3
	.byte	0x5
	.uleb128 0x5
	.long	.LASF4
	.byte	0x5
	.uleb128 0x6
	.long	.LASF5
	.byte	0x5
	.uleb128 0x7
	.long	.LASF6
	.byte	0x5
	.uleb128 0x8
	.long	.LASF7
	.byte	0x5
	.uleb128 0x9
	.long	.LASF8
	.byte	0x5
	.uleb128 0xa
	.long	.LASF9
	.byte	0x5
	.uleb128 0xb
	.long	.LASF10
	.byte	0x5
	.uleb128 0xc
	.long	.LASF11
	.byte	0x5
	.uleb128 0xd
	.long	.LASF12
	.byte	0x5
	.uleb128 0xe
	.long	.LASF13
	.byte	0x5
	.uleb128 0xf
	.long	.LASF14
	.byte	0x5
	.uleb128 0x10
	.long	.LASF15
	.byte	0x5
	.uleb128 0x11
	.long	.LASF16
	.byte	0x5
	.uleb128 0x12
	.long	.LASF17
	.byte	0x5
	.uleb128 0x13
	.long	.LASF18
	.byte	0x5
	.uleb128 0x14
	.long	.LASF19
	.byte	0x5
	.uleb128 0x15
	.long	.LASF20
	.byte	0x5
	.uleb128 0x16
	.long	.LASF21
	.byte	0x5
	.uleb128 0x17
	.long	.LASF22
	.byte	0x5
	.uleb128 0x18
	.long	.LASF23
	.byte	0x5
	.uleb128 0x19
	.long	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF30
	.byte	0x5
	.uleb128 0x20
	.long	.LASF31
	.byte	0x5
	.uleb128 0x21
	.long	.LASF32
	.byte	0x5
	.uleb128 0x22
	.long	.LASF33
	.byte	0x5
	.uleb128 0x23
	.long	.LASF34
	.byte	0x5
	.uleb128 0x24
	.long	.LASF35
	.byte	0x5
	.uleb128 0x25
	.long	.LASF36
	.byte	0x5
	.uleb128 0x26
	.long	.LASF37
	.byte	0x5
	.uleb128 0x27
	.long	.LASF38
	.byte	0x5
	.uleb128 0x28
	.long	.LASF39
	.byte	0x5
	.uleb128 0x29
	.long	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF46
	.byte	0x5
	.uleb128 0x30
	.long	.LASF47
	.byte	0x5
	.uleb128 0x31
	.long	.LASF48
	.byte	0x5
	.uleb128 0x32
	.long	.LASF49
	.byte	0x5
	.uleb128 0x33
	.long	.LASF50
	.byte	0x5
	.uleb128 0x34
	.long	.LASF51
	.byte	0x5
	.uleb128 0x35
	.long	.LASF52
	.byte	0x5
	.uleb128 0x36
	.long	.LASF53
	.byte	0x5
	.uleb128 0x37
	.long	.LASF54
	.byte	0x5
	.uleb128 0x38
	.long	.LASF55
	.byte	0x5
	.uleb128 0x39
	.long	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF62
	.byte	0x5
	.uleb128 0x40
	.long	.LASF63
	.byte	0x5
	.uleb128 0x41
	.long	.LASF64
	.byte	0x5
	.uleb128 0x42
	.long	.LASF65
	.byte	0x5
	.uleb128 0x43
	.long	.LASF66
	.byte	0x5
	.uleb128 0x44
	.long	.LASF67
	.byte	0x5
	.uleb128 0x45
	.long	.LASF68
	.byte	0x5
	.uleb128 0x46
	.long	.LASF69
	.byte	0x5
	.uleb128 0x47
	.long	.LASF70
	.byte	0x5
	.uleb128 0x48
	.long	.LASF71
	.byte	0x5
	.uleb128 0x49
	.long	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF78
	.byte	0x5
	.uleb128 0x50
	.long	.LASF79
	.byte	0x5
	.uleb128 0x51
	.long	.LASF80
	.byte	0x5
	.uleb128 0x52
	.long	.LASF81
	.byte	0x5
	.uleb128 0x53
	.long	.LASF82
	.byte	0x5
	.uleb128 0x54
	.long	.LASF83
	.byte	0x5
	.uleb128 0x55
	.long	.LASF84
	.byte	0x5
	.uleb128 0x56
	.long	.LASF85
	.byte	0x5
	.uleb128 0x57
	.long	.LASF86
	.byte	0x5
	.uleb128 0x58
	.long	.LASF87
	.byte	0x5
	.uleb128 0x59
	.long	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF94
	.byte	0x5
	.uleb128 0x60
	.long	.LASF95
	.byte	0x5
	.uleb128 0x61
	.long	.LASF96
	.byte	0x5
	.uleb128 0x62
	.long	.LASF97
	.byte	0x5
	.uleb128 0x63
	.long	.LASF98
	.byte	0x5
	.uleb128 0x64
	.long	.LASF99
	.byte	0x5
	.uleb128 0x65
	.long	.LASF100
	.byte	0x5
	.uleb128 0x66
	.long	.LASF101
	.byte	0x5
	.uleb128 0x67
	.long	.LASF102
	.byte	0x5
	.uleb128 0x68
	.long	.LASF103
	.byte	0x5
	.uleb128 0x69
	.long	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF110
	.byte	0x5
	.uleb128 0x70
	.long	.LASF111
	.byte	0x5
	.uleb128 0x71
	.long	.LASF112
	.byte	0x5
	.uleb128 0x72
	.long	.LASF113
	.byte	0x5
	.uleb128 0x73
	.long	.LASF114
	.byte	0x5
	.uleb128 0x74
	.long	.LASF115
	.byte	0x5
	.uleb128 0x75
	.long	.LASF116
	.byte	0x5
	.uleb128 0x76
	.long	.LASF117
	.byte	0x5
	.uleb128 0x77
	.long	.LASF118
	.byte	0x5
	.uleb128 0x78
	.long	.LASF119
	.byte	0x5
	.uleb128 0x79
	.long	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF126
	.byte	0x5
	.uleb128 0x80
	.long	.LASF127
	.byte	0x5
	.uleb128 0x81
	.long	.LASF128
	.byte	0x5
	.uleb128 0x82
	.long	.LASF129
	.byte	0x5
	.uleb128 0x83
	.long	.LASF130
	.byte	0x5
	.uleb128 0x84
	.long	.LASF131
	.byte	0x5
	.uleb128 0x85
	.long	.LASF132
	.byte	0x5
	.uleb128 0x86
	.long	.LASF133
	.byte	0x5
	.uleb128 0x87
	.long	.LASF134
	.byte	0x5
	.uleb128 0x88
	.long	.LASF135
	.byte	0x5
	.uleb128 0x89
	.long	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF142
	.byte	0x5
	.uleb128 0x90
	.long	.LASF143
	.byte	0x5
	.uleb128 0x91
	.long	.LASF144
	.byte	0x5
	.uleb128 0x92
	.long	.LASF145
	.byte	0x5
	.uleb128 0x93
	.long	.LASF146
	.byte	0x5
	.uleb128 0x94
	.long	.LASF147
	.byte	0x5
	.uleb128 0x95
	.long	.LASF148
	.byte	0x5
	.uleb128 0x96
	.long	.LASF149
	.byte	0x5
	.uleb128 0x97
	.long	.LASF150
	.byte	0x5
	.uleb128 0x98
	.long	.LASF151
	.byte	0x5
	.uleb128 0x99
	.long	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF169
	.byte	0x5
	.uleb128 0xab
	.long	.LASF170
	.byte	0x5
	.uleb128 0xac
	.long	.LASF171
	.byte	0x5
	.uleb128 0xad
	.long	.LASF172
	.byte	0x5
	.uleb128 0xae
	.long	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF184
	.byte	0x5
	.uleb128 0xba
	.long	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF200
	.byte	0x5
	.uleb128 0xca
	.long	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF204
	.byte	0x5
	.uleb128 0xce
	.long	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF216
	.byte	0x5
	.uleb128 0xda
	.long	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF220
	.byte	0x5
	.uleb128 0xde
	.long	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF232
	.byte	0x5
	.uleb128 0xea
	.long	.LASF233
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF234
	.byte	0x5
	.uleb128 0xec
	.long	.LASF235
	.byte	0x5
	.uleb128 0xed
	.long	.LASF236
	.byte	0x5
	.uleb128 0xee
	.long	.LASF237
	.byte	0x5
	.uleb128 0xef
	.long	.LASF238
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF239
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF240
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF241
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF242
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF243
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF244
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF245
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF246
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF247
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF248
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF249
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF250
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF251
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF252
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF253
	.byte	0x5
	.uleb128 0xff
	.long	.LASF254
	.byte	0x5
	.uleb128 0x100
	.long	.LASF255
	.byte	0x5
	.uleb128 0x101
	.long	.LASF256
	.byte	0x5
	.uleb128 0x102
	.long	.LASF257
	.byte	0x5
	.uleb128 0x103
	.long	.LASF258
	.byte	0x5
	.uleb128 0x104
	.long	.LASF259
	.byte	0x5
	.uleb128 0x105
	.long	.LASF260
	.byte	0x5
	.uleb128 0x106
	.long	.LASF261
	.byte	0x5
	.uleb128 0x107
	.long	.LASF262
	.byte	0x5
	.uleb128 0x108
	.long	.LASF263
	.byte	0x5
	.uleb128 0x109
	.long	.LASF264
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF265
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF266
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF267
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF268
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF269
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF270
	.byte	0x5
	.uleb128 0x110
	.long	.LASF271
	.byte	0x5
	.uleb128 0x111
	.long	.LASF272
	.byte	0x5
	.uleb128 0x112
	.long	.LASF273
	.byte	0x5
	.uleb128 0x113
	.long	.LASF274
	.byte	0x5
	.uleb128 0x114
	.long	.LASF275
	.byte	0x5
	.uleb128 0x115
	.long	.LASF276
	.byte	0x5
	.uleb128 0x116
	.long	.LASF277
	.byte	0x5
	.uleb128 0x117
	.long	.LASF278
	.byte	0x5
	.uleb128 0x118
	.long	.LASF279
	.byte	0x5
	.uleb128 0x119
	.long	.LASF280
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF281
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF282
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF283
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF284
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF285
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF286
	.byte	0x5
	.uleb128 0x120
	.long	.LASF287
	.byte	0x5
	.uleb128 0x121
	.long	.LASF288
	.byte	0x5
	.uleb128 0x122
	.long	.LASF289
	.byte	0x5
	.uleb128 0x123
	.long	.LASF290
	.byte	0x5
	.uleb128 0x124
	.long	.LASF291
	.byte	0x5
	.uleb128 0x125
	.long	.LASF292
	.byte	0x5
	.uleb128 0x126
	.long	.LASF293
	.byte	0x5
	.uleb128 0x127
	.long	.LASF294
	.byte	0x5
	.uleb128 0x128
	.long	.LASF295
	.byte	0x5
	.uleb128 0x129
	.long	.LASF296
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF297
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF298
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF299
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF300
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF301
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF302
	.byte	0x5
	.uleb128 0x130
	.long	.LASF303
	.byte	0x5
	.uleb128 0x131
	.long	.LASF304
	.byte	0x5
	.uleb128 0x132
	.long	.LASF305
	.byte	0x5
	.uleb128 0x133
	.long	.LASF306
	.byte	0x5
	.uleb128 0x134
	.long	.LASF307
	.byte	0x5
	.uleb128 0x135
	.long	.LASF308
	.byte	0x5
	.uleb128 0x136
	.long	.LASF309
	.byte	0x5
	.uleb128 0x137
	.long	.LASF310
	.byte	0x5
	.uleb128 0x138
	.long	.LASF311
	.byte	0x5
	.uleb128 0x139
	.long	.LASF312
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF313
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF314
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF315
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF316
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF317
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF318
	.byte	0x5
	.uleb128 0x140
	.long	.LASF319
	.byte	0x5
	.uleb128 0x141
	.long	.LASF320
	.byte	0x5
	.uleb128 0x142
	.long	.LASF321
	.byte	0x5
	.uleb128 0x143
	.long	.LASF322
	.byte	0x5
	.uleb128 0x144
	.long	.LASF323
	.byte	0x5
	.uleb128 0x145
	.long	.LASF324
	.byte	0x5
	.uleb128 0x146
	.long	.LASF325
	.byte	0x5
	.uleb128 0x147
	.long	.LASF326
	.byte	0x5
	.uleb128 0x148
	.long	.LASF327
	.byte	0x5
	.uleb128 0x149
	.long	.LASF328
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF329
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF330
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF331
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF332
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF333
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF334
	.byte	0x5
	.uleb128 0x150
	.long	.LASF335
	.byte	0x5
	.uleb128 0x151
	.long	.LASF336
	.byte	0x5
	.uleb128 0x152
	.long	.LASF337
	.byte	0x5
	.uleb128 0x153
	.long	.LASF338
	.byte	0x5
	.uleb128 0x154
	.long	.LASF339
	.byte	0x5
	.uleb128 0x155
	.long	.LASF340
	.byte	0x5
	.uleb128 0x156
	.long	.LASF341
	.byte	0x5
	.uleb128 0x157
	.long	.LASF342
	.byte	0x5
	.uleb128 0x158
	.long	.LASF343
	.byte	0x5
	.uleb128 0x159
	.long	.LASF344
	.byte	0x5
	.uleb128 0x15a
	.long	.LASF345
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF346
	.byte	0x5
	.uleb128 0x15c
	.long	.LASF347
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF348
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF349
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF350
	.byte	0x5
	.uleb128 0x160
	.long	.LASF351
	.byte	0x5
	.uleb128 0x161
	.long	.LASF352
	.byte	0x5
	.uleb128 0x162
	.long	.LASF353
	.byte	0x5
	.uleb128 0x163
	.long	.LASF354
	.byte	0x5
	.uleb128 0x164
	.long	.LASF355
	.byte	0x5
	.uleb128 0x165
	.long	.LASF356
	.byte	0x5
	.uleb128 0x166
	.long	.LASF357
	.byte	0x5
	.uleb128 0x167
	.long	.LASF358
	.byte	0x5
	.uleb128 0x168
	.long	.LASF359
	.byte	0x5
	.uleb128 0x169
	.long	.LASF360
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF361
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF362
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF363
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF364
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF365
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF366
	.byte	0x5
	.uleb128 0x170
	.long	.LASF367
	.byte	0x5
	.uleb128 0x171
	.long	.LASF368
	.byte	0x5
	.uleb128 0x172
	.long	.LASF369
	.byte	0x5
	.uleb128 0x173
	.long	.LASF370
	.byte	0x5
	.uleb128 0x174
	.long	.LASF371
	.byte	0x5
	.uleb128 0x175
	.long	.LASF372
	.byte	0x5
	.uleb128 0x176
	.long	.LASF373
	.byte	0x5
	.uleb128 0x177
	.long	.LASF374
	.byte	0x5
	.uleb128 0x178
	.long	.LASF375
	.byte	0x5
	.uleb128 0x179
	.long	.LASF376
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF377
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF378
	.byte	0x5
	.uleb128 0x17c
	.long	.LASF379
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF380
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF381
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF382
	.byte	0x5
	.uleb128 0x180
	.long	.LASF383
	.byte	0x5
	.uleb128 0x181
	.long	.LASF384
	.byte	0x5
	.uleb128 0x182
	.long	.LASF385
	.byte	0x5
	.uleb128 0x183
	.long	.LASF386
	.byte	0x5
	.uleb128 0x184
	.long	.LASF387
	.byte	0x5
	.uleb128 0x185
	.long	.LASF388
	.byte	0x5
	.uleb128 0x186
	.long	.LASF389
	.byte	0x5
	.uleb128 0x187
	.long	.LASF390
	.byte	0x5
	.uleb128 0x188
	.long	.LASF391
	.byte	0x5
	.uleb128 0x189
	.long	.LASF392
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF393
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF394
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF395
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF396
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF397
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF398
	.byte	0x5
	.uleb128 0x190
	.long	.LASF399
	.byte	0x5
	.uleb128 0x191
	.long	.LASF400
	.byte	0x5
	.uleb128 0x192
	.long	.LASF401
	.byte	0x5
	.uleb128 0x193
	.long	.LASF402
	.byte	0x5
	.uleb128 0x194
	.long	.LASF403
	.byte	0x5
	.uleb128 0x195
	.long	.LASF404
	.byte	0x5
	.uleb128 0x196
	.long	.LASF405
	.byte	0x5
	.uleb128 0x197
	.long	.LASF406
	.byte	0x5
	.uleb128 0x198
	.long	.LASF407
	.byte	0x5
	.uleb128 0x199
	.long	.LASF408
	.byte	0x5
	.uleb128 0x19a
	.long	.LASF409
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF410
	.byte	0x5
	.uleb128 0x19c
	.long	.LASF411
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF412
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF413
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF414
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF415
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF416
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF417
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF418
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF419
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF420
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF421
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF422
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF423
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF424
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF425
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF426
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF427
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF428
	.byte	0x5
	.uleb128 0x1ae
	.long	.LASF429
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF430
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF431
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF432
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF433
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF434
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF435
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF436
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF437
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF438
	.byte	0x5
	.uleb128 0x1b8
	.long	.LASF439
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF440
	.byte	0x5
	.uleb128 0x1ba
	.long	.LASF441
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF442
	.byte	0x5
	.uleb128 0x1bc
	.long	.LASF443
	.byte	0x5
	.uleb128 0x1bd
	.long	.LASF444
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF445
	.byte	0x5
	.uleb128 0x1bf
	.long	.LASF446
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF447
	.byte	0x5
	.uleb128 0x1c1
	.long	.LASF448
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF449
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF450
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF451
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF452
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF453
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF454
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF455
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF456
	.byte	0x5
	.uleb128 0x1ca
	.long	.LASF457
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1cc
	.long	.LASF459
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF460
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF461
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF462
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF463
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF464
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF465
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF466
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF467
	.byte	0x5
	.uleb128 0x1d5
	.long	.LASF468
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF469
	.byte	0x5
	.uleb128 0x1d7
	.long	.LASF470
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF471
	.byte	0x5
	.uleb128 0x1
	.long	.LASF472
	.byte	0x5
	.uleb128 0x2
	.long	.LASF473
	.byte	0x5
	.uleb128 0x3
	.long	.LASF474
	.byte	0x5
	.uleb128 0x4
	.long	.LASF475
	.byte	0x5
	.uleb128 0x5
	.long	.LASF476
	.file 5 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/io.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x61
	.long	.LASF477
	.file 6 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/sfr_defs.h"
	.byte	0x3
	.uleb128 0x63
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro2
	.file 7 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/inttypes.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x23
	.long	.LASF480
	.file 8 "/usr/local/Cellar/avr-gcc/8.2.0/lib/avr-gcc/8/gcc/avr/8.2.0/include/stdint.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x8
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro3
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF546
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 9 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/iom328p.h"
	.byte	0x3
	.uleb128 0xfc
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 10 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/portpins.h"
	.byte	0x3
	.uleb128 0x249
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.file 11 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/common.h"
	.byte	0x3
	.uleb128 0x24b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 12 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/version.h"
	.byte	0x3
	.uleb128 0x24d
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 13 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/fuse.h"
	.byte	0x3
	.uleb128 0x254
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.file 14 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/lock.h"
	.byte	0x3
	.uleb128 0x257
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x4
	.file 15 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/util/delay.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro12
	.file 16 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/util/delay_basic.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1518
	.byte	0x4
	.file 17 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/math.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x4
	.file 18 "/usr/local/Cellar/avr-gcc/8.2.0/avr/include/avr/interrupt.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1587
	.file 19 "/usr/local/Cellar/avr-gcc/8.2.0/lib/avr-gcc/8/gcc/avr/8.2.0/include/stddef.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.file 20 "timer.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1649
	.byte	0x4
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1650
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sfr_defs.h.36.473802ecbcb5d4d38de6c7efbfcd3c60,comdat
.Ldebug_macro2:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF478
	.byte	0x5
	.uleb128 0x79
	.long	.LASF479
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.41.052d062c327f27e210bb72c3d087afe5,comdat
.Ldebug_macro3:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF481
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF482
	.byte	0x5
	.uleb128 0x122
	.long	.LASF483
	.byte	0x5
	.uleb128 0x123
	.long	.LASF484
	.byte	0x5
	.uleb128 0x133
	.long	.LASF485
	.byte	0x5
	.uleb128 0x138
	.long	.LASF486
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF487
	.byte	0x5
	.uleb128 0x150
	.long	.LASF488
	.byte	0x5
	.uleb128 0x155
	.long	.LASF489
	.byte	0x5
	.uleb128 0x15a
	.long	.LASF490
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF491
	.byte	0x5
	.uleb128 0x164
	.long	.LASF492
	.byte	0x5
	.uleb128 0x169
	.long	.LASF493
	.byte	0x5
	.uleb128 0x170
	.long	.LASF494
	.byte	0x5
	.uleb128 0x175
	.long	.LASF495
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF496
	.byte	0x5
	.uleb128 0x184
	.long	.LASF497
	.byte	0x5
	.uleb128 0x189
	.long	.LASF498
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF499
	.byte	0x5
	.uleb128 0x193
	.long	.LASF500
	.byte	0x5
	.uleb128 0x198
	.long	.LASF501
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF504
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF505
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF506
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF507
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF508
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF509
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF510
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF511
	.byte	0x5
	.uleb128 0x1d5
	.long	.LASF512
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF513
	.byte	0x5
	.uleb128 0x1df
	.long	.LASF514
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF515
	.byte	0x5
	.uleb128 0x1e9
	.long	.LASF516
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF517
	.byte	0x5
	.uleb128 0x1f3
	.long	.LASF518
	.byte	0x5
	.uleb128 0x1f8
	.long	.LASF519
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF520
	.byte	0x5
	.uleb128 0x208
	.long	.LASF521
	.byte	0x5
	.uleb128 0x20d
	.long	.LASF522
	.byte	0x5
	.uleb128 0x212
	.long	.LASF523
	.byte	0x5
	.uleb128 0x21d
	.long	.LASF524
	.byte	0x5
	.uleb128 0x222
	.long	.LASF525
	.byte	0x5
	.uleb128 0x227
	.long	.LASF526
	.byte	0x5
	.uleb128 0x234
	.long	.LASF527
	.byte	0x5
	.uleb128 0x239
	.long	.LASF528
	.byte	0x5
	.uleb128 0x242
	.long	.LASF529
	.byte	0x5
	.uleb128 0x247
	.long	.LASF530
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF531
	.byte	0x5
	.uleb128 0x259
	.long	.LASF532
	.byte	0x5
	.uleb128 0x25a
	.long	.LASF533
	.byte	0x5
	.uleb128 0x25d
	.long	.LASF534
	.byte	0x5
	.uleb128 0x25e
	.long	.LASF535
	.byte	0x5
	.uleb128 0x271
	.long	.LASF536
	.byte	0x5
	.uleb128 0x272
	.long	.LASF537
	.byte	0x5
	.uleb128 0x273
	.long	.LASF538
	.byte	0x5
	.uleb128 0x274
	.long	.LASF539
	.byte	0x5
	.uleb128 0x275
	.long	.LASF540
	.byte	0x5
	.uleb128 0x276
	.long	.LASF541
	.byte	0x5
	.uleb128 0x277
	.long	.LASF542
	.byte	0x5
	.uleb128 0x278
	.long	.LASF543
	.byte	0x5
	.uleb128 0x279
	.long	.LASF544
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF545
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.inttypes.h.96.afb9c4be73a069861f8689c997efc518,comdat
.Ldebug_macro4:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x60
	.long	.LASF547
	.byte	0x5
	.uleb128 0x63
	.long	.LASF548
	.byte	0x5
	.uleb128 0x66
	.long	.LASF549
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF550
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF551
	.byte	0x5
	.uleb128 0x70
	.long	.LASF552
	.byte	0x5
	.uleb128 0x75
	.long	.LASF553
	.byte	0x5
	.uleb128 0x78
	.long	.LASF554
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF555
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF556
	.byte	0x5
	.uleb128 0x82
	.long	.LASF557
	.byte	0x5
	.uleb128 0x85
	.long	.LASF558
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF559
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF560
	.byte	0x5
	.uleb128 0x90
	.long	.LASF561
	.byte	0x5
	.uleb128 0x94
	.long	.LASF562
	.byte	0x5
	.uleb128 0x97
	.long	.LASF563
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF564
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF565
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF566
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF567
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF568
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF569
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF570
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF571
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF572
	.byte	0x5
	.uleb128 0xca
	.long	.LASF573
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF574
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF575
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF576
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF577
	.byte	0x5
	.uleb128 0xda
	.long	.LASF578
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF579
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF580
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF581
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF582
	.byte	0x5
	.uleb128 0xec
	.long	.LASF583
	.byte	0x5
	.uleb128 0xef
	.long	.LASF584
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF585
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF586
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF587
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF588
	.byte	0x5
	.uleb128 0x100
	.long	.LASF589
	.byte	0x5
	.uleb128 0x103
	.long	.LASF590
	.byte	0x5
	.uleb128 0x108
	.long	.LASF591
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF592
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF593
	.byte	0x5
	.uleb128 0x112
	.long	.LASF594
	.byte	0x5
	.uleb128 0x115
	.long	.LASF595
	.byte	0x5
	.uleb128 0x118
	.long	.LASF596
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF597
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF598
	.byte	0x5
	.uleb128 0x122
	.long	.LASF599
	.byte	0x5
	.uleb128 0x126
	.long	.LASF600
	.byte	0x5
	.uleb128 0x129
	.long	.LASF601
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF602
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF603
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF604
	.byte	0x5
	.uleb128 0x150
	.long	.LASF605
	.byte	0x5
	.uleb128 0x153
	.long	.LASF606
	.byte	0x5
	.uleb128 0x158
	.long	.LASF607
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF608
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF609
	.byte	0x5
	.uleb128 0x162
	.long	.LASF610
	.byte	0x5
	.uleb128 0x165
	.long	.LASF611
	.byte	0x5
	.uleb128 0x168
	.long	.LASF612
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF613
	.byte	0x5
	.uleb128 0x170
	.long	.LASF614
	.byte	0x5
	.uleb128 0x173
	.long	.LASF615
	.byte	0x5
	.uleb128 0x177
	.long	.LASF616
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF617
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF618
	.byte	0x5
	.uleb128 0x182
	.long	.LASF619
	.byte	0x5
	.uleb128 0x185
	.long	.LASF620
	.byte	0x5
	.uleb128 0x188
	.long	.LASF621
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF622
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF623
	.byte	0x5
	.uleb128 0x192
	.long	.LASF624
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF625
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF626
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF627
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF628
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF629
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF630
	.byte	0x5
	.uleb128 0x1ba
	.long	.LASF631
	.byte	0x5
	.uleb128 0x1bd
	.long	.LASF632
	.byte	0x5
	.uleb128 0x1c1
	.long	.LASF633
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF634
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF635
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF636
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF637
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF638
	.byte	0x5
	.uleb128 0x1d5
	.long	.LASF639
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF640
	.byte	0x5
	.uleb128 0x1db
	.long	.LASF641
	.byte	0x5
	.uleb128 0x1df
	.long	.LASF642
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF643
	.byte	0x5
	.uleb128 0x1e5
	.long	.LASF644
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF645
	.byte	0x5
	.uleb128 0x1ed
	.long	.LASF646
	.byte	0x5
	.uleb128 0x1f0
	.long	.LASF647
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF648
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF649
	.byte	0x5
	.uleb128 0x1fa
	.long	.LASF650
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF651
	.byte	0x5
	.uleb128 0x201
	.long	.LASF652
	.byte	0x5
	.uleb128 0x204
	.long	.LASF653
	.byte	0x5
	.uleb128 0x21d
	.long	.LASF654
	.byte	0x5
	.uleb128 0x220
	.long	.LASF655
	.byte	0x5
	.uleb128 0x223
	.long	.LASF656
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sfr_defs.h.128.38ceebe2fb099c106e85a566519e0f1a,comdat
.Ldebug_macro5:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x80
	.long	.LASF657
	.byte	0x5
	.uleb128 0x81
	.long	.LASF658
	.byte	0x5
	.uleb128 0x82
	.long	.LASF659
	.byte	0x5
	.uleb128 0xac
	.long	.LASF660
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF661
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF662
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF663
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF664
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF665
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF666
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF667
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF668
	.byte	0x5
	.uleb128 0xba
	.long	.LASF669
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF670
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF671
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF672
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF673
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF674
	.byte	0x5
	.uleb128 0xea
	.long	.LASF675
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF676
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF677
	.byte	0x5
	.uleb128 0x107
	.long	.LASF678
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.iom328p.h.43.0c7baa2d43beaeb768c087c99a62584d,comdat
.Ldebug_macro6:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF679
	.byte	0x5
	.uleb128 0x32
	.long	.LASF680
	.byte	0x5
	.uleb128 0x36
	.long	.LASF681
	.byte	0x5
	.uleb128 0x37
	.long	.LASF682
	.byte	0x5
	.uleb128 0x38
	.long	.LASF683
	.byte	0x5
	.uleb128 0x39
	.long	.LASF684
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF687
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF688
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF689
	.byte	0x5
	.uleb128 0x40
	.long	.LASF690
	.byte	0x5
	.uleb128 0x41
	.long	.LASF691
	.byte	0x5
	.uleb128 0x42
	.long	.LASF692
	.byte	0x5
	.uleb128 0x43
	.long	.LASF693
	.byte	0x5
	.uleb128 0x44
	.long	.LASF694
	.byte	0x5
	.uleb128 0x45
	.long	.LASF695
	.byte	0x5
	.uleb128 0x46
	.long	.LASF696
	.byte	0x5
	.uleb128 0x47
	.long	.LASF697
	.byte	0x5
	.uleb128 0x48
	.long	.LASF698
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF699
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF700
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF701
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF702
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF703
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF704
	.byte	0x5
	.uleb128 0x50
	.long	.LASF705
	.byte	0x5
	.uleb128 0x51
	.long	.LASF706
	.byte	0x5
	.uleb128 0x52
	.long	.LASF707
	.byte	0x5
	.uleb128 0x54
	.long	.LASF708
	.byte	0x5
	.uleb128 0x55
	.long	.LASF709
	.byte	0x5
	.uleb128 0x56
	.long	.LASF710
	.byte	0x5
	.uleb128 0x57
	.long	.LASF711
	.byte	0x5
	.uleb128 0x58
	.long	.LASF712
	.byte	0x5
	.uleb128 0x59
	.long	.LASF713
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF714
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF715
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF716
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF717
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF718
	.byte	0x5
	.uleb128 0x60
	.long	.LASF719
	.byte	0x5
	.uleb128 0x61
	.long	.LASF720
	.byte	0x5
	.uleb128 0x62
	.long	.LASF721
	.byte	0x5
	.uleb128 0x63
	.long	.LASF722
	.byte	0x5
	.uleb128 0x64
	.long	.LASF723
	.byte	0x5
	.uleb128 0x66
	.long	.LASF724
	.byte	0x5
	.uleb128 0x67
	.long	.LASF725
	.byte	0x5
	.uleb128 0x68
	.long	.LASF726
	.byte	0x5
	.uleb128 0x69
	.long	.LASF727
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF728
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF729
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF730
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF731
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF732
	.byte	0x5
	.uleb128 0x70
	.long	.LASF733
	.byte	0x5
	.uleb128 0x71
	.long	.LASF734
	.byte	0x5
	.uleb128 0x72
	.long	.LASF735
	.byte	0x5
	.uleb128 0x73
	.long	.LASF736
	.byte	0x5
	.uleb128 0x74
	.long	.LASF737
	.byte	0x5
	.uleb128 0x75
	.long	.LASF738
	.byte	0x5
	.uleb128 0x76
	.long	.LASF739
	.byte	0x5
	.uleb128 0x77
	.long	.LASF740
	.byte	0x5
	.uleb128 0x79
	.long	.LASF741
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF742
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF743
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF744
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF745
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF746
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF747
	.byte	0x5
	.uleb128 0x80
	.long	.LASF748
	.byte	0x5
	.uleb128 0x81
	.long	.LASF749
	.byte	0x5
	.uleb128 0x83
	.long	.LASF750
	.byte	0x5
	.uleb128 0x84
	.long	.LASF751
	.byte	0x5
	.uleb128 0x85
	.long	.LASF752
	.byte	0x5
	.uleb128 0x86
	.long	.LASF753
	.byte	0x5
	.uleb128 0x87
	.long	.LASF754
	.byte	0x5
	.uleb128 0x88
	.long	.LASF755
	.byte	0x5
	.uleb128 0x89
	.long	.LASF756
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF757
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF758
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF759
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF760
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF761
	.byte	0x5
	.uleb128 0x90
	.long	.LASF762
	.byte	0x5
	.uleb128 0x92
	.long	.LASF763
	.byte	0x5
	.uleb128 0x93
	.long	.LASF764
	.byte	0x5
	.uleb128 0x94
	.long	.LASF765
	.byte	0x5
	.uleb128 0x95
	.long	.LASF766
	.byte	0x5
	.uleb128 0x96
	.long	.LASF767
	.byte	0x5
	.uleb128 0x98
	.long	.LASF768
	.byte	0x5
	.uleb128 0x99
	.long	.LASF769
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF770
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF771
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF772
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF773
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF774
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF775
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF776
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF777
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF778
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF779
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF780
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF781
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF782
	.byte	0x5
	.uleb128 0xab
	.long	.LASF783
	.byte	0x5
	.uleb128 0xac
	.long	.LASF784
	.byte	0x5
	.uleb128 0xad
	.long	.LASF785
	.byte	0x5
	.uleb128 0xae
	.long	.LASF786
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF787
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF788
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF789
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF790
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF791
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF792
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF793
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF794
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF795
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF796
	.byte	0x5
	.uleb128 0xba
	.long	.LASF797
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF798
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF799
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF800
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF801
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF802
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF803
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF804
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF805
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF806
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF807
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF808
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF809
	.byte	0x5
	.uleb128 0xca
	.long	.LASF810
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF811
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF812
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF813
	.byte	0x5
	.uleb128 0xce
	.long	.LASF814
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF815
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF816
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF817
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF818
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF819
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF820
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF821
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF822
	.byte	0x5
	.uleb128 0xda
	.long	.LASF823
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF824
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF825
	.byte	0x5
	.uleb128 0xde
	.long	.LASF826
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF827
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF828
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF829
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF830
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF831
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF832
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF833
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF834
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF835
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF836
	.byte	0x5
	.uleb128 0xea
	.long	.LASF837
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF838
	.byte	0x5
	.uleb128 0xed
	.long	.LASF839
	.byte	0x5
	.uleb128 0xee
	.long	.LASF840
	.byte	0x5
	.uleb128 0xef
	.long	.LASF841
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF842
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF843
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF844
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF845
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF846
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF847
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF848
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF849
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF850
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF851
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF852
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF853
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF854
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF855
	.byte	0x5
	.uleb128 0xff
	.long	.LASF856
	.byte	0x5
	.uleb128 0x101
	.long	.LASF857
	.byte	0x5
	.uleb128 0x102
	.long	.LASF858
	.byte	0x5
	.uleb128 0x103
	.long	.LASF859
	.byte	0x5
	.uleb128 0x104
	.long	.LASF860
	.byte	0x5
	.uleb128 0x105
	.long	.LASF861
	.byte	0x5
	.uleb128 0x106
	.long	.LASF862
	.byte	0x5
	.uleb128 0x107
	.long	.LASF863
	.byte	0x5
	.uleb128 0x108
	.long	.LASF864
	.byte	0x5
	.uleb128 0x109
	.long	.LASF865
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF866
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF867
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF868
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF869
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF870
	.byte	0x5
	.uleb128 0x110
	.long	.LASF871
	.byte	0x5
	.uleb128 0x111
	.long	.LASF872
	.byte	0x5
	.uleb128 0x112
	.long	.LASF873
	.byte	0x5
	.uleb128 0x113
	.long	.LASF874
	.byte	0x5
	.uleb128 0x115
	.long	.LASF875
	.byte	0x5
	.uleb128 0x116
	.long	.LASF876
	.byte	0x5
	.uleb128 0x117
	.long	.LASF877
	.byte	0x5
	.uleb128 0x118
	.long	.LASF878
	.byte	0x5
	.uleb128 0x119
	.long	.LASF879
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF880
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF881
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF882
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF883
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF884
	.byte	0x5
	.uleb128 0x120
	.long	.LASF885
	.byte	0x5
	.uleb128 0x121
	.long	.LASF886
	.byte	0x5
	.uleb128 0x122
	.long	.LASF887
	.byte	0x5
	.uleb128 0x123
	.long	.LASF888
	.byte	0x5
	.uleb128 0x124
	.long	.LASF889
	.byte	0x5
	.uleb128 0x125
	.long	.LASF890
	.byte	0x5
	.uleb128 0x126
	.long	.LASF891
	.byte	0x5
	.uleb128 0x127
	.long	.LASF892
	.byte	0x5
	.uleb128 0x129
	.long	.LASF893
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF894
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF895
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF896
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF897
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF898
	.byte	0x5
	.uleb128 0x130
	.long	.LASF899
	.byte	0x5
	.uleb128 0x131
	.long	.LASF900
	.byte	0x5
	.uleb128 0x132
	.long	.LASF901
	.byte	0x5
	.uleb128 0x133
	.long	.LASF902
	.byte	0x5
	.uleb128 0x134
	.long	.LASF903
	.byte	0x5
	.uleb128 0x135
	.long	.LASF904
	.byte	0x5
	.uleb128 0x136
	.long	.LASF905
	.byte	0x5
	.uleb128 0x138
	.long	.LASF906
	.byte	0x5
	.uleb128 0x139
	.long	.LASF907
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF908
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF909
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF910
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF911
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF912
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF913
	.byte	0x5
	.uleb128 0x140
	.long	.LASF914
	.byte	0x5
	.uleb128 0x142
	.long	.LASF915
	.byte	0x5
	.uleb128 0x143
	.long	.LASF916
	.byte	0x5
	.uleb128 0x144
	.long	.LASF917
	.byte	0x5
	.uleb128 0x145
	.long	.LASF918
	.byte	0x5
	.uleb128 0x146
	.long	.LASF919
	.byte	0x5
	.uleb128 0x148
	.long	.LASF920
	.byte	0x5
	.uleb128 0x149
	.long	.LASF921
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF922
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF923
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF924
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF925
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF926
	.byte	0x5
	.uleb128 0x150
	.long	.LASF927
	.byte	0x5
	.uleb128 0x151
	.long	.LASF928
	.byte	0x5
	.uleb128 0x152
	.long	.LASF929
	.byte	0x5
	.uleb128 0x153
	.long	.LASF930
	.byte	0x5
	.uleb128 0x155
	.long	.LASF931
	.byte	0x5
	.uleb128 0x156
	.long	.LASF932
	.byte	0x5
	.uleb128 0x158
	.long	.LASF933
	.byte	0x5
	.uleb128 0x159
	.long	.LASF934
	.byte	0x5
	.uleb128 0x15a
	.long	.LASF935
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF936
	.byte	0x5
	.uleb128 0x15c
	.long	.LASF937
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF938
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF939
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF940
	.byte	0x5
	.uleb128 0x161
	.long	.LASF941
	.byte	0x5
	.uleb128 0x162
	.long	.LASF942
	.byte	0x5
	.uleb128 0x163
	.long	.LASF943
	.byte	0x5
	.uleb128 0x164
	.long	.LASF944
	.byte	0x5
	.uleb128 0x165
	.long	.LASF945
	.byte	0x5
	.uleb128 0x166
	.long	.LASF946
	.byte	0x5
	.uleb128 0x167
	.long	.LASF947
	.byte	0x5
	.uleb128 0x168
	.long	.LASF948
	.byte	0x5
	.uleb128 0x169
	.long	.LASF949
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF950
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF951
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF952
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF953
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF954
	.byte	0x5
	.uleb128 0x170
	.long	.LASF955
	.byte	0x5
	.uleb128 0x172
	.long	.LASF956
	.byte	0x5
	.uleb128 0x173
	.long	.LASF957
	.byte	0x5
	.uleb128 0x174
	.long	.LASF958
	.byte	0x5
	.uleb128 0x175
	.long	.LASF959
	.byte	0x5
	.uleb128 0x176
	.long	.LASF960
	.byte	0x5
	.uleb128 0x177
	.long	.LASF961
	.byte	0x5
	.uleb128 0x178
	.long	.LASF962
	.byte	0x5
	.uleb128 0x179
	.long	.LASF963
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF964
	.byte	0x5
	.uleb128 0x17c
	.long	.LASF965
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF966
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF967
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF968
	.byte	0x5
	.uleb128 0x180
	.long	.LASF969
	.byte	0x5
	.uleb128 0x181
	.long	.LASF970
	.byte	0x5
	.uleb128 0x182
	.long	.LASF971
	.byte	0x5
	.uleb128 0x184
	.long	.LASF972
	.byte	0x5
	.uleb128 0x185
	.long	.LASF973
	.byte	0x5
	.uleb128 0x186
	.long	.LASF974
	.byte	0x5
	.uleb128 0x187
	.long	.LASF975
	.byte	0x5
	.uleb128 0x188
	.long	.LASF976
	.byte	0x5
	.uleb128 0x189
	.long	.LASF977
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF978
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF979
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF980
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF981
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF982
	.byte	0x5
	.uleb128 0x190
	.long	.LASF983
	.byte	0x5
	.uleb128 0x191
	.long	.LASF984
	.byte	0x5
	.uleb128 0x193
	.long	.LASF985
	.byte	0x5
	.uleb128 0x194
	.long	.LASF986
	.byte	0x5
	.uleb128 0x195
	.long	.LASF987
	.byte	0x5
	.uleb128 0x196
	.long	.LASF988
	.byte	0x5
	.uleb128 0x197
	.long	.LASF989
	.byte	0x5
	.uleb128 0x199
	.long	.LASF990
	.byte	0x5
	.uleb128 0x19a
	.long	.LASF991
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF992
	.byte	0x5
	.uleb128 0x19c
	.long	.LASF993
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF994
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF995
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF996
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF997
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF998
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF999
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x1ae
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x1b8
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x1bc
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x1bd
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x1bf
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x1c1
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x1cc
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x1d5
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x1d7
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x1d9
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x1db
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x1df
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x1e1
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x1e3
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x1e5
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x1e7
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x1e9
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x1eb
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x1ed
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x1ef
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x1f0
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x1f1
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x1f3
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x1f5
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x1f6
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x1f8
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x1fa
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x1fc
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x201
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x202
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x204
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x206
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x208
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x20a
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x20d
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x20e
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x210
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x212
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x213
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x215
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x216
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x219
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x21b
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x21c
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x21d
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x220
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x222
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x223
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x226
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x22a
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x22d
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x231
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x233
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x235
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x237
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x239
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x23b
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x23d
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x23e
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x23f
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x240
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x241
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x242
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x248
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x24a
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x24e
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x252
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x254
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x256
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x258
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x25d
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x25e
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x25f
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x260
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x261
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x262
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x263
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x265
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x267
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x269
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x26b
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x26d
	.long	.LASF1172
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x271
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x273
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x275
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x277
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x279
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x27b
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x27d
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x27e
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x27f
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x281
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x282
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x283
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x284
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x286
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x288
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x28c
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x28e
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x290
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x292
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x296
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x298
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x29a
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x29c
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x29f
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x2a0
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x2a2
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x2a3
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x2a4
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x2a5
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x2a6
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x2a8
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x2a9
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x2aa
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x2ab
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x2ac
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x2ad
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x2ae
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x2af
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x2b0
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x2b2
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x2b3
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x2b4
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x2b5
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x2b6
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x2b7
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x2b8
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x2b9
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x2bb
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x2bc
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x2bd
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x2be
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x2bf
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x2c0
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x2c1
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x2c2
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x2c3
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x2c5
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x2c6
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x2c7
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x2c8
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x2c9
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x2ca
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x2cb
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x2cc
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x2cd
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x2cf
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x2d0
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x2d1
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x2d2
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x2d3
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x2d4
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x2d5
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x2d6
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x2d8
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x2d9
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x2da
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x2db
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x2dc
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x2dd
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x2de
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x2df
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x2e1
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x2e2
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x2e3
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x2e5
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x2e6
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x2e7
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x2e8
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x2e9
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x2eb
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x2ec
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x2ed
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x2ee
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x2ef
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x2f0
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x2f1
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x2f2
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x2f3
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x2f5
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x2f6
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x2f7
	.long	.LASF1287
	.byte	0x5
	.uleb128 0x2f8
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x2f9
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x2fa
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x2fb
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x2fc
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x2fd
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x2fe
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x2ff
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x301
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x303
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x304
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x305
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x306
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x307
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x308
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x309
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x30a
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x30b
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x30d
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x30e
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x30f
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x310
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x311
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x313
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x314
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x315
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x316
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x317
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x318
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x319
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x31a
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x31b
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x322
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x323
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x325
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x326
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x328
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x329
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x32b
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x32c
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x32e
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x331
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x332
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x334
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x335
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x337
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x338
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x33a
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x33b
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x33d
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x33e
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x340
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x341
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x343
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x344
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x346
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x347
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x349
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x34a
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x34c
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x34d
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x34f
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x350
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x352
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x353
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x355
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x356
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x358
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x359
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x35b
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x35c
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x35e
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x35f
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x361
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x362
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x364
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x365
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x367
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x368
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x36a
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x36b
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x36d
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x372
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x373
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x374
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x375
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x376
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x377
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x378
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x379
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x37e
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x381
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x382
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x383
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x384
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x385
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x386
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x387
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x388
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x389
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x38c
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x38d
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x38e
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x38f
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x390
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x391
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x392
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x393
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x394
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x397
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x398
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x399
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x39a
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x39f
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x3a0
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x3a1
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x3a5
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x3a6
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x3aa
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x3ae
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x3af
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x3b0
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x3b1
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x3b2
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x3b3
	.long	.LASF1413
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.portpins.h.34.21289185946cbf62723ecc8db6cdc3ff,comdat
.Ldebug_macro7:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1437
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1446
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1447
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1448
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1449
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1450
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1451
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1452
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1453
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1454
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1455
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1456
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1457
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1458
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF1459
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1460
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1461
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.common.h.35.c7e66042b2128622b9d3bddccc9a39f4,comdat
.Ldebug_macro8:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1474
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1475
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF1476
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1477
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1478
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1479
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF1480
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1481
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1482
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1483
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1484
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1485
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF1486
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1489
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.version.h.54.85699b1a50c61c991a37d67b69e79e95,comdat
.Ldebug_macro9:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1492
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1493
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1494
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1495
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1496
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1497
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fuse.h.36.5c373c650020c0efef2cbaa98ea802c3,comdat
.Ldebug_macro10:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1498
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1499
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1500
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.lock.h.36.51f311078904691e8f8c3d70111251d8,comdat
.Ldebug_macro11:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1501
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1502
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1503
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1504
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1505
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1506
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF1507
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1508
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1509
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1510
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1511
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1512
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1513
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1514
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1515
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.delay.h.36.9b049a49ceee302c08fd72aec728bf54,comdat
.Ldebug_macro12:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1517
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.49.c8a36eddb532146e0bb8ca9326ea4652,comdat
.Ldebug_macro13:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1529
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1530
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1531
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1532
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1533
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1534
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1535
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1536
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1537
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1538
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1539
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1540
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1541
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1542
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1543
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1544
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1545
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1546
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1547
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1548
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1549
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1550
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1551
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1552
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1553
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1554
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x138
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x161
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x170
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x192
	.long	.LASF1566
	.byte	0x5
	.uleb128 0x19a
	.long	.LASF1567
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF1569
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1570
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1571
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.interrupt.h.36.b2193b640edda749ea0a45a8be5976c8,comdat
.Ldebug_macro14:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1574
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1575
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1576
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1577
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1578
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1579
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1580
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1581
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1582
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1583
	.byte	0x5
	.uleb128 0x151
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1585
	.byte	0x5
	.uleb128 0x153
	.long	.LASF1586
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.39.a38874c8f8a57e66301090908ec2a69f,comdat
.Ldebug_macro15:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1588
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1591
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1592
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1593
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1594
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1595
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1596
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1597
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1598
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1599
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF1600
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1601
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1602
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1603
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1604
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1605
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1606
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1607
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1608
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1609
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1610
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1611
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1612
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1613
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1614
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1615
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1616
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1617
	.byte	0x6
	.uleb128 0xee
	.long	.LASF1618
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1633
	.byte	0x6
	.uleb128 0x126
	.long	.LASF1634
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF1635
	.byte	0x6
	.uleb128 0x191
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x196
	.long	.LASF1637
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF1640
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.eeprom.h.99.cb5611a267e4b6b273337b1c43f8938d,comdat
.Ldebug_macro16:
	.word	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1644
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF1645
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1646
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF1647
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1648
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1153:
	.string	"OCR1AH5 5"
.LASF292:
	.string	"__LACCUM_EPSILON__ 0x1P-31LK"
.LASF1557:
	.string	"log10f log10"
.LASF541:
	.string	"UINT16_C(c) __UINT16_C(c)"
.LASF283:
	.string	"__UACCUM_FBIT__ 16"
.LASF252:
	.string	"__LFRACT_EPSILON__ 0x1P-31LR"
.LASF174:
	.string	"__DBL_DENORM_MIN__ ((double)1.40129846e-45L)"
.LASF994:
	.string	"PCINT3 3"
.LASF1463:
	.string	"SPL _SFR_IO8(0x3D)"
.LASF672:
	.string	"_SFR_DWORD(sfr) _MMIO_DWORD(_SFR_ADDR(sfr))"
.LASF881:
	.string	"GPIOR25 5"
.LASF1570:
	.string	"lroundf lround"
.LASF295:
	.string	"__ULACCUM_MIN__ 0.0ULK"
.LASF770:
	.string	"OCF2A 1"
.LASF1109:
	.string	"TCNT1H _SFR_MEM8(0x85)"
.LASF284:
	.string	"__UACCUM_IBIT__ 16"
.LASF887:
	.string	"CPHA 2"
.LASF1135:
	.string	"ICR1H6 6"
.LASF1586:
	.string	"ISR_ALIASOF(v) __attribute__((alias(__STRINGIFY(v))))"
.LASF1331:
	.string	"WDT_vect _VECTOR(6)"
.LASF124:
	.string	"__UINT16_C(c) c ## U"
.LASF807:
	.string	"EEAR _SFR_IO16(0x21)"
.LASF577:
	.string	"PRIXLEAST8 \"X\""
.LASF650:
	.string	"SCNuFAST32 \"lu\""
.LASF1329:
	.string	"PCINT2_vect _VECTOR(5)"
.LASF984:
	.string	"PCIE2 2"
.LASF609:
	.string	"SCNdFAST8 \"hhd\""
.LASF155:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF901:
	.string	"SPDR3 3"
.LASF1564:
	.string	"fdimf fdim"
.LASF932:
	.string	"SELFPRGEN 0"
.LASF923:
	.string	"BORF 2"
.LASF685:
	.string	"PINB3 3"
.LASF1279:
	.string	"UCSZ02 2"
.LASF1256:
	.string	"TWSTA 5"
.LASF1012:
	.string	"PCINT20 4"
.LASF205:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF120:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1169:
	.string	"OCR1BH2 2"
.LASF323:
	.string	"__USQ_IBIT__ 0"
.LASF477:
	.string	"_AVR_IO_H_ "
.LASF1532:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF390:
	.string	"__BUILTIN_AVR_NOPS 1"
.LASF641:
	.string	"SCNuFAST16 \"u\""
.LASF84:
	.string	"__SCHAR_WIDTH__ 8"
.LASF1145:
	.string	"OCR1AL6 6"
.LASF490:
	.string	"UINT16_MAX (__CONCAT(INT16_MAX, U) * 2U + 1U)"
.LASF483:
	.string	"__CONCATenate(left,right) left ## right"
.LASF132:
	.string	"__INT_FAST16_WIDTH__ 16"
.LASF928:
	.string	"PUD 4"
.LASF1093:
	.string	"WGM13 4"
.LASF484:
	.string	"__CONCAT(left,right) __CONCATenate(left, right)"
.LASF0:
	.string	"__STDC__ 1"
.LASF1496:
	.string	"__AVR_LIBC_MINOR__ 0"
.LASF40:
	.string	"__CHAR16_TYPE__ unsigned int"
.LASF264:
	.string	"__ULLFRACT_IBIT__ 0"
.LASF950:
	.string	"CLKPR _SFR_MEM8(0x61)"
.LASF1076:
	.string	"ADC4D 4"
.LASF197:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF330:
	.string	"__SA_FBIT__ 15"
.LASF222:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF340:
	.string	"__UDA_FBIT__ 32"
.LASF1191:
	.string	"TCNT2_1 1"
.LASF306:
	.string	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-48ULLK"
.LASF834:
	.string	"CS01 1"
.LASF50:
	.string	"__UINT64_TYPE__ long long unsigned int"
.LASF1127:
	.string	"ICR1L7 7"
.LASF908:
	.string	"ACIS1 1"
.LASF1303:
	.string	"UBRR0_5 5"
.LASF140:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
.LASF367:
	.string	"__AVR_HAVE_MOVW__ 1"
.LASF794:
	.string	"EEMPE 2"
.LASF1514:
	.string	"BLB1_MODE_4 (0xDF)"
.LASF941:
	.string	"WDTCSR _SFR_MEM8(0x60)"
.LASF619:
	.string	"SCNd32 \"ld\""
.LASF331:
	.string	"__SA_IBIT__ 16"
.LASF1554:
	.string	"atanf atan"
.LASF172:
	.string	"__DBL_MIN__ ((double)1.17549435e-38L)"
.LASF341:
	.string	"__UDA_IBIT__ 32"
.LASF1107:
	.string	"TCNT1L6 6"
.LASF1308:
	.string	"UBRR0_9 1"
.LASF716:
	.string	"DDRC _SFR_IO8(0x07)"
.LASF19:
	.string	"__SIZEOF_LONG__ 4"
.LASF627:
	.string	"SCNo8 \"hho\""
.LASF574:
	.string	"PRIxLEAST8 \"x\""
.LASF1501:
	.string	"_AVR_LOCK_H_ 1"
.LASF1637:
	.string	"NULL ((void *)0)"
.LASF170:
	.string	"__DBL_DECIMAL_DIG__ 9"
.LASF1097:
	.string	"FOC1B 6"
.LASF1161:
	.string	"OCR1BL3 3"
.LASF1438:
	.string	"PIN0 0"
.LASF1620:
	.string	"__WCHAR_T__ "
.LASF1227:
	.string	"TWPS1 1"
.LASF421:
	.string	"__BUILTIN_AVR_COUNTLSUHR 1"
.LASF751:
	.string	"PORTD0 0"
.LASF1471:
	.string	"SREG_S (4)"
.LASF746:
	.string	"DDD4 4"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
.LASF844:
	.string	"TCNT0_4 4"
.LASF730:
	.string	"PORTC5 5"
.LASF166:
	.string	"__DBL_MIN_EXP__ (-125)"
.LASF1389:
	.string	"FUSE_BOOTRST (unsigned char)~_BV(0)"
.LASF85:
	.string	"__SHRT_WIDTH__ 16"
.LASF80:
	.string	"__WINT_MAX__ 0xffffU"
.LASF524:
	.string	"INTMAX_MAX INT64_MAX"
.LASF1540:
	.string	"fmodf fmod"
.LASF67:
	.string	"__INTPTR_TYPE__ int"
.LASF314:
	.string	"__DQ_FBIT__ 63"
.LASF176:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF287:
	.string	"__UACCUM_EPSILON__ 0x1P-16UK"
.LASF606:
	.string	"PRIXPTR PRIX16"
.LASF424:
	.string	"__BUILTIN_AVR_COUNTLSULLR 1"
.LASF1036:
	.string	"ADCL4 4"
.LASF519:
	.string	"INT_FAST64_MIN INT64_MIN"
.LASF1213:
	.string	"TCN2UB 4"
.LASF508:
	.string	"UINT_LEAST64_MAX UINT64_MAX"
.LASF162:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1646:
	.string	"__EEPUT(addr,val) eeprom_write_byte ((uint8_t *)(addr), (uint8_t)(val))"
.LASF1345:
	.string	"TIMER1_OVF_vect _VECTOR(13)"
.LASF623:
	.string	"SCNiLEAST32 \"li\""
.LASF79:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF215:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF1243:
	.string	"TWD0 0"
.LASF398:
	.string	"__BUILTIN_AVR_ABSK 1"
.LASF393:
	.string	"__BUILTIN_AVR_ABSHR 1"
.LASF1650:
	.string	"_UART_H_ "
.LASF1074:
	.string	"ADC2D 2"
.LASF1568:
	.string	"truncf trunc"
.LASF1643:
	.string	"eeprom_is_ready() bit_is_clear (EECR, EEPE)"
.LASF304:
	.string	"__ULLACCUM_IBIT__ 16"
.LASF526:
	.string	"UINTMAX_MAX UINT64_MAX"
.LASF1049:
	.string	"ADCSRA _SFR_MEM8(0x7A)"
.LASF652:
	.string	"SCNxLEAST32 \"lx\""
.LASF937:
	.string	"RWWSRE 4"
.LASF1324:
	.string	"PCINT0_vect_num 3"
.LASF1592:
	.string	"_T_PTRDIFF_ "
.LASF1065:
	.string	"MUX1 1"
.LASF488:
	.string	"INT16_MAX 0x7fff"
.LASF1515:
	.string	"LOCKBITS_DEFAULT (0xFF)"
.LASF515:
	.string	"INT_FAST32_MAX INT32_MAX"
.LASF1233:
	.string	"TWAR _SFR_MEM8(0xBA)"
.LASF1367:
	.string	"TWI_vect _VECTOR(24)"
.LASF864:
	.string	"OCR0B_6 6"
.LASF114:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF1360:
	.string	"ADC_vect_num 21"
.LASF235:
	.string	"__USFRACT_MIN__ 0.0UHR"
.LASF737:
	.string	"PIND4 4"
.LASF640:
	.string	"SCNuLEAST16 \"u\""
.LASF978:
	.string	"CAL5 5"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ long int"
.LASF927:
	.string	"IVSEL 1"
.LASF819:
	.string	"EEAR9 1"
.LASF402:
	.string	"__BUILTIN_AVR_ROUNDR 1"
.LASF1217:
	.string	"TWBR0 0"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long long int"
.LASF1206:
	.string	"OCR2_7 7"
.LASF74:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1391:
	.string	"FUSE_BOOTSZ1 (unsigned char)~_BV(2)"
.LASF695:
	.string	"DDB4 4"
.LASF1666:
	.string	"uart_receive"
.LASF655:
	.string	"SCNuPTR SCNu16"
.LASF700:
	.string	"PORTB0 0"
.LASF964:
	.string	"__AVR_HAVE_PRR ((1<<PRADC)|(1<<PRUSART0)|(1<<PRSPI)|(1<<PRTIM1)|(1<<PRTIM0)|(1<<PRTIM2)|(1<<PRTWI))"
.LASF1499:
	.string	"FUSEMEM __attribute__((__used__, __section__ (\".fuse\")))"
.LASF1225:
	.string	"TWSR _SFR_MEM8(0xB9)"
.LASF947:
	.string	"WDP3 5"
.LASF914:
	.string	"ACD 7"
.LASF559:
	.string	"PRId32 \"ld\""
.LASF1364:
	.string	"ANALOG_COMP_vect_num 23"
.LASF1561:
	.string	"isfinitef isfinite"
.LASF875:
	.string	"GPIOR2 _SFR_IO8(0x2B)"
.LASF1297:
	.string	"UBRR0L _SFR_MEM8(0xC4)"
.LASF1281:
	.string	"RXEN0 4"
.LASF1585:
	.string	"ISR_NAKED __attribute__((naked))"
.LASF167:
	.string	"__DBL_MIN_10_EXP__ (-37)"
.LASF343:
	.string	"__UTA_IBIT__ 16"
.LASF1228:
	.string	"TWS3 3"
.LASF1550:
	.string	"sinhf sinh"
.LASF478:
	.string	"_AVR_SFR_DEFS_H_ 1"
.LASF604:
	.string	"PRIuPTR PRIu16"
.LASF135:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
.LASF1154:
	.string	"OCR1AH6 6"
.LASF961:
	.string	"PRTIM0 5"
.LASF348:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 1"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ unsigned int"
.LASF376:
	.string	"__AVR_SFR_OFFSET__ 0x20"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF108:
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
.LASF995:
	.string	"PCINT4 4"
.LASF18:
	.string	"__SIZEOF_INT__ 2"
.LASF1072:
	.string	"ADC0D 0"
.LASF882:
	.string	"GPIOR26 6"
.LASF221:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF1348:
	.string	"TIMER0_COMPB_vect_num 15"
.LASF782:
	.string	"GPIOR0 _SFR_IO8(0x1E)"
.LASF303:
	.string	"__ULLACCUM_FBIT__ 48"
.LASF1067:
	.string	"MUX3 3"
.LASF1612:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF434:
	.string	"__BUILTIN_AVR_BITSR 1"
.LASF1136:
	.string	"ICR1H7 7"
.LASF1207:
	.string	"OCR2B _SFR_MEM8(0xB4)"
.LASF359:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF1414:
	.string	"_AVR_PORTPINS_H_ 1"
.LASF1433:
	.string	"PIN5 5"
.LASF1116:
	.string	"TCNT1H6 6"
.LASF902:
	.string	"SPDR4 4"
.LASF312:
	.string	"__SQ_FBIT__ 31"
.LASF529:
	.string	"SIG_ATOMIC_MAX INT8_MAX"
.LASF364:
	.string	"__AVR__ 1"
.LASF686:
	.string	"PINB4 4"
.LASF1375:
	.string	"XRAMEND RAMEND"
.LASF945:
	.string	"WDE 3"
.LASF1008:
	.string	"PCINT16 0"
.LASF1027:
	.string	"OCIE2A 1"
.LASF1050:
	.string	"ADPS0 0"
.LASF1170:
	.string	"OCR1BH3 3"
.LASF1011:
	.string	"PCINT19 3"
.LASF185:
	.string	"__LDBL_DECIMAL_DIG__ 9"
.LASF1208:
	.string	"ASSR _SFR_MEM8(0xB6)"
.LASF545:
	.string	"UINTMAX_C(c) __UINTMAX_C(c)"
.LASF308:
	.string	"__QQ_FBIT__ 7"
.LASF1235:
	.string	"TWA0 1"
.LASF1146:
	.string	"OCR1AL7 7"
.LASF1406:
	.string	"SIGNATURE_1 0x95"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 1"
.LASF1152:
	.string	"OCR1AH4 4"
.LASF455:
	.string	"__BUILTIN_AVR_ULRBITS 1"
.LASF637:
	.string	"SCNoLEAST16 \"o\""
.LASF1312:
	.string	"UDR0_0 0"
.LASF1445:
	.string	"PB6 PORTB6"
.LASF1415:
	.string	"PORT7 7"
.LASF1045:
	.string	"ADCH4 4"
.LASF931:
	.string	"SPMCSR _SFR_IO8(0x37)"
.LASF1192:
	.string	"TCNT2_2 2"
.LASF196:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF911:
	.string	"ACI 4"
.LASF39:
	.string	"__UINTMAX_TYPE__ long long unsigned int"
.LASF707:
	.string	"PORTB7 7"
.LASF1430:
	.string	"DD0 0"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF112:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF868:
	.string	"GPIOR11 1"
.LASF342:
	.string	"__UTA_FBIT__ 48"
.LASF1040:
	.string	"ADCH _SFR_MEM8(0x79)"
.LASF821:
	.string	"GTCCR _SFR_IO8(0x23)"
.LASF789:
	.string	"GPIOR06 6"
.LASF1465:
	.string	"SPH _SFR_IO8(0x3E)"
.LASF1108:
	.string	"TCNT1L7 7"
.LASF549:
	.string	"PRIdFAST8 \"d\""
.LASF656:
	.string	"SCNxPTR SCNx16"
.LASF584:
	.string	"PRIuFAST16 \"u\""
.LASF1577:
	.string	"ISR(vector,...) void vector (void) __attribute__ ((signal,__INTR_ATTRS)) __VA_ARGS__; void vector (void)"
.LASF269:
	.string	"__SACCUM_IBIT__ 8"
.LASF1569:
	.string	"roundf round"
.LASF885:
	.string	"SPR0 0"
.LASF1584:
	.string	"ISR_NOBLOCK __attribute__((interrupt))"
.LASF1162:
	.string	"OCR1BL4 4"
.LASF1051:
	.string	"ADPS1 1"
.LASF521:
	.string	"INTPTR_MAX INT16_MAX"
.LASF87:
	.string	"__LONG_WIDTH__ 32"
.LASF1662:
	.string	"byte"
.LASF1349:
	.string	"TIMER0_COMPB_vect _VECTOR(15)"
.LASF194:
	.string	"__FLT32_DIG__ 6"
.LASF1518:
	.string	"_UTIL_DELAY_BASIC_H_ 1"
.LASF731:
	.string	"PORTC6 6"
.LASF1654:
	.string	"long int"
.LASF1249:
	.string	"TWD6 6"
.LASF799:
	.string	"EEDR0 0"
.LASF823:
	.string	"PSRASY 1"
.LASF1328:
	.string	"PCINT2_vect_num 5"
.LASF897:
	.string	"SPDR _SFR_IO8(0x2E)"
.LASF110:
	.string	"__INT8_C(c) c"
.LASF506:
	.string	"INT_LEAST64_MAX INT64_MAX"
.LASF1084:
	.string	"COM1B0 4"
.LASF543:
	.string	"UINT64_C(c) __UINT64_C(c)"
.LASF1385:
	.string	"FUSE_SUT1 (unsigned char)~_BV(5)"
.LASF493:
	.string	"UINT32_MAX (__CONCAT(INT32_MAX, U) * 2UL + 1UL)"
.LASF528:
	.string	"PTRDIFF_MIN INT16_MIN"
.LASF671:
	.string	"_SFR_WORD(sfr) _MMIO_WORD(_SFR_ADDR(sfr))"
.LASF1363:
	.string	"EE_READY_vect _VECTOR(22)"
.LASF1411:
	.string	"SLEEP_MODE_PWR_SAVE (0x03<<1)"
.LASF154:
	.string	"__FLT_MAX_EXP__ 128"
.LASF1044:
	.string	"ADCH3 3"
.LASF420:
	.string	"__BUILTIN_AVR_COUNTLSLLR 1"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF1342:
	.string	"TIMER1_COMPB_vect_num 12"
.LASF1615:
	.string	"_GCC_SIZE_T "
.LASF1549:
	.string	"coshf cosh"
.LASF1457:
	.string	"PD3 PORTD3"
.LASF164:
	.string	"__DBL_MANT_DIG__ 24"
.LASF338:
	.string	"__USA_FBIT__ 16"
.LASF620:
	.string	"SCNdLEAST32 \"ld\""
.LASF1642:
	.string	"EEMEM __attribute__((section(\".eeprom\")))"
.LASF365:
	.string	"AVR 1"
.LASF193:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF592:
	.string	"PRIoLEAST32 \"lo\""
.LASF611:
	.string	"SCNiLEAST8 \"hhi\""
.LASF465:
	.string	"__BUILTIN_AVR_ABSFX 1"
.LASF699:
	.string	"PORTB _SFR_IO8(0x05)"
.LASF111:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF1298:
	.string	"UBRR0_0 0"
.LASF496:
	.string	"UINT64_MAX (__CONCAT(INT64_MAX, U) * 2ULL + 1ULL)"
.LASF460:
	.string	"__BUILTIN_AVR_LLKBITS 1"
.LASF145:
	.string	"__GCC_IEC_559_COMPLEX 0"
.LASF180:
	.string	"__LDBL_MIN_EXP__ (-125)"
.LASF865:
	.string	"OCR0B_7 7"
.LASF738:
	.string	"PIND5 5"
.LASF979:
	.string	"CAL6 6"
.LASF439:
	.string	"__BUILTIN_AVR_BITSULR 1"
.LASF1402:
	.string	"__LOCK_BITS_EXIST "
.LASF597:
	.string	"PRIx32 \"lx\""
.LASF249:
	.string	"__LFRACT_IBIT__ 0"
.LASF717:
	.string	"DDC0 0"
.LASF91:
	.string	"__PTRDIFF_WIDTH__ 16"
.LASF1218:
	.string	"TWBR1 1"
.LASF345:
	.string	"__USER_LABEL_PREFIX__ "
.LASF1379:
	.string	"FUSE_MEMORY_SIZE 3"
.LASF701:
	.string	"PORTB1 1"
.LASF696:
	.string	"DDB5 5"
.LASF779:
	.string	"EIMSK _SFR_IO8(0x1D)"
.LASF849:
	.string	"OCR0A_0 0"
.LASF761:
	.string	"OCF0A 1"
.LASF741:
	.string	"DDRD _SFR_IO8(0x0A)"
.LASF824:
	.string	"TSM 7"
.LASF309:
	.string	"__QQ_IBIT__ 0"
.LASF600:
	.string	"PRIX32 \"lX\""
.LASF492:
	.string	"INT32_MIN (-INT32_MAX - 1L)"
.LASF401:
	.string	"__BUILTIN_AVR_ROUNDHR 1"
.LASF1229:
	.string	"TWS4 4"
.LASF1529:
	.string	"M_2_PI 0.63661977236758134308"
.LASF396:
	.string	"__BUILTIN_AVR_ABSLLR 1"
.LASF967:
	.string	"__AVR_HAVE_PRR_PRSPI "
.LASF1155:
	.string	"OCR1AH7 7"
.LASF575:
	.string	"PRIxFAST8 \"x\""
.LASF1669:
	.string	"eeprom_update_byte"
.LASF1517:
	.string	"__HAS_DELAY_CYCLES 1"
.LASF1545:
	.string	"ceilf ceil"
.LASF929:
	.string	"BODSE 5"
.LASF416:
	.string	"__BUILTIN_AVR_ROUNDULLK 1"
.LASF357:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 1"
.LASF996:
	.string	"PCINT5 5"
.LASF463:
	.string	"__BUILTIN_AVR_ULKBITS 1"
.LASF195:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF260:
	.string	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)"
.LASF1199:
	.string	"OCR2_0 0"
.LASF411:
	.string	"__BUILTIN_AVR_ROUNDLK 1"
.LASF517:
	.string	"UINT_FAST32_MAX UINT32_MAX"
.LASF1390:
	.string	"FUSE_BOOTSZ0 (unsigned char)~_BV(1)"
.LASF957:
	.string	"PRADC 0"
.LASF245:
	.string	"__UFRACT_MIN__ 0.0UR"
.LASF1598:
	.string	"_GCC_PTRDIFF_T "
.LASF469:
	.string	"__INT24_MIN__ (-__INT24_MAX__-1)"
.LASF909:
	.string	"ACIC 2"
.LASF1605:
	.string	"_T_SIZE_ "
.LASF153:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF744:
	.string	"DDD2 2"
.LASF790:
	.string	"GPIOR07 7"
.LASF883:
	.string	"GPIOR27 7"
.LASF1432:
	.string	"PIN6 6"
.LASF1117:
	.string	"TCNT1H7 7"
.LASF903:
	.string	"SPDR5 5"
.LASF657:
	.string	"_MMIO_BYTE(mem_addr) (*(volatile uint8_t *)(mem_addr))"
.LASF709:
	.string	"PINC0 0"
.LASF523:
	.string	"UINTPTR_MAX UINT16_MAX"
.LASF325:
	.string	"__UDQ_IBIT__ 0"
.LASF270:
	.string	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)"
.LASF1089:
	.string	"CS10 0"
.LASF809:
	.string	"EEAR0 0"
.LASF687:
	.string	"PINB5 5"
.LASF1014:
	.string	"PCINT22 6"
.LASF767:
	.string	"ICF1 5"
.LASF1028:
	.string	"OCIE2B 2"
.LASF300:
	.string	"__LLACCUM_MIN__ (-0X1P15LLK-0X1P15LLK)"
.LASF1171:
	.string	"OCR1BH4 4"
.LASF1641:
	.string	"__ATTR_PURE__ __attribute__((__pure__))"
.LASF557:
	.string	"PRIiLEAST16 \"i\""
.LASF212:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1537:
	.string	"sinf sin"
.LASF913:
	.string	"ACBG 6"
.LASF1176:
	.string	"WGM20 0"
.LASF572:
	.string	"PRIuFAST8 \"u\""
.LASF1524:
	.string	"M_LN10 2.30258509299404568402"
.LASF578:
	.string	"PRIXFAST8 \"X\""
.LASF406:
	.string	"__BUILTIN_AVR_ROUNDUR 1"
.LASF1498:
	.string	"_AVR_FUSE_H_ 1"
.LASF1617:
	.string	"__size_t "
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF92:
	.string	"__SIZE_WIDTH__ 16"
.LASF1520:
	.string	"M_E 2.7182818284590452354"
.LASF666:
	.string	"_SFR_MEM_ADDR(sfr) ((uint16_t) &(sfr))"
.LASF1580:
	.string	"ISR_ALIAS(vector,tgt) void vector (void) __attribute__((signal, naked, __INTR_ATTRS)); void vector (void) { asm volatile (\"jmp \" __STRINGIFY(tgt) ::); }"
.LASF1313:
	.string	"UDR0_1 1"
.LASF538:
	.string	"INT32_C(c) __INT32_C(c)"
.LASF1452:
	.string	"PC5 PORTC5"
.LASF1193:
	.string	"TCNT2_3 3"
.LASF356:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF49:
	.string	"__UINT32_TYPE__ long unsigned int"
.LASF242:
	.string	"__FRACT_EPSILON__ 0x1P-15R"
.LASF795:
	.string	"EERIE 3"
.LASF1091:
	.string	"CS12 2"
.LASF122:
	.string	"__UINT8_C(c) c"
.LASF1185:
	.string	"CS22 2"
.LASF1304:
	.string	"UBRR0_6 6"
.LASF869:
	.string	"GPIOR12 2"
.LASF1424:
	.string	"DD6 6"
.LASF1138:
	.string	"OCR1AL _SFR_MEM8(0x88)"
.LASF622:
	.string	"SCNi32 \"li\""
.LASF536:
	.string	"INT8_C(c) __INT8_C(c)"
.LASF1531:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF256:
	.string	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR"
.LASF940:
	.string	"SPMIE 7"
.LASF516:
	.string	"INT_FAST32_MIN INT32_MIN"
.LASF93:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
.LASF265:
	.string	"__ULLFRACT_MIN__ 0.0ULLR"
.LASF933:
	.string	"SPMEN 0"
.LASF373:
	.string	"__AVR_2_BYTE_PC__ 1"
.LASF1609:
	.string	"_BSD_SIZE_T_ "
.LASF886:
	.string	"SPR1 1"
.LASF464:
	.string	"__BUILTIN_AVR_ULLKBITS 1"
.LASF1652:
	.string	"unsigned char"
.LASF668:
	.string	"_SFR_IO_REG_P(sfr) (_SFR_MEM_ADDR(sfr) < 0x40 + __SFR_OFFSET)"
.LASF1163:
	.string	"OCR1BL5 5"
.LASF427:
	.string	"__BUILTIN_AVR_COUNTLSLK 1"
.LASF229:
	.string	"__SFRACT_IBIT__ 0"
.LASF1272:
	.string	"FE0 4"
.LASF661:
	.string	"_SFR_MEM8(mem_addr) _MMIO_BYTE(mem_addr)"
.LASF1306:
	.string	"UBRR0H _SFR_MEM8(0xC5)"
.LASF1477:
	.string	"YL r28"
.LASF753:
	.string	"PORTD2 2"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1016:
	.string	"TIMSK0 _SFR_MEM8(0x6E)"
.LASF748:
	.string	"DDD6 6"
.LASF1479:
	.string	"ZL r30"
.LASF771:
	.string	"OCF2B 2"
.LASF1250:
	.string	"TWD7 7"
.LASF1017:
	.string	"TOIE0 0"
.LASF151:
	.string	"__FLT_DIG__ 6"
.LASF437:
	.string	"__BUILTIN_AVR_BITSUHR 1"
.LASF800:
	.string	"EEDR1 1"
.LASF1019:
	.string	"OCIE0B 2"
.LASF965:
	.string	"__AVR_HAVE_PRR_PRADC "
.LASF1085:
	.string	"COM1B1 5"
.LASF296:
	.string	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK"
.LASF259:
	.string	"__LLFRACT_IBIT__ 0"
.LASF1382:
	.string	"FUSE_CKSEL2 (unsigned char)~_BV(2)"
.LASF826:
	.string	"WGM00 0"
.LASF706:
	.string	"PORTB6 6"
.LASF973:
	.string	"CAL0 0"
.LASF635:
	.string	"SCNxFAST8 \"hhx\""
.LASF253:
	.string	"__ULFRACT_FBIT__ 32"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 2"
.LASF1599:
	.string	"_PTRDIFF_T_DECLARED "
.LASF548:
	.string	"PRIdLEAST8 \"d\""
.LASF225:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF422:
	.string	"__BUILTIN_AVR_COUNTLSUR 1"
.LASF1591:
	.string	"_PTRDIFF_T "
.LASF1558:
	.string	"powf pow"
.LASF1516:
	.string	"_UTIL_DELAY_H_ 1"
.LASF1396:
	.string	"FUSE_RSTDISBL (unsigned char)~_BV(7)"
.LASF127:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
.LASF772:
	.string	"PCIFR _SFR_IO8(0x1B)"
.LASF1528:
	.string	"M_1_PI 0.31830988618379067154"
.LASF1299:
	.string	"UBRR0_1 1"
.LASF405:
	.string	"__BUILTIN_AVR_ROUNDUHR 1"
.LASF1066:
	.string	"MUX2 2"
.LASF918:
	.string	"SM1 2"
.LASF449:
	.string	"__BUILTIN_AVR_HRBITS 1"
.LASF228:
	.string	"__SFRACT_FBIT__ 7"
.LASF409:
	.string	"__BUILTIN_AVR_ROUNDHK 1"
.LASF739:
	.string	"PIND6 6"
.LASF980:
	.string	"CAL7 7"
.LASF561:
	.string	"PRIdFAST32 \"ld\""
.LASF1326:
	.string	"PCINT1_vect_num 4"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF630:
	.string	"SCNu8 \"hhu\""
.LASF547:
	.string	"PRId8 \"d\""
.LASF579:
	.string	"PRIo16 \"o\""
.LASF1376:
	.string	"E2END 0x3FF"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long long int"
.LASF1219:
	.string	"TWBR2 2"
.LASF532:
	.string	"WCHAR_MAX __WCHAR_MAX__"
.LASF1673:
	.string	"/Users/ben/Documents/projects/camera-slider/mcu"
.LASF199:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF697:
	.string	"DDB6 6"
.LASF850:
	.string	"OCR0A_1 1"
.LASF1270:
	.string	"UPE0 2"
.LASF762:
	.string	"OCF0B 2"
.LASF374:
	.string	"__AVR_HAVE_16BIT_SP__ 1"
.LASF752:
	.string	"PORTD1 1"
.LASF1627:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1054:
	.string	"ADIF 4"
.LASF990:
	.string	"PCMSK0 _SFR_MEM8(0x6B)"
.LASF1119:
	.string	"ICR1L _SFR_MEM8(0x86)"
.LASF1482:
	.string	"AVR_STATUS_ADDR _SFR_IO_ADDR(SREG)"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF1647:
	.string	"_EEGET(var,addr) (var) = eeprom_read_byte ((const uint8_t *)(addr))"
.LASF530:
	.string	"SIG_ATOMIC_MIN INT8_MIN"
.LASF116:
	.string	"__INT32_C(c) c ## L"
.LASF1248:
	.string	"TWD5 5"
.LASF1394:
	.string	"FUSE_SPIEN (unsigned char)~_BV(5)"
.LASF8:
	.string	"__VERSION__ \"8.2.0\""
.LASF904:
	.string	"SPDR6 6"
.LASF102:
	.string	"__INT16_MAX__ 0x7fff"
.LASF150:
	.string	"__FLT_MANT_DIG__ 24"
.LASF551:
	.string	"PRIiLEAST8 \"i\""
.LASF997:
	.string	"PCINT6 6"
.LASF293:
	.string	"__ULACCUM_FBIT__ 32"
.LASF1100:
	.string	"TCNT1L _SFR_MEM8(0x84)"
.LASF1230:
	.string	"TWS5 5"
.LASF86:
	.string	"__INT_WIDTH__ 16"
.LASF614:
	.string	"SCNdLEAST16 \"d\""
.LASF1323:
	.string	"INT1_vect _VECTOR(2)"
.LASF431:
	.string	"__BUILTIN_AVR_COUNTLSULK 1"
.LASF583:
	.string	"PRIuLEAST16 \"u\""
.LASF294:
	.string	"__ULACCUM_IBIT__ 32"
.LASF608:
	.string	"SCNdLEAST8 \"hhd\""
.LASF669:
	.string	"_SFR_ADDR(sfr) _SFR_MEM_ADDR(sfr)"
.LASF76:
	.string	"__LONG_MAX__ 0x7fffffffL"
.LASF1629:
	.string	"_WCHAR_T_H "
.LASF210:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF152:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF710:
	.string	"PINC1 1"
.LASF522:
	.string	"INTPTR_MIN INT16_MIN"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1090:
	.string	"CS11 1"
.LASF128:
	.string	"__UINT64_C(c) c ## ULL"
.LASF810:
	.string	"EEAR1 1"
.LASF688:
	.string	"PINB6 6"
.LASF149:
	.string	"__FLT_RADIX__ 2"
.LASF1015:
	.string	"PCINT23 7"
.LASF360:
	.string	"__SIZEOF_WCHAR_T__ 2"
.LASF100:
	.string	"__SIG_ATOMIC_WIDTH__ 8"
.LASF1542:
	.string	"hypotf hypot"
.LASF1052:
	.string	"ADPS2 2"
.LASF1172:
	.string	"OCR1BH5 5"
.LASF425:
	.string	"__BUILTIN_AVR_COUNTLSHK 1"
.LASF780:
	.string	"INT0 0"
.LASF507:
	.string	"INT_LEAST64_MIN INT64_MIN"
.LASF1177:
	.string	"WGM21 1"
.LASF147:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1237:
	.string	"TWA2 3"
.LASF553:
	.string	"PRId16 \"d\""
.LASF399:
	.string	"__BUILTIN_AVR_ABSLK 1"
.LASF95:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
.LASF822:
	.string	"PSRSYNC 0"
.LASF1660:
	.string	"test"
.LASF817:
	.string	"EEARH _SFR_IO8(0x22)"
.LASF339:
	.string	"__USA_IBIT__ 16"
.LASF282:
	.string	"__ACCUM_EPSILON__ 0x1P-15K"
.LASF664:
	.string	"_SFR_IO8(io_addr) _MMIO_BYTE((io_addr) + __SFR_OFFSET)"
.LASF291:
	.string	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK"
.LASF1314:
	.string	"UDR0_2 2"
.LASF750:
	.string	"PORTD _SFR_IO8(0x0B)"
.LASF988:
	.string	"ISC10 2"
.LASF1047:
	.string	"ADCH6 6"
.LASF1194:
	.string	"TCNT2_4 4"
.LASF213:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF1458:
	.string	"PD4 PORTD4"
.LASF1311:
	.string	"UDR0 _SFR_MEM8(0xC6)"
.LASF1395:
	.string	"FUSE_DWEN (unsigned char)~_BV(6)"
.LASF1392:
	.string	"FUSE_EESAVE (unsigned char)~_BV(3)"
.LASF1428:
	.string	"DD2 2"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF870:
	.string	"GPIOR13 3"
.LASF1062:
	.string	"ACME 6"
.LASF388:
	.string	"__BUILTIN_AVR_FMULSU 1"
.LASF1563:
	.string	"signbitf signbit"
.LASF1649:
	.string	"_TIMER_H_ "
.LASF999:
	.string	"PCMSK1 _SFR_MEM8(0x6C)"
.LASF503:
	.string	"INT_LEAST32_MAX INT32_MAX"
.LASF518:
	.string	"INT_FAST64_MAX INT64_MAX"
.LASF1506:
	.string	"LB_MODE_3 (0xFC)"
.LASF324:
	.string	"__UDQ_FBIT__ 64"
.LASF1380:
	.string	"FUSE_CKSEL0 (unsigned char)~_BV(0)"
.LASF1447:
	.string	"PC0 PORTC0"
.LASF1468:
	.string	"SREG_Z (1)"
.LASF935:
	.string	"PGWRT 2"
.LASF440:
	.string	"__BUILTIN_AVR_BITSULLR 1"
.LASF1504:
	.string	"LB_MODE_1 (0xFF)"
.LASF1440:
	.string	"PB1 PORTB1"
.LASF754:
	.string	"PORTD3 3"
.LASF749:
	.string	"DDD7 7"
.LASF98:
	.string	"__SIG_ATOMIC_MAX__ 0x7f"
.LASF1056:
	.string	"ADSC 6"
.LASF1538:
	.string	"tanf tan"
.LASF1021:
	.string	"TOIE1 0"
.LASF1505:
	.string	"LB_MODE_2 (0xFE)"
.LASF240:
	.string	"__FRACT_MIN__ (-0.5R-0.5R)"
.LASF1404:
	.string	"__BOOT_LOCK_BITS_1_EXIST "
.LASF599:
	.string	"PRIxFAST32 \"lx\""
.LASF1039:
	.string	"ADCL7 7"
.LASF1527:
	.string	"M_PI_4 0.78539816339744830962"
.LASF354:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 1"
.LASF827:
	.string	"WGM01 1"
.LASF1583:
	.string	"ISR_BLOCK "
.LASF971:
	.string	"__AVR_HAVE_PRR_PRTWI "
.LASF1668:
	.string	"eeprom_read_byte"
.LASF466:
	.string	"__BUILTIN_AVR_ROUNDFX 1"
.LASF320:
	.string	"__UHQ_FBIT__ 16"
.LASF1674:
	.string	"uint8_t"
.LASF1338:
	.string	"TIMER1_CAPT_vect_num 10"
.LASF537:
	.string	"INT16_C(c) __INT16_C(c)"
.LASF1357:
	.string	"USART_UDRE_vect _VECTOR(19)"
.LASF513:
	.string	"INT_FAST16_MIN INT16_MIN"
.LASF1454:
	.string	"PD0 PORTD0"
.LASF1120:
	.string	"ICR1L0 0"
.LASF223:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1285:
	.string	"UCSR0C _SFR_MEM8(0xC2)"
.LASF78:
	.string	"__WCHAR_MAX__ 0x7fff"
.LASF436:
	.string	"__BUILTIN_AVR_BITSLLR 1"
.LASF1575:
	.string	"cli() __asm__ __volatile__ (\"cli\" ::: \"memory\")"
.LASF1393:
	.string	"FUSE_WDTON (unsigned char)~_BV(4)"
.LASF1448:
	.string	"PC1 PORTC1"
.LASF830:
	.string	"COM0A0 6"
.LASF368:
	.string	"__AVR_HAVE_LPMX__ 1"
.LASF832:
	.string	"TCCR0B _SFR_IO8(0x25)"
.LASF382:
	.string	"__BUILTIN_AVR_CLI 1"
.LASF683:
	.string	"PINB1 1"
.LASF1441:
	.string	"PB2 PORTB2"
.LASF452:
	.string	"__BUILTIN_AVR_LLRBITS 1"
.LASF1300:
	.string	"UBRR0_2 2"
.LASF986:
	.string	"ISC00 0"
.LASF487:
	.string	"UINT8_MAX (INT8_MAX * 2 + 1)"
.LASF613:
	.string	"SCNd16 \"d\""
.LASF1572:
	.string	"_AVR_INTERRUPT_H_ "
.LASF919:
	.string	"SM2 3"
.LASF1481:
	.string	"AVR_STATUS_REG SREG"
.LASF1260:
	.string	"TWAM0 0"
.LASF1632:
	.string	"_GCC_WCHAR_T "
.LASF1614:
	.string	"___int_size_t_h "
.LASF1059:
	.string	"ADTS0 0"
.LASF740:
	.string	"PIND7 7"
.LASF435:
	.string	"__BUILTIN_AVR_BITSLR 1"
.LASF387:
	.string	"__BUILTIN_AVR_FMULS 1"
.LASF429:
	.string	"__BUILTIN_AVR_COUNTLSUHK 1"
.LASF678:
	.string	"loop_until_bit_is_clear(sfr,bit) do { } while (bit_is_set(sfr, bit))"
.LASF610:
	.string	"SCNi8 \"hhi\""
.LASF136:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF238:
	.string	"__FRACT_FBIT__ 15"
.LASF1255:
	.string	"TWSTO 4"
.LASF719:
	.string	"DDC2 2"
.LASF481:
	.string	"__STDINT_H_ "
.LASF1220:
	.string	"TWBR3 3"
.LASF1222:
	.string	"TWBR5 5"
.LASF703:
	.string	"PORTB3 3"
.LASF662:
	.string	"_SFR_MEM16(mem_addr) _MMIO_WORD(mem_addr)"
.LASF103:
	.string	"__INT32_MAX__ 0x7fffffffL"
.LASF698:
	.string	"DDB7 7"
.LASF1590:
	.string	"_ANSI_STDDEF_H "
.LASF851:
	.string	"OCR0A_2 2"
.LASF1455:
	.string	"PD1 PORTD1"
.LASF404:
	.string	"__BUILTIN_AVR_ROUNDLLR 1"
.LASF1634:
	.string	"_BSD_WCHAR_T_"
.LASF432:
	.string	"__BUILTIN_AVR_COUNTLSULLK 1"
.LASF73:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF358:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1449:
	.string	"PC2 PORTC2"
.LASF1608:
	.string	"_SIZE_T_ "
.LASF1075:
	.string	"ADC3D 3"
.LASF458:
	.string	"__BUILTIN_AVR_KBITS 1"
.LASF272:
	.string	"__SACCUM_EPSILON__ 0x1P-7HK"
.LASF1231:
	.string	"TWS6 6"
.LASF1077:
	.string	"ADC5D 5"
.LASF1442:
	.string	"PB3 PORTB3"
.LASF1618:
	.string	"__need_size_t"
.LASF266:
	.string	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR"
.LASF397:
	.string	"__BUILTIN_AVR_ABSHK 1"
.LASF327:
	.string	"__UTQ_IBIT__ 0"
.LASF1541:
	.string	"cbrtf cbrt"
.LASF1543:
	.string	"squaref square"
.LASF328:
	.string	"__HA_FBIT__ 7"
.LASF998:
	.string	"PCINT7 7"
.LASF642:
	.string	"SCNx16 \"x\""
.LASF285:
	.string	"__UACCUM_MIN__ 0.0UK"
.LASF133:
	.string	"__INT_FAST32_MAX__ 0x7fffffffL"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF591:
	.string	"PRIo32 \"lo\""
.LASF1387:
	.string	"FUSE_CKDIV8 (unsigned char)~_BV(7)"
.LASF415:
	.string	"__BUILTIN_AVR_ROUNDULK 1"
.LASF1252:
	.string	"TWIE 0"
.LASF224:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1351:
	.string	"TIMER0_OVF_vect _VECTOR(16)"
.LASF1400:
	.string	"FUSE_BODLEVEL2 (unsigned char)~_BV(2)"
.LASF624:
	.string	"SCNiFAST32 \"li\""
.LASF1366:
	.string	"TWI_vect_num 24"
.LASF1573:
	.string	"__STRINGIFY(x) #x"
.LASF247:
	.string	"__UFRACT_EPSILON__ 0x1P-16UR"
.LASF214:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF163:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF546:
	.string	"_GCC_WRAP_STDINT_H "
.LASF644:
	.string	"SCNxFAST16 \"x\""
.LASF910:
	.string	"ACIE 3"
.LASF774:
	.string	"PCIF1 1"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF1274:
	.string	"TXC0 6"
.LASF681:
	.string	"PINB _SFR_IO8(0x03)"
.LASF1456:
	.string	"PD2 PORTD2"
.LASF638:
	.string	"SCNoFAST16 \"o\""
.LASF925:
	.string	"MCUCR _SFR_IO8(0x35)"
.LASF1149:
	.string	"OCR1AH1 1"
.LASF905:
	.string	"SPDR7 7"
.LASF711:
	.string	"PINC2 2"
.LASF1494:
	.string	"__AVR_LIBC_DATE_ 20150208UL"
.LASF1450:
	.string	"PC3 PORTC3"
.LASF1026:
	.string	"TOIE2 0"
.LASF1182:
	.string	"TCCR2B _SFR_MEM8(0xB1)"
.LASF629:
	.string	"SCNoFAST8 \"hho\""
.LASF301:
	.string	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-47LLK"
.LASF811:
	.string	"EEAR2 2"
.LASF841:
	.string	"TCNT0_1 1"
.LASF183:
	.string	"__LDBL_MAX_10_EXP__ 38"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1173:
	.string	"OCR1BH6 6"
.LASF77:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1431:
	.string	"PIN7 7"
.LASF889:
	.string	"MSTR 4"
.LASF781:
	.string	"INT1 1"
.LASF307:
	.string	"__ULLACCUM_EPSILON__ 0x1P-48ULLK"
.LASF278:
	.string	"__ACCUM_FBIT__ 15"
.LASF1186:
	.string	"WGM22 3"
.LASF596:
	.string	"PRIuFAST32 \"lu\""
.LASF1238:
	.string	"TWA3 4"
.LASF118:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
.LASF159:
	.string	"__FLT_EPSILON__ 1.19209290e-7F"
.LASF321:
	.string	"__UHQ_IBIT__ 0"
.LASF126:
	.string	"__UINT32_C(c) c ## UL"
.LASF663:
	.string	"_SFR_MEM32(mem_addr) _MMIO_DWORD(mem_addr)"
.LASF542:
	.string	"UINT32_C(c) __UINT32_C(c)"
.LASF1384:
	.string	"FUSE_SUT0 (unsigned char)~_BV(4)"
.LASF1446:
	.string	"PB7 PORTB7"
.LASF1315:
	.string	"UDR0_3 3"
.LASF1555:
	.string	"atan2f atan2"
.LASF989:
	.string	"ISC11 3"
.LASF1282:
	.string	"UDRIE0 5"
.LASF1048:
	.string	"ADCH7 7"
.LASF279:
	.string	"__ACCUM_IBIT__ 16"
.LASF675:
	.string	"bit_is_set(sfr,bit) (_SFR_BYTE(sfr) & _BV(bit))"
.LASF589:
	.string	"PRIXLEAST16 \"X\""
.LASF97:
	.string	"__INTMAX_WIDTH__ 64"
.LASF968:
	.string	"__AVR_HAVE_PRR_PRTIM1 "
.LASF375:
	.string	"__AVR_HAVE_SPH__ 1"
.LASF1427:
	.string	"DD3 3"
.LASF1565:
	.string	"fmaf fma"
.LASF1286:
	.string	"UCPOL0 0"
.LASF871:
	.string	"GPIOR14 4"
.LASF676:
	.string	"bit_is_clear(sfr,bit) (!(_SFR_BYTE(sfr) & _BV(bit)))"
.LASF1137:
	.string	"OCR1A _SFR_MEM16(0x88)"
.LASF1410:
	.string	"SLEEP_MODE_PWR_DOWN (0x02<<1)"
.LASF646:
	.string	"SCNoLEAST32 \"lo\""
.LASF1129:
	.string	"ICR1H0 0"
.LASF786:
	.string	"GPIOR03 3"
.LASF1275:
	.string	"RXC0 7"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF1579:
	.string	"EMPTY_INTERRUPT(vector) void vector (void) __attribute__ ((signal,naked,__INTR_ATTRS)); void vector (void) { __asm__ __volatile__ (\"reti\" ::); }"
.LASF866:
	.string	"GPIOR1 _SFR_IO8(0x2A)"
.LASF271:
	.string	"__SACCUM_MAX__ 0X7FFFP-7HK"
.LASF1188:
	.string	"FOC2A 7"
.LASF1407:
	.string	"SIGNATURE_2 0x0F"
.LASF527:
	.string	"PTRDIFF_MAX INT16_MAX"
.LASF1165:
	.string	"OCR1BL7 7"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF454:
	.string	"__BUILTIN_AVR_URBITS 1"
.LASF755:
	.string	"PORTD4 4"
.LASF241:
	.string	"__FRACT_MAX__ 0X7FFFP-15R"
.LASF1368:
	.string	"SPM_READY_vect_num 25"
.LASF1332:
	.string	"TIMER2_COMPA_vect_num 7"
.LASF144:
	.string	"__GCC_IEC_559 0"
.LASF802:
	.string	"EEDR3 3"
.LASF1139:
	.string	"OCR1AL0 0"
.LASF244:
	.string	"__UFRACT_IBIT__ 0"
.LASF1344:
	.string	"TIMER1_OVF_vect_num 13"
.LASF418:
	.string	"__BUILTIN_AVR_COUNTLSR 1"
.LASF625:
	.string	"SCNdPTR SCNd16"
.LASF1408:
	.string	"SLEEP_MODE_IDLE (0x00<<1)"
.LASF836:
	.string	"WGM02 3"
.LASF1234:
	.string	"TWGCE 0"
.LASF1251:
	.string	"TWCR _SFR_MEM8(0xBC)"
.LASF763:
	.string	"TIFR1 _SFR_IO8(0x16)"
.LASF1422:
	.string	"PORT0 0"
.LASF958:
	.string	"PRUSART0 1"
.LASF888:
	.string	"CPOL 3"
.LASF500:
	.string	"INT_LEAST16_MAX INT16_MAX"
.LASF1469:
	.string	"SREG_N (2)"
.LASF1619:
	.string	"__wchar_t__ "
.LASF394:
	.string	"__BUILTIN_AVR_ABSR 1"
.LASF951:
	.string	"CLKPS0 0"
.LASF634:
	.string	"SCNxLEAST8 \"hhx\""
.LASF1633:
	.string	"_WCHAR_T_DECLARED "
.LASF1175:
	.string	"TCCR2A _SFR_MEM8(0xB0)"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF948:
	.string	"WDIE 6"
.LASF1261:
	.string	"TWAM1 1"
.LASF831:
	.string	"COM0A1 7"
.LASF985:
	.string	"EICRA _SFR_MEM8(0x69)"
.LASF1576:
	.string	"__INTR_ATTRS used, externally_visible"
.LASF1356:
	.string	"USART_UDRE_vect_num 19"
.LASF143:
	.string	"__UINTPTR_MAX__ 0xffffU"
.LASF1101:
	.string	"TCNT1L0 0"
.LASF981:
	.string	"PCICR _SFR_MEM8(0x68)"
.LASF48:
	.string	"__UINT16_TYPE__ unsigned int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ int"
.LASF939:
	.string	"RWWSB 6"
.LASF1523:
	.string	"M_LN2 0.69314718055994530942"
.LASF1301:
	.string	"UBRR0_3 3"
.LASF117:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF649:
	.string	"SCNuLEAST32 \"lu\""
.LASF563:
	.string	"PRIiLEAST32 \"li\""
.LASF1665:
	.string	"uart_init"
.LASF531:
	.string	"SIZE_MAX UINT16_MAX"
.LASF1596:
	.string	"_BSD_PTRDIFF_T_ "
.LASF838:
	.string	"FOC0A 7"
.LASF1060:
	.string	"ADTS1 1"
.LASF1178:
	.string	"COM2B0 4"
.LASF1069:
	.string	"REFS0 6"
.LASF720:
	.string	"DDC3 3"
.LASF1221:
	.string	"TWBR4 4"
.LASF704:
	.string	"PORTB4 4"
.LASF71:
	.string	"__GXX_ABI_VERSION 1013"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1623:
	.string	"_T_WCHAR "
.LASF1068:
	.string	"ADLAR 5"
.LASF852:
	.string	"OCR0A_3 3"
.LASF702:
	.string	"PORTB2 2"
.LASF1621:
	.string	"_WCHAR_T "
.LASF1398:
	.string	"FUSE_BODLEVEL0 (unsigned char)~_BV(0)"
.LASF248:
	.string	"__LFRACT_FBIT__ 31"
.LASF384:
	.string	"__BUILTIN_AVR_SLEEP 1"
.LASF302:
	.string	"__LLACCUM_EPSILON__ 0x1P-47LLK"
.LASF202:
	.string	"__FLT32_EPSILON__ 1.19209290e-7F32"
.LASF276:
	.string	"__USACCUM_MAX__ 0XFFFFP-8UHK"
.LASF81:
	.string	"__WINT_MIN__ 0U"
.LASF1232:
	.string	"TWS7 7"
.LASF101:
	.string	"__INT8_MAX__ 0x7f"
.LASF428:
	.string	"__BUILTIN_AVR_COUNTLSLLK 1"
.LASF1405:
	.string	"SIGNATURE_0 0x1E"
.LASF1625:
	.string	"_WCHAR_T_ "
.LASF115:
	.string	"__INT_LEAST32_MAX__ 0x7fffffffL"
.LASF1547:
	.string	"ldexpf ldexp"
.LASF1664:
	.string	"send_instructions"
.LASF1046:
	.string	"ADCH5 5"
.LASF1000:
	.string	"PCINT8 0"
.LASF1037:
	.string	"ADCL5 5"
.LASF277:
	.string	"__USACCUM_EPSILON__ 0x1P-8UHK"
.LASF1099:
	.string	"TCNT1 _SFR_MEM16(0x84)"
.LASF1094:
	.string	"ICES1 6"
.LASF237:
	.string	"__USFRACT_EPSILON__ 0x1P-8UHR"
.LASF94:
	.string	"__INTMAX_C(c) c ## LL"
.LASF290:
	.string	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
.LASF916:
	.string	"SE 0"
.LASF570:
	.string	"PRIu8 \"u\""
.LASF514:
	.string	"UINT_FAST16_MAX UINT16_MAX"
.LASF775:
	.string	"PCIF2 2"
.LASF858:
	.string	"OCR0B_0 0"
.LASF131:
	.string	"__INT_FAST16_MAX__ 0x7fff"
.LASF184:
	.string	"__DECIMAL_DIG__ 9"
.LASF1003:
	.string	"PCINT11 3"
.LASF1327:
	.string	"PCINT1_vect _VECTOR(4)"
.LASF796:
	.string	"EEPM0 4"
.LASF447:
	.string	"__BUILTIN_AVR_BITSULK 1"
.LASF712:
	.string	"PINC3 3"
.LASF1429:
	.string	"DD1 1"
.LASF520:
	.string	"UINT_FAST64_MAX UINT64_MAX"
.LASF1200:
	.string	"OCR2_1 1"
.LASF812:
	.string	"EEAR3 3"
.LASF842:
	.string	"TCNT0_2 2"
.LASF660:
	.string	"__SFR_OFFSET 0x20"
.LASF576:
	.string	"PRIX8 \"X\""
.LASF1174:
	.string	"OCR1BH7 7"
.LASF1020:
	.string	"TIMSK1 _SFR_MEM8(0x6F)"
.LASF778:
	.string	"INTF1 1"
.LASF313:
	.string	"__SQ_IBIT__ 0"
.LASF462:
	.string	"__BUILTIN_AVR_UKBITS 1"
.LASF1337:
	.string	"TIMER2_OVF_vect _VECTOR(9)"
.LASF1236:
	.string	"TWA1 2"
.LASF1239:
	.string	"TWA4 5"
.LASF1491:
	.string	"__AVR_LIBC_VERSION_STRING__ \"2.0.0\""
.LASF1350:
	.string	"TIMER0_OVF_vect_num 16"
.LASF1212:
	.string	"OCR2AUB 3"
.LASF1284:
	.string	"RXCIE0 7"
.LASF1574:
	.string	"sei() __asm__ __volatile__ (\"sei\" ::: \"memory\")"
.LASF616:
	.string	"SCNi16 \"i\""
.LASF1381:
	.string	"FUSE_CKSEL1 (unsigned char)~_BV(1)"
.LASF550:
	.string	"PRIi8 \"i\""
.LASF52:
	.string	"__INT_LEAST16_TYPE__ int"
.LASF1148:
	.string	"OCR1AH0 0"
.LASF208:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF400:
	.string	"__BUILTIN_AVR_ABSLLK 1"
.LASF674:
	.string	"_VECTOR(N) __vector_ ## N"
.LASF230:
	.string	"__SFRACT_MIN__ (-0.5HR-0.5HR)"
.LASF1316:
	.string	"UDR0_4 4"
.LASF288:
	.string	"__LACCUM_FBIT__ 31"
.LASF581:
	.string	"PRIoFAST16 \"o\""
.LASF1439:
	.string	"PB0 PORTB0"
.LASF1196:
	.string	"TCNT2_6 6"
.LASF1280:
	.string	"TXEN0 3"
.LASF377:
	.string	"__WITH_AVRLIBC__ 1"
.LASF191:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF969:
	.string	"__AVR_HAVE_PRR_PRTIM0 "
.LASF1488:
	.string	"AVR_STACK_POINTER_LO_REG SPL"
.LASF1134:
	.string	"ICR1H5 5"
.LASF1426:
	.string	"DD4 4"
.LASF872:
	.string	"GPIOR15 5"
.LASF1386:
	.string	"FUSE_CKOUT (unsigned char)~_BV(6)"
.LASF930:
	.string	"BODS 6"
.LASF1130:
	.string	"ICR1H1 1"
.LASF580:
	.string	"PRIoLEAST16 \"o\""
.LASF1544:
	.string	"floorf floor"
.LASF219:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF1401:
	.string	"EFUSE_DEFAULT (0xFF)"
.LASF1638:
	.string	"__need_NULL"
.LASF1055:
	.string	"ADATE 5"
.LASF1187:
	.string	"FOC2B 6"
.LASF689:
	.string	"PINB7 7"
.LASF1110:
	.string	"TCNT1H0 0"
.LASF209:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF141:
	.string	"__INTPTR_MAX__ 0x7fff"
.LASF395:
	.string	"__BUILTIN_AVR_ABSLR 1"
.LASF612:
	.string	"SCNiFAST8 \"hhi\""
.LASF491:
	.string	"INT32_MAX 0x7fffffffL"
.LASF756:
	.string	"PORTD5 5"
.LASF893:
	.string	"SPSR _SFR_IO8(0x2D)"
.LASF1635:
	.string	"__need_wchar_t"
.LASF1519:
	.string	"__MATH_H "
.LASF1002:
	.string	"PCINT10 2"
.LASF1651:
	.string	"signed char"
.LASF90:
	.string	"__WINT_WIDTH__ 16"
.LASF803:
	.string	"EEDR4 4"
.LASF1140:
	.string	"OCR1AL1 1"
.LASF1341:
	.string	"TIMER1_COMPA_vect _VECTOR(11)"
.LASF1377:
	.string	"E2PAGESIZE 4"
.LASF1601:
	.string	"__size_t__ "
.LASF1278:
	.string	"RXB80 1"
.LASF414:
	.string	"__BUILTIN_AVR_ROUNDUK 1"
.LASF165:
	.string	"__DBL_DIG__ 6"
.LASF509:
	.string	"INT_FAST8_MAX INT8_MAX"
.LASF544:
	.string	"INTMAX_C(c) __INTMAX_C(c)"
.LASF534:
	.string	"WINT_MAX __WINT_MAX__"
.LASF1421:
	.string	"PORT1 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF38:
	.string	"__INTMAX_TYPE__ long long int"
.LASF658:
	.string	"_MMIO_WORD(mem_addr) (*(volatile uint16_t *)(mem_addr))"
.LASF1325:
	.string	"PCINT0_vect _VECTOR(3)"
.LASF952:
	.string	"CLKPS1 1"
.LASF1536:
	.string	"cosf cos"
.LASF1164:
	.string	"OCR1BL6 6"
.LASF189:
	.string	"__LDBL_DENORM_MIN__ 1.40129846e-45L"
.LASF1122:
	.string	"ICR1L2 2"
.LASF970:
	.string	"__AVR_HAVE_PRR_PRTIM2 "
.LASF949:
	.string	"WDIF 7"
.LASF1262:
	.string	"TWAM2 2"
.LASF1502:
	.string	"LOCKMEM __attribute__((__used__, __section__ (\".lock\")))"
.LASF171:
	.string	"__DBL_MAX__ ((double)3.40282347e+38L)"
.LASF783:
	.string	"GPIOR00 0"
.LASF1513:
	.string	"BLB1_MODE_3 (0xCF)"
.LASF1102:
	.string	"TCNT1L1 1"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF747:
	.string	"DDD5 5"
.LASF497:
	.string	"INT_LEAST8_MAX INT8_MAX"
.LASF1302:
	.string	"UBRR0_4 4"
.LASF1511:
	.string	"BLB1_MODE_1 (0xFF)"
.LASF1495:
	.string	"__AVR_LIBC_MAJOR__ 2"
.LASF946:
	.string	"WDCE 4"
.LASF262:
	.string	"__LLFRACT_EPSILON__ 0x1P-63LLR"
.LASF588:
	.string	"PRIX16 \"X\""
.LASF921:
	.string	"PORF 0"
.LASF837:
	.string	"FOC0B 6"
.LASF571:
	.string	"PRIuLEAST8 \"u\""
.LASF1061:
	.string	"ADTS2 2"
.LASF1179:
	.string	"COM2B1 5"
.LASF953:
	.string	"CLKPS2 2"
.LASF1070:
	.string	"REFS1 7"
.LASF1676:
	.string	"string"
.LASF1291:
	.string	"USBS0 3"
.LASF198:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF1355:
	.string	"USART_RX_vect _VECTOR(18)"
.LASF468:
	.string	"__INT24_MAX__ 8388607L"
.LASF725:
	.string	"PORTC0 0"
.LASF1539:
	.string	"fabsf fabs"
.LASF721:
	.string	"DDC4 4"
.LASF1013:
	.string	"PCINT21 5"
.LASF1476:
	.string	"XH r27"
.LASF216:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF705:
	.string	"PORTB5 5"
.LASF1254:
	.string	"TWWC 3"
.LASF470:
	.string	"__UINT24_MAX__ 16777215UL"
.LASF445:
	.string	"__BUILTIN_AVR_BITSUHK 1"
.LASF350:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1"
.LASF1292:
	.string	"UPM00 4"
.LASF134:
	.string	"__INT_FAST32_WIDTH__ 32"
.LASF190:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF648:
	.string	"SCNu32 \"lu\""
.LASF1582:
	.string	"BADISR_vect __vector_default"
.LASF1352:
	.string	"SPI_STC_vect_num 17"
.LASF1361:
	.string	"ADC_vect _VECTOR(21)"
.LASF1534:
	.string	"INFINITY __builtin_inf()"
.LASF353:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 1"
.LASF1581:
	.string	"reti() __asm__ __volatile__ (\"reti\" ::)"
.LASF430:
	.string	"__BUILTIN_AVR_COUNTLSUK 1"
.LASF1001:
	.string	"PCINT9 1"
.LASF1526:
	.string	"M_PI_2 1.57079632679489661923"
.LASF1073:
	.string	"ADC1D 1"
.LASF1530:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF236:
	.string	"__USFRACT_MAX__ 0XFFP-8UHR"
.LASF372:
	.string	"__AVR_MEGA__ 1"
.LASF1370:
	.string	"_VECTORS_SIZE (26 * 4)"
.LASF72:
	.string	"__USING_SJLJ_EXCEPTIONS__ 1"
.LASF1115:
	.string	"TCNT1H5 5"
.LASF413:
	.string	"__BUILTIN_AVR_ROUNDUHK 1"
.LASF1095:
	.string	"ICNC1 7"
.LASF89:
	.string	"__WCHAR_WIDTH__ 16"
.LASF1283:
	.string	"TXCIE0 6"
.LASF1462:
	.string	"_AVR_COMMON_H "
.LASF1521:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF859:
	.string	"OCR0B_1 1"
.LASF1631:
	.string	"__INT_WCHAR_T_H "
.LASF246:
	.string	"__UFRACT_MAX__ 0XFFFFP-16UR"
.LASF322:
	.string	"__USQ_FBIT__ 32"
.LASF1369:
	.string	"SPM_READY_vect _VECTOR(25)"
.LASF840:
	.string	"TCNT0_0 0"
.LASF797:
	.string	"EEPM1 5"
.LASF344:
	.string	"__REGISTER_PREFIX__ "
.LASF713:
	.string	"PINC4 4"
.LASF1595:
	.string	"_PTRDIFF_T_ "
.LASF540:
	.string	"UINT8_C(c) __UINT8_C(c)"
.LASF453:
	.string	"__BUILTIN_AVR_UHRBITS 1"
.LASF1201:
	.string	"OCR2_2 2"
.LASF813:
	.string	"EEAR4 4"
.LASF1373:
	.string	"RAMEND 0x8FF"
.LASF239:
	.string	"__FRACT_IBIT__ 0"
.LASF631:
	.string	"SCNuLEAST8 \"hhu\""
.LASF934:
	.string	"PGERS 1"
.LASF96:
	.string	"__UINTMAX_C(c) c ## ULL"
.LASF220:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1600:
	.string	"__need_ptrdiff_t"
.LASF467:
	.string	"__BUILTIN_AVR_COUNTLSFX 1"
.LASF299:
	.string	"__LLACCUM_IBIT__ 16"
.LASF286:
	.string	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK"
.LASF1240:
	.string	"TWA5 6"
.LASF568:
	.string	"PRIoLEAST8 \"o\""
.LASF567:
	.string	"PRIo8 \"o\""
.LASF482:
	.string	"__USING_MINT8 0"
.LASF1503:
	.string	"LOCKBITS unsigned char __lock LOCKMEM"
.LASF104:
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
.LASF1269:
	.string	"U2X0 1"
.LASF1294:
	.string	"UMSEL00 6"
.LASF175:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF501:
	.string	"INT_LEAST16_MIN INT16_MIN"
.LASF1317:
	.string	"UDR0_5 5"
.LASF1571:
	.string	"lrintf lrint"
.LASF906:
	.string	"ACSR _SFR_IO8(0x30)"
.LASF615:
	.string	"SCNdFAST16 \"d\""
.LASF1197:
	.string	"TCNT2_7 7"
.LASF35:
	.string	"__PTRDIFF_TYPE__ int"
.LASF1029:
	.string	"ADC _SFR_MEM16(0x78)"
.LASF82:
	.string	"__PTRDIFF_MAX__ 0x7fff"
.LASF349:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1"
.LASF877:
	.string	"GPIOR21 1"
.LASF273:
	.string	"__USACCUM_FBIT__ 8"
.LASF1425:
	.string	"DD5 5"
.LASF873:
	.string	"GPIOR16 6"
.LASF1661:
	.string	"read_stuff"
.LASF1472:
	.string	"SREG_H (5)"
.LASF142:
	.string	"__INTPTR_WIDTH__ 16"
.LASF1131:
	.string	"ICR1H2 2"
.LASF1214:
	.string	"AS2 5"
.LASF884:
	.string	"SPCR _SFR_IO8(0x2C)"
.LASF1416:
	.string	"PORT6 6"
.LASF1083:
	.string	"WGM11 1"
.LASF594:
	.string	"PRIu32 \"lu\""
.LASF326:
	.string	"__UTQ_FBIT__ 128"
.LASF473:
	.string	"__AVR_DEVICE_NAME__ atmega328p"
.LASF1259:
	.string	"TWAMR _SFR_MEM8(0xBD)"
.LASF1111:
	.string	"TCNT1H1 1"
.LASF1594:
	.string	"__PTRDIFF_T "
.LASF1018:
	.string	"OCIE0A 1"
.LASF1610:
	.string	"_SIZE_T_DEFINED_ "
.LASF708:
	.string	"PINC _SFR_IO8(0x06)"
.LASF757:
	.string	"PORTD6 6"
.LASF512:
	.string	"INT_FAST16_MAX INT16_MAX"
.LASF1216:
	.string	"TWBR _SFR_MEM8(0xB8)"
.LASF204:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF956:
	.string	"PRR _SFR_MEM8(0x64)"
.LASF1022:
	.string	"OCIE1A 1"
.LASF318:
	.string	"__UQQ_FBIT__ 8"
.LASF1195:
	.string	"TCNT2_5 5"
.LASF966:
	.string	"__AVR_HAVE_PRR_PRUSART0 "
.LASF268:
	.string	"__SACCUM_FBIT__ 7"
.LASF804:
	.string	"EEDR5 5"
.LASF1141:
	.string	"OCR1AL2 2"
.LASF1613:
	.string	"_SIZE_T_DECLARED "
.LASF75:
	.string	"__INT_MAX__ 0x7fff"
.LASF383:
	.string	"__BUILTIN_AVR_WDR 1"
.LASF601:
	.string	"PRIXLEAST32 \"lX\""
.LASF1607:
	.string	"__SIZE_T "
.LASF777:
	.string	"INTF0 0"
.LASF922:
	.string	"EXTRF 1"
.LASF41:
	.string	"__CHAR32_TYPE__ long unsigned int"
.LASF352:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 1"
.LASF443:
	.string	"__BUILTIN_AVR_BITSLK 1"
.LASF1157:
	.string	"OCR1BL _SFR_MEM8(0x8A)"
.LASF178:
	.string	"__LDBL_MANT_DIG__ 24"
.LASF33:
	.string	"__SIZEOF_POINTER__ 2"
.LASF959:
	.string	"PRSPI 2"
.LASF298:
	.string	"__LLACCUM_FBIT__ 47"
.LASF160:
	.string	"__FLT_DENORM_MIN__ 1.40129846e-45F"
.LASF1123:
	.string	"ICR1L3 3"
.LASF1658:
	.string	"long double"
.LASF791:
	.string	"EECR _SFR_IO8(0x1F)"
.LASF200:
	.string	"__FLT32_MAX__ 3.40282347e+38F32"
.LASF1359:
	.string	"USART_TX_vect _VECTOR(20)"
.LASF1263:
	.string	"TWAM3 3"
.LASF1606:
	.string	"_T_SIZE "
.LASF1500:
	.string	"FUSES __fuse_t __fuse FUSEMEM"
.LASF926:
	.string	"IVCE 0"
.LASF784:
	.string	"GPIOR01 1"
.LASF960:
	.string	"PRTIM1 3"
.LASF1103:
	.string	"TCNT1L2 2"
.LASF582:
	.string	"PRIu16 \"u\""
.LASF391:
	.string	"__BUILTIN_AVR_INSERT_BITS 1"
.LASF1399:
	.string	"FUSE_BODLEVEL1 (unsigned char)~_BV(1)"
.LASF768:
	.string	"TIFR2 _SFR_IO8(0x17)"
.LASF1353:
	.string	"SPI_STC_vect _VECTOR(17)"
.LASF1057:
	.string	"ADEN 7"
.LASF602:
	.string	"PRIXFAST32 \"lX\""
.LASF475:
	.string	"BAUD 115200"
.LASF1104:
	.string	"TCNT1L3 3"
.LASF1507:
	.string	"BLB0_MODE_1 (0xFF)"
.LASF1655:
	.string	"long unsigned int"
.LASF593:
	.string	"PRIoFAST32 \"lo\""
.LASF1079:
	.string	"AIN0D 0"
.LASF1525:
	.string	"M_PI 3.14159265358979323846"
.LASF438:
	.string	"__BUILTIN_AVR_BITSUR 1"
.LASF448:
	.string	"__BUILTIN_AVR_BITSULLK 1"
.LASF742:
	.string	"DDD0 0"
.LASF1622:
	.string	"_T_WCHAR_ "
.LASF764:
	.string	"TOV1 0"
.LASF726:
	.string	"PORTC1 1"
.LASF250:
	.string	"__LFRACT_MIN__ (-0.5LR-0.5LR)"
.LASF722:
	.string	"DDC5 5"
.LASF1244:
	.string	"TWD1 1"
.LASF1490:
	.string	"_AVR_VERSION_H_ "
.LASF1412:
	.string	"SLEEP_MODE_STANDBY (0x06<<1)"
.LASF1223:
	.string	"TWBR6 6"
.LASF765:
	.string	"OCF1A 1"
.LASF854:
	.string	"OCR0A_5 5"
.LASF1293:
	.string	"UPM01 5"
.LASF539:
	.string	"INT64_C(c) __INT64_C(c)"
.LASF1032:
	.string	"ADCL0 0"
.LASF355:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 1"
.LASF182:
	.string	"__LDBL_MAX_EXP__ 128"
.LASF502:
	.string	"UINT_LEAST16_MAX UINT16_MAX"
.LASF1562:
	.string	"copysignf copysign"
.LASF257:
	.string	"__ULFRACT_EPSILON__ 0x1P-32ULR"
.LASF1086:
	.string	"COM1A0 6"
.LASF88:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF378:
	.string	"__FLASH 1"
.LASF1659:
	.string	"char"
.LASF1671:
	.string	"GNU C17 8.2.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -g3 -Os"
.LASF665:
	.string	"_SFR_IO16(io_addr) _MMIO_WORD((io_addr) + __SFR_OFFSET)"
.LASF1587:
	.string	"_AVR_EEPROM_H_ 1"
.LASF759:
	.string	"TIFR0 _SFR_IO8(0x15)"
.LASF680:
	.string	"_AVR_IOM328P_H_ 1"
.LASF1038:
	.string	"ADCL6 6"
.LASF444:
	.string	"__BUILTIN_AVR_BITSLLK 1"
.LASF1388:
	.string	"LFUSE_DEFAULT (FUSE_CKSEL0 & FUSE_CKSEL2 & FUSE_CKSEL3 & FUSE_SUT0 & FUSE_CKDIV8)"
.LASF552:
	.string	"PRIiFAST8 \"i\""
.LASF16:
	.string	"__OPTIMIZE__ 1"
.LASF1630:
	.string	"___int_wchar_t_h "
.LASF1096:
	.string	"TCCR1C _SFR_MEM8(0x82)"
.LASF643:
	.string	"SCNxLEAST16 \"x\""
.LASF1603:
	.string	"_SIZE_T "
.LASF1553:
	.string	"asinf asin"
.LASF231:
	.string	"__SFRACT_MAX__ 0X7FP-7HR"
.LASF651:
	.string	"SCNx32 \"lx\""
.LASF860:
	.string	"OCR0B_2 2"
.LASF1273:
	.string	"UDRE0 5"
.LASF207:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF733:
	.string	"PIND0 0"
.LASF974:
	.string	"CAL1 1"
.LASF605:
	.string	"PRIxPTR PRIx16"
.LASF1183:
	.string	"CS20 0"
.LASF714:
	.string	"PINC5 5"
.LASF263:
	.string	"__ULLFRACT_FBIT__ 64"
.LASF315:
	.string	"__DQ_IBIT__ 0"
.LASF1098:
	.string	"FOC1A 7"
.LASF1257:
	.string	"TWEA 6"
.LASF814:
	.string	"EEAR5 5"
.LASF554:
	.string	"PRIdLEAST16 \"d\""
.LASF691:
	.string	"DDB0 0"
.LASF1611:
	.string	"_SIZE_T_DEFINED "
.LASF1354:
	.string	"USART_RX_vect_num 18"
.LASF319:
	.string	"__UQQ_IBIT__ 0"
.LASF412:
	.string	"__BUILTIN_AVR_ROUNDLLK 1"
.LASF639:
	.string	"SCNu16 \"u\""
.LASF1644:
	.string	"eeprom_busy_wait() do {} while (!eeprom_is_ready())"
.LASF1241:
	.string	"TWA6 7"
.LASF647:
	.string	"SCNoFAST32 \"lo\""
.LASF1042:
	.string	"ADCH1 1"
.LASF1667:
	.string	"uart_transmit"
.LASF1150:
	.string	"OCR1AH2 2"
.LASF1295:
	.string	"UMSEL01 7"
.LASF1318:
	.string	"UDR0_6 6"
.LASF474:
	.string	"F_CPU 16000000UL"
.LASF1466:
	.string	"SREG _SFR_IO8(0x3F)"
.LASF125:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffUL"
.LASF912:
	.string	"ACO 5"
.LASF991:
	.string	"PCINT0 0"
.LASF1053:
	.string	"ADIE 3"
.LASF386:
	.string	"__BUILTIN_AVR_FMUL 1"
.LASF280:
	.string	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)"
.LASF895:
	.string	"WCOL 6"
.LASF878:
	.string	"GPIOR22 2"
.LASF441:
	.string	"__BUILTIN_AVR_BITSHK 1"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF632:
	.string	"SCNuFAST8 \"hhu\""
.LASF510:
	.string	"INT_FAST8_MIN INT8_MIN"
.LASF874:
	.string	"GPIOR17 7"
.LASF1126:
	.string	"ICR1L6 6"
.LASF598:
	.string	"PRIxLEAST32 \"lx\""
.LASF1132:
	.string	"ICR1H3 3"
.LASF920:
	.string	"MCUSR _SFR_IO8(0x34)"
.LASF1143:
	.string	"OCR1AL4 4"
.LASF99:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1268:
	.string	"MPCM0 0"
.LASF562:
	.string	"PRIi32 \"li\""
.LASF1296:
	.string	"UBRR0 _SFR_MEM16(0xC4)"
.LASF1648:
	.string	"__EEGET(var,addr) (var) = eeprom_read_byte ((const uint8_t *)(addr))"
.LASF203:
	.string	"__FLT32_DENORM_MIN__ 1.40129846e-45F32"
.LASF1437:
	.string	"PIN1 1"
.LASF1112:
	.string	"TCNT1H2 2"
.LASF898:
	.string	"SPDR0 0"
.LASF1336:
	.string	"TIMER2_OVF_vect_num 9"
.LASF410:
	.string	"__BUILTIN_AVR_ROUNDK 1"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ unsigned int"
.LASF894:
	.string	"SPI2X 0"
.LASF682:
	.string	"PINB0 0"
.LASF156:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF45:
	.string	"__INT32_TYPE__ long int"
.LASF758:
	.string	"PORTD7 7"
.LASF1593:
	.string	"_T_PTRDIFF "
.LASF555:
	.string	"PRIdFAST16 \"d\""
.LASF476:
	.string	"MCU \"atmega328p\""
.LASF505:
	.string	"UINT_LEAST32_MAX UINT32_MAX"
.LASF274:
	.string	"__USACCUM_IBIT__ 8"
.LASF1004:
	.string	"PCINT12 4"
.LASF498:
	.string	"INT_LEAST8_MIN INT8_MIN"
.LASF1023:
	.string	"OCIE1B 2"
.LASF255:
	.string	"__ULFRACT_MIN__ 0.0ULR"
.LASF1181:
	.string	"COM2A1 7"
.LASF805:
	.string	"EEDR6 6"
.LASF1142:
	.string	"OCR1AL3 3"
.LASF677:
	.string	"loop_until_bit_is_set(sfr,bit) do { } while (bit_is_clear(sfr, bit))"
.LASF44:
	.string	"__INT16_TYPE__ int"
.LASF1082:
	.string	"WGM10 0"
.LASF1088:
	.string	"TCCR1B _SFR_MEM8(0x81)"
.LASF139:
	.string	"__UINT_FAST32_MAX__ 0xffffffffUL"
.LASF1489:
	.string	"AVR_STACK_POINTER_LO_ADDR _SFR_IO_ADDR(SPL)"
.LASF68:
	.string	"__UINTPTR_TYPE__ unsigned int"
.LASF17:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF1365:
	.string	"ANALOG_COMP_vect _VECTOR(23)"
.LASF1419:
	.string	"PORT3 3"
.LASF1025:
	.string	"TIMSK2 _SFR_MEM8(0x70)"
.LASF1041:
	.string	"ADCH0 0"
.LASF607:
	.string	"SCNd8 \"hhd\""
.LASF158:
	.string	"__FLT_MIN__ 1.17549435e-38F"
.LASF839:
	.string	"TCNT0 _SFR_IO8(0x26)"
.LASF1522:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF954:
	.string	"CLKPS3 3"
.LASF1535:
	.string	"__ATTR_CONST__ __attribute__((__const__))"
.LASF760:
	.string	"TOV0 0"
.LASF1121:
	.string	"ICR1L1 1"
.LASF792:
	.string	"EERE 0"
.LASF1124:
	.string	"ICR1L4 4"
.LASF186:
	.string	"__LDBL_MAX__ 3.40282347e+38L"
.LASF472:
	.string	"__AVR_ATmega328P__ 1"
.LASF972:
	.string	"OSCCAL _SFR_MEM8(0x66)"
.LASF808:
	.string	"EEARL _SFR_IO8(0x21)"
.LASF1264:
	.string	"TWAM4 4"
.LASF785:
	.string	"GPIOR02 2"
.LASF1007:
	.string	"PCMSK2 _SFR_MEM8(0x6D)"
.LASF83:
	.string	"__SIZE_MAX__ 0xffffU"
.LASF962:
	.string	"PRTIM2 6"
.LASF119:
	.string	"__INT64_C(c) c ## LL"
.LASF1322:
	.string	"INT1_vect_num 2"
.LASF407:
	.string	"__BUILTIN_AVR_ROUNDULR 1"
.LASF494:
	.string	"INT64_MAX 0x7fffffffffffffffLL"
.LASF332:
	.string	"__DA_FBIT__ 31"
.LASF1480:
	.string	"ZH r31"
.LASF471:
	.string	"__ELF__ 1"
.LASF565:
	.string	"PRIdPTR PRId16"
.LASF1158:
	.string	"OCR1BL0 0"
.LASF1276:
	.string	"UCSR0B _SFR_MEM8(0xC1)"
.LASF347:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 1"
.LASF679:
	.string	"_AVR_IOXXX_H_ \"iom328p.h\""
.LASF218:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF743:
	.string	"DDD1 1"
.LASF843:
	.string	"TCNT0_3 3"
.LASF535:
	.string	"WINT_MIN __WINT_MIN__"
.LASF461:
	.string	"__BUILTIN_AVR_UHKBITS 1"
.LASF727:
	.string	"PORTC2 2"
.LASF333:
	.string	"__DA_IBIT__ 32"
.LASF723:
	.string	"DDC6 6"
.LASF1245:
	.string	"TWD2 2"
.LASF316:
	.string	"__TQ_FBIT__ 127"
.LASF485:
	.string	"INT8_MAX 0x7f"
.LASF1242:
	.string	"TWDR _SFR_MEM8(0xBB)"
.LASF370:
	.string	"__AVR_HAVE_MUL__ 1"
.LASF766:
	.string	"OCF1B 2"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF587:
	.string	"PRIxFAST16 \"x\""
.LASF1224:
	.string	"TWBR7 7"
.LASF855:
	.string	"OCR0A_6 6"
.LASF1033:
	.string	"ADCL1 1"
.LASF426:
	.string	"__BUILTIN_AVR_COUNTLSK 1"
.LASF254:
	.string	"__ULFRACT_IBIT__ 0"
.LASF955:
	.string	"CLKPCE 7"
.LASF1087:
	.string	"COM1A1 7"
.LASF586:
	.string	"PRIxLEAST16 \"x\""
.LASF123:
	.string	"__UINT_LEAST16_MAX__ 0xffffU"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 4"
.LASF504:
	.string	"INT_LEAST32_MIN INT32_MIN"
.LASF718:
	.string	"DDC1 1"
.LASF525:
	.string	"INTMAX_MIN INT64_MIN"
.LASF457:
	.string	"__BUILTIN_AVR_HKBITS 1"
.LASF585:
	.string	"PRIx16 \"x\""
.LASF618:
	.string	"SCNiFAST16 \"i\""
.LASF1063:
	.string	"ADMUX _SFR_MEM8(0x7C)"
.LASF1626:
	.string	"_BSD_WCHAR_T_ "
.LASF1128:
	.string	"ICR1H _SFR_MEM8(0x87)"
.LASF793:
	.string	"EEPE 1"
.LASF1588:
	.string	"_STDDEF_H "
.LASF1486:
	.string	"AVR_STACK_POINTER_HI_REG SPH"
.LASF1639:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF1335:
	.string	"TIMER2_COMPB_vect _VECTOR(8)"
.LASF389:
	.string	"__BUILTIN_AVR_DELAY_CYCLES 1"
.LASF1202:
	.string	"OCR2_3 3"
.LASF1321:
	.string	"INT0_vect _VECTOR(1)"
.LASF1078:
	.string	"DIDR1 _SFR_MEM8(0x7F)"
.LASF1030:
	.string	"ADCW _SFR_MEM16(0x78)"
.LASF915:
	.string	"SMCR _SFR_IO8(0x33)"
.LASF1566:
	.string	"fmaxf fmax"
.LASF734:
	.string	"PIND1 1"
.LASF975:
	.string	"CAL2 2"
.LASF480:
	.string	"__INTTYPES_H_ "
.LASF1184:
	.string	"CS21 1"
.LASF715:
	.string	"PINC6 6"
.LASF564:
	.string	"PRIiFAST32 \"li\""
.LASF1203:
	.string	"OCR2_4 4"
.LASF815:
	.string	"EEAR6 6"
.LASF845:
	.string	"TCNT0_5 5"
.LASF1533:
	.string	"NAN __builtin_nan(\"\")"
.LASF692:
	.string	"DDB1 1"
.LASF1009:
	.string	"PCINT17 1"
.LASF890:
	.string	"DORD 5"
.LASF1166:
	.string	"OCR1BH _SFR_MEM8(0x8B)"
.LASF451:
	.string	"__BUILTIN_AVR_LRBITS 1"
.LASF15:
	.string	"__OPTIMIZE_SIZE__ 1"
.LASF942:
	.string	"WDP0 0"
.LASF1290:
	.string	"UDORD0 2"
.LASF1645:
	.string	"_EEPUT(addr,val) eeprom_write_byte ((uint8_t *)(addr), (uint8_t)(val))"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1548:
	.string	"expf exp"
.LASF1616:
	.string	"_SIZET_ "
.LASF690:
	.string	"DDRB _SFR_IO8(0x04)"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF479:
	.string	"_SFR_ASM_COMPAT 0"
.LASF1151:
	.string	"OCR1AH3 3"
.LASF1319:
	.string	"UDR0_7 7"
.LASF385:
	.string	"__BUILTIN_AVR_SWAP 1"
.LASF1589:
	.string	"_STDDEF_H_ "
.LASF1081:
	.string	"TCCR1A _SFR_MEM8(0x80)"
.LASF992:
	.string	"PCINT1 1"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF281:
	.string	"__ACCUM_MAX__ 0X7FFFFFFFP-15K"
.LASF879:
	.string	"GPIOR23 3"
.LASF1156:
	.string	"OCR1B _SFR_MEM16(0x8A)"
.LASF917:
	.string	"SM0 1"
.LASF1423:
	.string	"DD7 7"
.LASF1497:
	.string	"__AVR_LIBC_REVISION__ 0"
.LASF1064:
	.string	"MUX0 0"
.LASF335:
	.string	"__TA_IBIT__ 16"
.LASF820:
	.string	"_EEPROM_REG_LOCATIONS_ 1F2021"
.LASF560:
	.string	"PRIdLEAST32 \"ld\""
.LASF1133:
	.string	"ICR1H4 4"
.LASF1508:
	.string	"BLB0_MODE_2 (0xFB)"
.LASF617:
	.string	"SCNiLEAST16 \"i\""
.LASF379:
	.string	"__MEMX 1"
.LASF788:
	.string	"GPIOR05 5"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1330:
	.string	"WDT_vect_num 6"
.LASF573:
	.string	"PRIx8 \"x\""
.LASF982:
	.string	"PCIE0 0"
.LASF1436:
	.string	"PIN2 2"
.LASF1113:
	.string	"TCNT1H3 3"
.LASF899:
	.string	"SPDR1 1"
.LASF1475:
	.string	"XL r26"
.LASF1343:
	.string	"TIMER1_COMPB_vect _VECTOR(12)"
.LASF1663:
	.string	"write_stuff"
.LASF1628:
	.string	"_WCHAR_T_DEFINED "
.LASF1211:
	.string	"OCR2BUB 2"
.LASF1287:
	.string	"UCSZ00 1"
.LASF1434:
	.string	"PIN4 4"
.LASF1556:
	.string	"logf log"
.LASF138:
	.string	"__UINT_FAST16_MAX__ 0xffffU"
.LASF938:
	.string	"SIGRD 5"
.LASF1167:
	.string	"OCR1BH0 0"
.LASF1005:
	.string	"PCINT13 5"
.LASF289:
	.string	"__LACCUM_IBIT__ 32"
.LASF633:
	.string	"SCNx8 \"hhx\""
.LASF806:
	.string	"EEDR7 7"
.LASF1080:
	.string	"AIN1D 1"
.LASF217:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF113:
	.string	"__INT16_C(c) c"
.LASF1258:
	.string	"TWINT 7"
.LASF1333:
	.string	"TIMER2_COMPA_vect _VECTOR(7)"
.LASF857:
	.string	"OCR0B _SFR_IO8(0x28)"
.LASF129:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1552:
	.string	"acosf acos"
.LASF533:
	.string	"WCHAR_MIN __WCHAR_MIN__"
.LASF1071:
	.string	"DIDR0 _SFR_MEM8(0x7E)"
.LASF892:
	.string	"SPIE 7"
.LASF305:
	.string	"__ULLACCUM_MIN__ 0.0ULLK"
.LASF1559:
	.string	"isnanf isnan"
.LASF1657:
	.string	"long long unsigned int"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1418:
	.string	"PORT4 4"
.LASF1209:
	.string	"TCR2BUB 0"
.LASF168:
	.string	"__DBL_MAX_EXP__ 128"
.LASF1444:
	.string	"PB5 PORTB5"
.LASF499:
	.string	"UINT_LEAST8_MAX UINT8_MAX"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ long unsigned int"
.LASF1378:
	.string	"FLASHEND 0x7FFF"
.LASF105:
	.string	"__UINT8_MAX__ 0xff"
.LASF201:
	.string	"__FLT32_MIN__ 1.17549435e-38F32"
.LASF1309:
	.string	"UBRR0_10 2"
.LASF828:
	.string	"COM0B0 4"
.LASF1125:
	.string	"ICR1L5 5"
.LASF371:
	.string	"__AVR_HAVE_JMP_CALL__ 1"
.LASF433:
	.string	"__BUILTIN_AVR_BITSHR 1"
.LASF1265:
	.string	"TWAM5 5"
.LASF1420:
	.string	"PORT2 2"
.LASF1443:
	.string	"PB4 PORTB4"
.LASF867:
	.string	"GPIOR10 0"
.LASF137:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF876:
	.string	"GPIOR20 0"
.LASF1105:
	.string	"TCNT1L4 4"
.LASF1546:
	.string	"frexpf frexp"
.LASF361:
	.string	"__SIZEOF_WINT_T__ 2"
.LASF1305:
	.string	"UBRR0_7 7"
.LASF848:
	.string	"OCR0A _SFR_IO8(0x27)"
.LASF1159:
	.string	"OCR1BL1 1"
.LASF1492:
	.string	"__AVR_LIBC_VERSION__ 20000UL"
.LASF334:
	.string	"__TA_FBIT__ 47"
.LASF1210:
	.string	"TCR2AUB 1"
.LASF232:
	.string	"__SFRACT_EPSILON__ 0x1P-7HR"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF773:
	.string	"PCIF0 0"
.LASF728:
	.string	"PORTC3 3"
.LASF1246:
	.string	"TWD3 3"
.LASF1509:
	.string	"BLB0_MODE_3 (0xF3)"
.LASF233:
	.string	"__USFRACT_FBIT__ 8"
.LASF1271:
	.string	"DOR0 3"
.LASF192:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF569:
	.string	"PRIoFAST8 \"o\""
.LASF856:
	.string	"OCR0A_7 7"
.LASF351:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1"
.LASF275:
	.string	"__USACCUM_MIN__ 0.0UHK"
.LASF258:
	.string	"__LLFRACT_FBIT__ 63"
.LASF1451:
	.string	"PC4 PORTC4"
.LASF362:
	.string	"__SIZEOF_PTRDIFF_T__ 2"
.LASF1347:
	.string	"TIMER0_COMPA_vect _VECTOR(14)"
.LASF595:
	.string	"PRIuLEAST32 \"lu\""
.LASF732:
	.string	"PIND _SFR_IO8(0x09)"
.LASF459:
	.string	"__BUILTIN_AVR_LKBITS 1"
.LASF861:
	.string	"OCR0B_3 3"
.LASF187:
	.string	"__LDBL_MIN__ 1.17549435e-38L"
.LASF408:
	.string	"__BUILTIN_AVR_ROUNDULLR 1"
.LASF1358:
	.string	"USART_TX_vect_num 20"
.LASF450:
	.string	"__BUILTIN_AVR_RBITS 1"
.LASF621:
	.string	"SCNdFAST32 \"ld\""
.LASF626:
	.string	"SCNiPTR SCNi16"
.LASF1346:
	.string	"TIMER0_COMPA_vect_num 14"
.LASF403:
	.string	"__BUILTIN_AVR_ROUNDLR 1"
.LASF670:
	.string	"_SFR_BYTE(sfr) _MMIO_BYTE(_SFR_ADDR(sfr))"
.LASF825:
	.string	"TCCR0A _SFR_IO8(0x24)"
.LASF392:
	.string	"__BUILTIN_AVR_FLASH_SEGMENT 1"
.LASF798:
	.string	"EEDR _SFR_IO8(0x20)"
.LASF1374:
	.string	"XRAMSIZE 0"
.LASF566:
	.string	"PRIiPTR PRIi16"
.LASF862:
	.string	"OCR0B_4 4"
.LASF667:
	.string	"_SFR_IO_ADDR(sfr) (_SFR_MEM_ADDR(sfr) - __SFR_OFFSET)"
.LASF735:
	.string	"PIND2 2"
.LASF976:
	.string	"CAL3 3"
.LASF46:
	.string	"__INT64_TYPE__ long long int"
.LASF1512:
	.string	"BLB1_MODE_2 (0xEF)"
.LASF1403:
	.string	"__BOOT_LOCK_BITS_0_EXIST "
.LASF211:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF1624:
	.string	"__WCHAR_T "
.LASF636:
	.string	"SCNo16 \"o\""
.LASF1597:
	.string	"___int_ptrdiff_t_h "
.LASF1198:
	.string	"OCR2A _SFR_MEM8(0xB3)"
.LASF891:
	.string	"SPE 6"
.LASF1204:
	.string	"OCR2_5 5"
.LASF816:
	.string	"EEAR7 7"
.LASF846:
	.string	"TCNT0_6 6"
.LASF442:
	.string	"__BUILTIN_AVR_BITSK 1"
.LASF693:
	.string	"DDB2 2"
.LASF924:
	.string	"WDRF 3"
.LASF1267:
	.string	"UCSR0A _SFR_MEM8(0xC0)"
.LASF558:
	.string	"PRIiFAST16 \"i\""
.LASF1372:
	.string	"RAMSTART (0x100)"
.LASF329:
	.string	"__HA_IBIT__ 8"
.LASF943:
	.string	"WDP1 1"
.LASF486:
	.string	"INT8_MIN (-INT8_MAX - 1)"
.LASF1464:
	.string	"SP _SFR_IO16(0x3D)"
.LASF206:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF311:
	.string	"__HQ_IBIT__ 0"
.LASF556:
	.string	"PRIi16 \"i\""
.LASF628:
	.string	"SCNoLEAST8 \"hho\""
.LASF1656:
	.string	"long long int"
.LASF1487:
	.string	"AVR_STACK_POINTER_HI_ADDR _SFR_IO_ADDR(SPH)"
.LASF146:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF776:
	.string	"EIFR _SFR_IO8(0x1C)"
.LASF1034:
	.string	"ADCL2 2"
.LASF1371:
	.string	"SPM_PAGESIZE 128"
.LASF645:
	.string	"SCNo32 \"lo\""
.LASF366:
	.string	"__AVR_ARCH__ 5"
.LASF336:
	.string	"__UHA_FBIT__ 8"
.LASF993:
	.string	"PCINT2 2"
.LASF267:
	.string	"__ULLFRACT_EPSILON__ 0x1P-64ULLR"
.LASF1459:
	.string	"PD5 PORTD5"
.LASF227:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1215:
	.string	"EXCLK 6"
.LASF880:
	.string	"GPIOR24 4"
.LASF157:
	.string	"__FLT_MAX__ 3.40282347e+38F"
.LASF1453:
	.string	"PC6 PORTC6"
.LASF169:
	.string	"__DBL_MAX_10_EXP__ 38"
.LASF1362:
	.string	"EE_READY_vect_num 22"
.LASF1484:
	.string	"AVR_STACK_POINTER_ADDR _SFR_IO_ADDR(SP)"
.LASF297:
	.string	"__ULACCUM_EPSILON__ 0x1P-32ULK"
.LASF801:
	.string	"EEDR2 2"
.LASF1118:
	.string	"ICR1 _SFR_MEM16(0x86)"
.LASF346:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF983:
	.string	"PCIE1 1"
.LASF1435:
	.string	"PIN3 3"
.LASF1114:
	.string	"TCNT1H4 4"
.LASF900:
	.string	"SPDR2 2"
.LASF419:
	.string	"__BUILTIN_AVR_COUNTLSLR 1"
.LASF1670:
	.string	"uart_sendstring"
.LASF936:
	.string	"BLBSET 3"
.LASF495:
	.string	"INT64_MIN (-INT64_MAX - 1LL)"
.LASF590:
	.string	"PRIXFAST16 \"X\""
.LASF684:
	.string	"PINB2 2"
.LASF1672:
	.string	"main.c"
.LASF1289:
	.string	"UCSZ01 2"
.LASF177:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF835:
	.string	"CS02 2"
.LASF1168:
	.string	"OCR1BH1 1"
.LASF1010:
	.string	"PCINT18 2"
.LASF1006:
	.string	"PCINT14 6"
.LASF234:
	.string	"__USFRACT_IBIT__ 0"
.LASF456:
	.string	"__BUILTIN_AVR_ULLRBITS 1"
.LASF1413:
	.string	"SLEEP_MODE_EXT_STANDBY (0x07<<1)"
.LASF148:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF1144:
	.string	"OCR1AL5 5"
.LASF673:
	.string	"_BV(bit) (1 << (bit))"
.LASF1460:
	.string	"PD6 PORTD6"
.LASF1092:
	.string	"WGM12 3"
.LASF380:
	.string	"__BUILTIN_AVR_NOP 1"
.LASF896:
	.string	"SPIF 7"
.LASF1397:
	.string	"HFUSE_DEFAULT (FUSE_BOOTSZ0 & FUSE_BOOTSZ1 & FUSE_SPIEN)"
.LASF106:
	.string	"__UINT16_MAX__ 0xffffU"
.LASF1417:
	.string	"PORT5 5"
.LASF1043:
	.string	"ADCH2 2"
.LASF1340:
	.string	"TIMER1_COMPA_vect_num 11"
.LASF1190:
	.string	"TCNT2_0 0"
.LASF987:
	.string	"ISC01 1"
.LASF511:
	.string	"UINT_FAST8_MAX UINT8_MAX"
.LASF769:
	.string	"TOV2 0"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 4"
.LASF1310:
	.string	"UBRR0_11 3"
.LASF829:
	.string	"COM0B1 5"
.LASF181:
	.string	"__LDBL_MIN_10_EXP__ (-37)"
.LASF907:
	.string	"ACIS0 0"
.LASF188:
	.string	"__LDBL_EPSILON__ 1.19209290e-7L"
.LASF1560:
	.string	"isinff isinf"
.LASF1266:
	.string	"TWAM6 6"
.LASF161:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF1473:
	.string	"SREG_T (6)"
.LASF787:
	.string	"GPIOR04 4"
.LASF1483:
	.string	"AVR_STACK_POINTER_REG SP"
.LASF1106:
	.string	"TCNT1L5 5"
.LASF1307:
	.string	"UBRR0_8 0"
.LASF1147:
	.string	"OCR1AH _SFR_MEM8(0x89)"
.LASF1640:
	.string	"_GCC_MAX_ALIGN_T "
.LASF1510:
	.string	"BLB0_MODE_4 (0xF7)"
.LASF853:
	.string	"OCR0A_4 4"
.LASF317:
	.string	"__TQ_IBIT__ 0"
.LASF653:
	.string	"SCNxFAST32 \"lx\""
.LASF1160:
	.string	"OCR1BL2 2"
.LASF1226:
	.string	"TWPS0 0"
.LASF963:
	.string	"PRTWI 7"
.LASF1461:
	.string	"PD7 PORTD7"
.LASF833:
	.string	"CS00 0"
.LASF1675:
	.string	"main"
.LASF226:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF1602:
	.string	"__SIZE_T__ "
.LASF745:
	.string	"DDD3 3"
.LASF1253:
	.string	"TWEN 2"
.LASF34:
	.string	"__SIZE_TYPE__ unsigned int"
.LASF729:
	.string	"PORTC4 4"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF1247:
	.string	"TWD4 4"
.LASF1058:
	.string	"ADCSRB _SFR_MEM8(0x7B)"
.LASF179:
	.string	"__LDBL_DIG__ 6"
.LASF1551:
	.string	"tanhf tanh"
.LASF1035:
	.string	"ADCL3 3"
.LASF489:
	.string	"INT16_MIN (-INT16_MAX - 1)"
.LASF243:
	.string	"__UFRACT_FBIT__ 16"
.LASF1653:
	.string	"unsigned int"
.LASF1578:
	.string	"SIGNAL(vector) void vector (void) __attribute__ ((signal, __INTR_ATTRS)); void vector (void)"
.LASF363:
	.string	"__AVR 1"
.LASF1567:
	.string	"fminf fmin"
.LASF1474:
	.string	"SREG_I (7)"
.LASF1277:
	.string	"TXB80 0"
.LASF1409:
	.string	"SLEEP_MODE_ADC (0x01<<1)"
.LASF1189:
	.string	"TCNT2 _SFR_MEM8(0xB2)"
.LASF1485:
	.string	"_HAVE_AVR_STACK_POINTER_HI 1"
.LASF724:
	.string	"PORTC _SFR_IO8(0x08)"
.LASF1339:
	.string	"TIMER1_CAPT_vect _VECTOR(10)"
.LASF337:
	.string	"__UHA_IBIT__ 8"
.LASF1467:
	.string	"SREG_C (0)"
.LASF1470:
	.string	"SREG_V (3)"
.LASF261:
	.string	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR"
.LASF1636:
	.string	"NULL"
.LASF1320:
	.string	"INT0_vect_num 1"
.LASF1334:
	.string	"TIMER2_COMPB_vect_num 8"
.LASF6:
	.string	"__GNUC_MINOR__ 2"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF423:
	.string	"__BUILTIN_AVR_COUNTLSULR 1"
.LASF1493:
	.string	"__AVR_LIBC_DATE_STRING__ \"20150208\""
.LASF654:
	.string	"SCNoPTR SCNo16"
.LASF863:
	.string	"OCR0B_5 5"
.LASF659:
	.string	"_MMIO_DWORD(mem_addr) (*(volatile uint32_t *)(mem_addr))"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ char"
.LASF736:
	.string	"PIND3 3"
.LASF977:
	.string	"CAL4 4"
.LASF446:
	.string	"__BUILTIN_AVR_BITSUK 1"
.LASF1031:
	.string	"ADCL _SFR_MEM8(0x78)"
.LASF5:
	.string	"__GNUC__ 8"
.LASF310:
	.string	"__HQ_FBIT__ 15"
.LASF818:
	.string	"EEAR8 0"
.LASF1180:
	.string	"COM2A0 6"
.LASF130:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF1205:
	.string	"OCR2_6 6"
.LASF369:
	.string	"__AVR_ENHANCED__ 1"
.LASF847:
	.string	"TCNT0_7 7"
.LASF694:
	.string	"DDB3 3"
.LASF417:
	.string	"__BUILTIN_AVR_COUNTLSHR 1"
.LASF603:
	.string	"PRIoPTR PRIo16"
.LASF1024:
	.string	"ICIE1 5"
.LASF121:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF1288:
	.string	"UCPHA0 1"
.LASF1478:
	.string	"YH r29"
.LASF944:
	.string	"WDP2 2"
.LASF1383:
	.string	"FUSE_CKSEL3 (unsigned char)~_BV(3)"
.LASF107:
	.string	"__UINT32_MAX__ 0xffffffffUL"
.LASF109:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF1604:
	.string	"_SYS_SIZE_T_H "
.LASF173:
	.string	"__DBL_EPSILON__ ((double)1.19209290e-7L)"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF251:
	.string	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR"
.LASF381:
	.string	"__BUILTIN_AVR_SEI 1"
	.ident	"GCC: (GNU) 8.2.0"
.global __do_copy_data
