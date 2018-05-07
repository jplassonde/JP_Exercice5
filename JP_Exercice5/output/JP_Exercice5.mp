Project:      output/JP_Exercice5
Build Number: 0
Date:         Mon May 07 13:54:10 2018
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   0066 =    102. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0150  LoadConfigTBL_jp_exercice5_Bank0
       0187  LoadConfigTBL_jp_exercice5_Bank1
       01B6  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01B6   012F =    303. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       01B6  LoadConfigTBL_jp_exercice5_Ordered
       027B  LoadConfigInit
       027B  _LoadConfigInit
       028E  _LoadConfig_jp_exercice5
       028E  LoadConfig_jp_exercice5
       02E5  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   02E5   03A9 =    937. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       02E5  _SleepTimer_ISR
       0305  SleepTimer_EnableInt
       0305  _SleepTimer_EnableInt
       0309  SleepTimer_DisableInt
       0309  _SleepTimer_DisableInt
       030D  _SleepTimer_Start
       030D  SleepTimer_Start
       031E  _SleepTimer_Stop
       031E  SleepTimer_Stop
       031F  SleepTimer_SetInterval
       031F  _SleepTimer_SetInterval
       0331  SleepTimer_TickWait
       0331  _SleepTimer_TickWait
       0340  SleepTimer_SyncWait
       0340  _SleepTimer_SyncWait
       034E  _SleepTimer_bGetTickCntr
       034E  SleepTimer_bGetTickCntr
       0351  SleepTimer_SetTimer
       0351  _SleepTimer_SetTimer
       0354  _SleepTimer_bGetTimer
       0354  SleepTimer_bGetTimer
       0357  _SleepTimer_iGetTickCntr
       0357  SleepTimer_iGetTickCntr
       0362  _SleepTimer_lGetTickCntr
       0362  SleepTimer_lGetTickCntr
       037B  LCD_PrCString
       037B  _LCD_PrCString
       038D  LCD_HEX_STR
       039D  _LCD_PrHexByte
       039D  LCD_PrHexByte
       03B0  _LCD_PrHexInt
       03B0  LCD_PrHexInt
       03B7  LCD_PrString
       03B7  _LCD_PrString
       03C1  _LCD_Write_Data
       03C1  LCD_WriteData
       03C1  LCD_Write_Data
       03C1  _LCD_WriteData
       03D5  LCD_Control
       03D5  _LCD_Control
       047C  LCD_Init
       047C  _LCD_Start
       047C  LCD_Start
       047C  _LCD_Init
       04E8  LCD_ROW_OFFSET
       04EC  _LCD_Position
       04EC  LCD_Position
       04F8  LCD_Delay50uTimes
       04F8  _LCD_Delay50uTimes
       04FE  LCD_Delay50u_Table
       0506  LCD_Delay50u
       0506  _LCD_Delay50u
       051A  LCD_DrawBG
       0540  _LCD_DrawBG
       0569  LCD_DrawVBG
       0596  _LCD_DrawVBG
       05C6  LCD_InitVBG
       05C6  _LCD_InitVBG
       05F3  LCD_BG_TYPE1
       05FA  LCD_BG_TYPE2
       0601  LCD_InitBG
       0601  _LCD_InitBG
       0631  _Counter16_ISR
       0632  _Counter16_EnableInt
       0632  Counter16_EnableInt
       0636  Counter16_DisableInt
       0636  _Counter16_DisableInt
       063A  _Counter16_Start
       063A  Counter16_Start
       063E  Counter16_Stop
       063E  _Counter16_Stop
       0642  Counter16_WritePeriod
       0642  _Counter16_WritePeriod
       0648  Counter16_WriteCompareValue
       0648  _Counter16_WriteCompareValue
       064E  Counter16_wReadCompareValue
       064E  _wCounter16_ReadCompareValue
       064E  _Counter16_wReadCompareValue
       064E  wCounter16_ReadCompareValue
       0654  Counter16_wReadCounter
       0654  wCounter16_ReadCounter
       0654  _Counter16_wReadCounter
       0654  _wCounter16_ReadCounter
       068E  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   068E   0A7B =   2683. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       068E  __text_start
       0694  _main
       074E  PSoC_GPIO_ISR
       0B5C  _ltoa
       0D65  _ftoa
       1109  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __rZ
       0001  __rY
       0002  __rX
       0003  __r7
       0004  __r6
       0005  __r5
       0006  __r4
       0007  __r3
       0008  __r2
       0009  __r1
       000A  __r0
       000B  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   000B   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000B  SleepTimer_fTick
       000B  _SleepTimer_fTick
       000C  _SleepTimer_bTimerValue
       000C  SleepTimer_bTimerValue
       000D  SleepTimer_bCountDown
       000D  _SleepTimer_bCountDown
       000E  SleepTimer_TickCount
       000E  _SleepTimer_TickCount
       0012  Port_0_Data_SHADE
       0012  NO_SHADOW
       0012  _NO_SHADOW
       0012  _Port_0_Data_SHADE
       0013  _Port_2_Data_SHADE
       0013  Port_2_Data_SHADE
       0014  _Port_2_DriveMode_0_SHADE
       0014  Port_2_DriveMode_0_SHADE
       0015  Port_2_DriveMode_1_SHADE
       0015  _Port_2_DriveMode_1_SHADE
       0016  __InterruptRAM_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0016   0020 =     32. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0016  __bss_start
       0018  int_flag
       0036  __ramareas_end
       0036  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   00D7 =    215. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00D4  _bGetPowerSetting
       00D4  bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.asm ]
<library>	[ sleeptimerint.asm, sleeptimer.asm, psocgpioint.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm ]
[ counter16int.asm, counter16.asm, rZ.asm, rY.asm, rX.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm ]
[ r1.asm, r0.asm, divmodu_32x32_32_util.asm, fp_analysiseject_f16.asm, fp_clrreg_f16.asm, fp_convert_saveres_f16.asm ]
[ fp_nan_res_f16.asm, fp_saveres_f16.asm, fp_sendtoreg_f16.asm, fp_sinf_res_f16.asm, fp_szero_res_f16.asm ]
[ fp_type_oprnd_f16.asm, fp_unnormal_f16.asm, fpadd_f16.asm, fpcmp_util.asm, fpmul_f16.asm ]
[ i_div32_block_util.asm, mulu_8x8_16_f16.asm, ulong2fp_f16.asm, ltoa.s, ftoa.s ]

Area Definitions

-blit:0x150.0x3fff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

