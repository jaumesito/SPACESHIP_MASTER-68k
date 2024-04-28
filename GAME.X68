; ==============================================================================
; GAME MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
GAMINIT
; INITIALIZE GAME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            JSR     DMMINIT
            IFNE    ATRSAVE
            JSR     ATRINIT                 ; ONLY IN ATTRACT RECORD MODE
            ENDC
            JSR     SHPINIT
            BRA     SCOINIT
        
; ------------------------------------------------------------------------------
GAMUPD
; UPDATES THE GAME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------                       
            IFNE    ATRSAVE
            JSR     ATRUPD                  ; ONLY IN ATTRACT RECORD MODE
            ENDC
            JSR     AGLUPD
            JSR     SPWUPD
            JSR     SHPUPD
            
            ; CHECK VICTORY
            CMP.W   #SCODSTMX,(SCODST)
            BLT     .CHKLOSS
            MOVE.W  #STAWIN,(STANEXT)
            BRA     .DONE
            
            ; CHECK DEFEAT BC OF BEING HIT
.CHKLOSS    CMP.W   #SCOHITMX,(SCOHIT)
            BLT     .CHKENEL
            MOVE.W  #STAGOV1,(STANEXT)
            BRA     .DONE
            
            ; CHECK DEFEAT BC OF ENEMY CROSSING THE LINE
.CHKENEL    CMP.W   #SCOENEMX,(SCOENE)
            BLT     .DONE
            MOVE.W  #STAGOV2,(STANEXT)
            
.DONE       RTS
        
; ------------------------------------------------------------------------------
GAMPLOT
; PLOTS THE GAME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------        

            JSR     AGLPLOT
            JSR     SCEPLOT
            JSR     LIMPLOT
            JSR     SCOPLOT
            BRA     SHPPLOT 
            
       
















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
