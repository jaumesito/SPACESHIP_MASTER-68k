; ==============================================================================
; TITLE		:
; AUTHOR	:
; DSCRPTN	:
; HISTORY	:
; ==============================================================================
    
            ORG     $1000
			
            INCLUDE "CONST.X68"
            INCLUDE "SYSCONST.X68"
            INCLUDE "LIB/DMMCONST.X68"
            INCLUDE "LIB/UTLCONST.X68"
            INCLUDE "LIB/DMMCODE.X68"
            INCLUDE "SYSTEM.X68"
            INCLUDE "LIB/AGLCODE.X68"
            INCLUDE "LIB/UTLCODE.X68"
            INCLUDE "SHOT.X68"
            INCLUDE "ENEMYSHOT.X68"
            INCLUDE "INTROSHOT.X68"
            INCLUDE "SHIP.X68"
            INCLUDE "INTROSHIP.X68"
            INCLUDE "ENEMIES.X68"
            INCLUDE "ENEMIESATTRACT.X68"
            INCLUDE "SPAWNER.X68"
            INCLUDE "SPAWNERATTRACT.X68"
            INCLUDE "EXPLOSION.X68"
            INCLUDE "SCENARY.X68"
            INCLUDE "LIMITLINE.X68"
            INCLUDE "SCORE.X68"
            INCLUDE "GAME.X68"
            INCLUDE "INTRO.X68"
            INCLUDE "INSTRUCTIONS.X68"
            INCLUDE "WIN.X68"
            INCLUDE "GOVER1.X68"
            INCLUDE "GOVER2.X68"
            INCLUDE "ATTRACT.X68"
            INCLUDE "STATES.X68"
            
; --- DATA INCLUDES ------------------------------------------------------------

            IFEQ    ATRSAVE
ATRDATA     INCBIN  'DATA/KEYSTROK.DAT'         ; RECORDED DATA
            DS.W    0
            ENDC
          
            
            
START

; --- INITIALIZATION -----------------------------------------------------------

            ORI.W   #$0700,SR
            JSR     SYSINIT
            JSR     UTLINIT
            JSR     STAINIT
            
            
.LOOP

; --- UPDATE -------------------------------------------------------------------

; READ INPUT DEVICES

            TRAP    #KBDUPTN
            
; UPDATE GAME LOGIC

            JSR     STAUPD
            
; --- SYNC ---------------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
; --- PLOT ---------------------------------------------------------------------

            JSR     STAPLOT
            
            TRAP    #SCRUPTN                ; UPDATE DOUBLE BUFFER
            
            BRA     .LOOP

            SIMHALT
            
            INCLUDE "VARS.X68"
            INCLUDE "LIB/UTLVARS.X68"
            INCLUDE "SYSVARS.X68"
            INCLUDE "LIB/DMMVARS.X68"

            END     START























*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
