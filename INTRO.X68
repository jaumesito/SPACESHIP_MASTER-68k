; ==============================================================================
; INTRO SCREEN MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
ISCINIT
; INITIALIZE INTRO SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            JSR     DMMINIT
            CLR.W   (ISCTIMER)
            CLR.W   (SCRINTCT)
            RTS
        
; ------------------------------------------------------------------------------
ISCUPD
; UPDATES THE INTRO SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0/A1-A3,-(A7)
            
            BTST.B  #4,(KBDEDGE)
            BEQ     .CONT
            MOVE.W  #STAGAM,(STANEXT)
            
.CONT       ADDQ.W  #1,(ISCTIMER)
            CMP.W   #ISCMAXTM,(ISCTIMER)
            BLT     .DONE
            MOVE.W  #STAINS,(STANEXT)            
            
            ; INTRO SHOT AGENT CREATOR
.DONE       MOVE.B  (SCRCYCCT),D0
            AND.B   #%00011111,D0
            BNE     .GOUPD
            
            LEA     ISTINIT,A1
            LEA     ISTUPD,A2
            LEA     ISTPLOT,A3
            MOVE.W  #3,D0
            JSR     AGLADD
       
.GOUPD      JSR     AGLUPD
            MOVEM.L (A7)+,D0/A1-A3
            RTS
        
; ------------------------------------------------------------------------------
ISCPLOT
; PLOTS THE INTRO SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            JSR     AGLPLOT
            JSR     ISHPLOT        
            MOVEM.L D0-D1/A0,-(A7)
            
            CLR.L   D1
            MOVE.B  #81,D0
            TRAP    #15
            
            LEA     .TXT1,A0
            MOVE.B  #10,D0
            JSR     UTLPRINT
            
            BTST.B  #4,(SCRCYCCT)
            BEQ     .DONE
            
            LEA     .TXT2,A0
            MOVE.B  #25,D0
            JSR     UTLPRINT
            
            
            
.DONE       MOVEM.L (A7)+,D0-D1/A0

            RTS
.TXT1       DC.B    'SPACE SHIPS MASTER',0
.TXT2       DC.B    'PRESS SPACE TO START',0
            DS.W    0











*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
