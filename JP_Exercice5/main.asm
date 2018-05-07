;;----------------------------------------------------------------------------
;; Description: Sensors and Interfaces Lab 5 - Calibration
;;
;; The program takes a reading from the HC-SR04 ultrasonic sensor every second,
;; converts it to float and calculates the distance according to the first degree
;; polynomial y = 57.54796x + 19.3826 ; Std error ~ 0.22
;;
;; In practice, the results are off by around half a centimeter up to 7cm then
;; are off by +- 1%. 
;; The initial measurements were slightly lacking in precision and could have 
;; been better with more appropriate tools.
;;  
;; Two successive false readings occur if objects are out of range. 
;; This issue has not been investigated or fixed.
;; 
;; Author: Jean-Philippe Lassonde #1504236
;; Date: May 7th 2018
;; Course ID: Sensors and Interfaces - TX00CS03-3002 
;;----------------------------------------------------------------------------


include "m8c.inc"       ; part specific constants and macros
include "memory.inc"    ; Constants & macros for SMM/LMM and Compiler
include "PSoCAPI.inc"   ; PSoC API definitions for all User Modules

export _main

area bss (ram, rel )
counter_buffer: blk 2
int_flag:: blk 1

area text(rom, rel )

.LITERAL 
BLANK:
	asciz "     "

.ENDLITERAL 

_main:
		
	mov [int_flag], 0						; Init RAM flag to 0
	or reg[Echo_IntEn_ADDR], Echo_MASK		; Enable GPIO Int on Echo pin
	M8C_EnableIntMask INT_MSK0, INT_MSK0_GPIO
	
    M8C_EnableGInt ; Enable Global Interrupts	
	
	lcall LCD_Start					; Init/start the LCD
	lcall SleepTimer_EnableInt		; Enable & start the Sleep Timer
	lcall SleepTimer_Start
	lcall Counter16_Start			; Start Counter
	
;--------------- MAIN LOOP -----------------;
.loop:
; Set SleepTimer
	mov A, 1
	lcall SleepTimer_SetTimer		; Set Sleep Timer to count 1 sec

; Send Trigger signal on P0.0 (high 11us)
	SetTrigger_Data
	nop
	nop
	nop
	nop
	nop
	nop
	ClearTrigger_Data
	

.poll_counter:
	cmp [int_flag], 0			; Wait for Echo to go low
	jz .poll_counter
	
	lcall Counter16_wReadCounter	; Read counter value 
	mov [counter_buffer], X			; Store it into counter_buffer
	mov [counter_buffer+1], A
	
	mov A, 0xFF						; Calculate Microsecond length of Echo
	sub A, [counter_buffer+1]		; by substracting the resulting counter value
	mov [counter_buffer+1], A		; from the initial value (65535; 0xFFFF)
	mov A, 0xFF
	sbb A, [counter_buffer]
	mov [counter_buffer], A

	mov A, 0						; Set LCD position to the first char of the first row
	mov X, 0
	lcall LCD_Position

;----- Set result pointer & allocate 4 bytes for pointer
	mov A, 0		; Push result address at current sp + 2
	push A			; MSByte = 0
	mov X, SP
	inc X			; LSByte = SP+1
	push X
	add SP, 4		; Allocate 4 bytes for results

;---- UL to FP Convert ---------
	mov A, 0
	push A 			; FP convert result address
	push X			
	push A			; 2 most significant bytes = 0 (4 bytes long unsigned)
	push A
	mov A, [counter_buffer]	; Push counter value on stack
	push A
	mov A, [counter_buffer+1]
	push A
	lcall _ulong2fp	; convert to float
	add SP, -6		; pop stack, keeping the result & the result pointer at bottom
	
;---- FP Add with Intercept ---- (-19.3826)
; negative number addition used instead of substraction to use operand 2 
; already on the stack

	mov A, 0xc1		; Push floating point number (-19.3826)
	push A
	mov A, 0x9b
	push A
	mov A, 0x0f
	push A
	mov A, 0x91
	push A
	lcall _fpadd	; Call floating point addition
	add SP, -4		; Push operand 1 off the stack. Result took operand 2 place.
	
;---- FP Mult with "slope" ---- 0.173768... (1/57.3554 * 10 to get mm value)
; Multiplying with reciprocal instead of dividing, again to reuse operand 2 still on the stack
; (and up to twice as fast)

	mov A, 0x3e		; Push floating point number (~0.173768)
	push A
	mov A, 0x31
	push A
	mov A, 0xf0
	push A
	mov A, 0x3d
	push A
	lcall _fpmul	; Call floating point multiplication
	add SP, -4		; Pop operand 1 off the stack.

	mov X, SP
	mov [x-5], counter_buffer ; Reuse the counter_buffer ram block for the returned ftoa status

	lcall _ftoa				  ; Call ftoa
	add SP, -6				  ; discard the float & the status (no check)
	
	mov A, 0				  ; String pointer MSByte = 0
	mov X, [__r1]			  ; Ftoa return str pointer in __r1
	lcall LCD_PrString		  ; Print the value in mm on the LCD
	
	mov A, >BLANK			  ; Clear excess characters from the LCD
	mov X, <BLANK			  ; in case the current value is shorter than the previous one
	lcall LCD_PrCString

	lcall Counter16_Stop			; Stop the counter
	mov X, 0xFF						; Reinit the period to 0xFFFF
	mov A, 0xFF
	lcall Counter16_WritePeriod
	lcall Counter16_Start			; Restart counter
	mov [int_flag], 0				; Clear interrupt flag
	
.sleep_delay:
	lcall SleepTimer_bGetTimer	; Get the Sleep Timer count
	cmp A, 0	    			; Check if it expired
	jnz .sleep_delay			; loop until timer expired (1 second each loop)

	jmp .loop					; Jump back to main loop.
