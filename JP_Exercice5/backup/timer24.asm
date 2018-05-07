;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: Timer24.asm
;;   Version: 2.6, Updated on 2015/3/4 at 22:27:47
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Timer24 User Module software implementation file
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "Timer24.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  Timer24_EnableInt
export _Timer24_EnableInt
export  Timer24_DisableInt
export _Timer24_DisableInt
export  Timer24_Start
export _Timer24_Start
export  Timer24_Stop
export _Timer24_Stop
export  Timer24_WritePeriod
export _Timer24_WritePeriod
export  Timer24_WriteCompareValue
export _Timer24_WriteCompareValue
export  Timer24_ReadCompareValue
export _Timer24_ReadCompareValue
export  Timer24_ReadTimer
export _Timer24_ReadTimer
export  Timer24_ReadTimerSaveCV
export _Timer24_ReadTimerSaveCV

; The following functions are deprecated and subject to omission in future releases
;
export  Timer24_ReadCounter       ; obsolete
export _Timer24_ReadCounter       ; obsolete
export  Timer24_CaptureCounter    ; obsolete
export _Timer24_CaptureCounter    ; obsolete


AREA jp_exercice5_RAM (RAM,REL)

;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------


;-----------------------------------------------
; Variable Allocation
;-----------------------------------------------


AREA UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_EnableInt
;
;  DESCRIPTION:
;     Enables this timer's interrupt by setting the interrupt enable mask bit
;     associated with this User Module. This function has no effect until and
;     unless the global interrupts are enabled (for example by using the
;     macro M8C_EnableGInt).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.                    
;  RETURNS:      Nothing.
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer24_EnableInt:
_Timer24_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer24_EnableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_DisableInt
;
;  DESCRIPTION:
;     Disables this timer's interrupt by clearing the interrupt enable
;     mask bit associated with this User Module.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer24_DisableInt:
_Timer24_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer24_DisableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_Start
;
;  DESCRIPTION:
;     Sets the start bit in the Control register of this user module.  The
;     timer will begin counting on the next input clock.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer24_Start:
_Timer24_Start:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer24_Start_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_Stop
;
;  DESCRIPTION:
;     Disables timer operation by clearing the start bit in the Control
;     register of the LSB block.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer24_Stop:
_Timer24_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer24_Stop_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_WritePeriod
;
;  DESCRIPTION:
;     Write the 24-bit period value into the Period register (DR1). If the
;     Timer user module is stopped, then this value will also be latched
;     into the Count register (DR0).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 DWORD dwPeriodValue (passed on stack)
;  RETURNS:   Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
_Timer24_WritePeriod:
   RAM_PROLOGUE RAM_USE_CLASS_2
 Timer24_WritePeriod:
   mov   X, SP
   mov   A, [X-5]                                ; load the period registers
   mov   reg[Timer24_PERIOD_MSB_REG], A
   mov   A, [X-4]
   mov   reg[Timer24_PERIOD_ISB_REG], A
   mov   A, [X-3]
   mov   reg[Timer24_PERIOD_LSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_2
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_WriteCompareValue
;
;  DESCRIPTION:
;     Writes compare value into the Compare register (DR2).
;
;     NOTE! The Timer user module must be STOPPED in order to write the
;           Compare register. (Call Timer24_Stop to disable).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    fastcall16 DWORD dwCompareValue (passed on stack)
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
_Timer24_WriteCompareValue:
   RAM_PROLOGUE RAM_USE_CLASS_2
 Timer24_WriteCompareValue:
   mov   X, SP
   mov   A, [X-5]                                ; load the compare registers
   mov   reg[Timer24_COMPARE_MSB_REG], A
   mov   A, [X-4]
   mov   reg[Timer24_COMPARE_ISB_REG], A
   mov   A, [X-3]
   mov   reg[Timer24_COMPARE_LSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_2
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_ReadCompareValue
;
;  DESCRIPTION:
;     Reads the Compare registers.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 DWORD * pdwCompareValue
;             (pointer: LSB in X, MSB in A)
;  RETURNS:   Nothing (but see Side Effects).
;  SIDE EFFECTS:
;    The DWORD pointed to by X takes on the value read from DR2
;
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;          
;    Currently only the page pointer registers listed below are modified:
;          IDX_PP
;
 Timer24_ReadCompareValue:
_Timer24_ReadCompareValue:
   RAM_PROLOGUE RAM_USE_CLASS_3
   RAM_SETPAGE_IDX A 
   mov   [X], 0
   mov   A, reg[Timer24_COMPARE_MSB_REG]
   mov   [X+1], A
   mov   A, reg[Timer24_COMPARE_ISB_REG]
   mov   [X+2], A
   mov   A, reg[Timer24_COMPARE_LSB_REG]
   mov   [X+3], A
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_ReadTimerSaveCV
;
;  DESCRIPTION:
;     Retrieves the value in the Count register (DR0), preserving the
;     value in the compare register (DR2).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 DWORD * pdwCount
;             (pointer: LSB in X, MSB in A, for pass-by-reference update)
;  RETURNS:   Nothing (but see Side Effects).
;  SIDE EFFECTS:
;     1) The DWORD pointed to by X takes on the value read from DR0
;     2) May cause an interrupt, if interrupt on Compare is enabled.
;     3) If enabled, Global interrupts are momentarily disabled.
;     4) The user module is stopped momentarily while the compare value is
;        restored.  This may cause the Count register to miss one or more
;        counts depending on the input clock speed.
;  
;     5) The A and X registers may be modified by this or future implementations
;        of this function.  The same is true for all RAM page pointer registers in
;        the Large Memory Model.  When necessary, it is the calling function's
;        responsibility to perserve their values across calls to fastcall16 
;        functions.
;              
;        Currently only the page pointer registers listed below are modified: 
;             IDX_PP
;
;  THEORY of OPERATION:
;     1) Read and save the Compare register.
;     2) Read the Count register, causing its data to be latched into
;        the Compare register.
;     3) Read and save the Counter value, now in the Compare register,
;        to the buffer.
;     4) Disable global interrupts
;     5) Halt the timer
;     6) Restore the Compare register values
;     7) Start the Timer again
;     8) Restore global interrupt state
;
 Timer24_ReadTimerSaveCV:
_Timer24_ReadTimerSaveCV:
 Timer24_ReadCounter:                            ; this name deprecated
_Timer24_ReadCounter:                            ; this name deprecated

   RAM_PROLOGUE RAM_USE_CLASS_3
   RAM_SETPAGE_IDX A 
   ; save the Control register on the stack
   mov   A, reg[Timer24_CONTROL_LSB_REG]
   push  A

   ; save the Compare register value
   mov   A, reg[Timer24_COMPARE_MSB_REG]
   push  A
   mov   A, reg[Timer24_COMPARE_ISB_REG]
   push  A
   mov   A, reg[Timer24_COMPARE_LSB_REG]
   push  A

   ; Read the LSB count. This latches the Count register data into the
   ; Compare register of all bytes of chained PSoC blocks!
   ; This may cause an interrupt.
   mov   A, reg[Timer24_COUNTER_LSB_REG]

   ; Read the Compare register, which contains the counter value
   ; and store the return result
   mov   [X], 0
   mov   A, reg[Timer24_COMPARE_MSB_REG]
   mov   [X+1], A
   mov   A, reg[Timer24_COMPARE_ISB_REG]
   mov   [X+2], A
   mov   A, reg[Timer24_COMPARE_LSB_REG]
   mov   [X+3], A

   ; determine current interrupt state and save in X
   mov   A, 0
   tst   reg[CPU_F], FLAG_GLOBAL_IE
   jz    .SetupStatusFlag
   mov   A, FLAG_GLOBAL_IE
.SetupStatusFlag:
   mov   X, A

   ; disable interrupts for the time being
   M8C_DisableGInt

   ; stop the timer
   Timer24_Stop_M

   ; Restore the Compare register
   pop   A
   mov   reg[Timer24_COMPARE_LSB_REG], A
   pop   A
   mov   reg[Timer24_COMPARE_ISB_REG], A
   pop   A
   mov   reg[Timer24_COMPARE_MSB_REG], A

   ; restore start state of the timer
   pop   A
   mov   reg[Timer24_CONTROL_LSB_REG], A

   ; push the flag register to restore on the stack
   push  X

   RAM_EPILOGUE RAM_USE_CLASS_3
   ; Use RETI because it pops a the flag register off the stack
   ; and then returns to the caller.
   reti

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer24_ReadTimer
;
;  DESCRIPTION:
;     Performs a software capture of the Count register.  A synchronous
;     read of the Count register is performed.  The timer is NOT stopped.
;
;     WARNING - this will cause loss of data in the Compare register.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 DWORD * pdwCount
;             (pointer: LSB in X, MSB in A, for pass-by-reference update)
;  RETURNS:   Nothing (but see Side Effects).
;  SIDE EFFECTS:
;     1) The DWORD pointed to by X takes on the value read from DR2.
;     2) May cause an interrupt.
;     3) The A and X registers may be modified by this or future implementations
;        of this function.  The same is true for all RAM page pointer registers in
;        the Large Memory Model.  When necessary, it is the calling function's
;        responsibility to perserve their values across calls to fastcall16 
;        functions.
;              
;        Currently only the page pointer registers listed below are modified: 
;              IDX_PP

;
;  THEORY of OPERATION:
;     1) Read the Count register - this causes the count value to be
;        latched into the Compare registers.
;     2) Read and return the Count register values from the Compare
;        registers into the return buffer.
;
 Timer24_ReadTimer:
_Timer24_ReadTimer:
 Timer24_CaptureCounter:                         ; this name deprecated
_Timer24_CaptureCounter:                         ; this name deprecated

   RAM_PROLOGUE RAM_USE_CLASS_3
   ; Read the LSB of the Count register, DR0. This latches the count data into
   ; the Compare register of all bytes of chained PSoC blocks and may cause
   ; an interrupt.
   RAM_SETPAGE_IDX A 
   mov   A, reg[Timer24_COUNTER_LSB_REG]

   ; Read the Compare register, which contains the counter value
   ; and store ther return result
   mov   [X], 0
   mov   A, reg[Timer24_COMPARE_MSB_REG]
   mov   [X+1], A
   mov   A, reg[Timer24_COMPARE_ISB_REG]
   mov   [X+2], A
   mov   A, reg[Timer24_COMPARE_LSB_REG]
   mov   [X+3], A
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret

.ENDSECTION

; End of File Timer24.asm
