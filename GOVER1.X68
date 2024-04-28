; ==============================================================================
; GAME OVER SCREEN 1 MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
GOV1INIT
; INITIALIZE GAME OVER SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            JSR     DMMINIT
            RTS
        
; ------------------------------------------------------------------------------
GOV1UPD
; UPDATES THE GAME OVER SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            BTST.B  #4,(KBDEDGE)
            BEQ     .CONT
            CLR.W   (STANEXT)
.CONT       RTS
        
; ------------------------------------------------------------------------------
GOV1PLOT
; PLOTS THE GAME OVER SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------        

            MOVEM.L D0-D1/A0,-(A7)
            
            CLR.L   D1
            MOVE.B  #81,D0
            TRAP    #15
            
            LEA     .TXT1,A0
            MOVE.B  #10,D0
            JSR     UTLPRINT
            LEA     .TXT2,A0
            JSR     UTLPRINT
            
            BTST.B  #4,(SCRCYCCT)
            BEQ     .DONE
            
            LEA     .TXT3,A0
            MOVE.B  #25,D0
            JSR     UTLPRINT
            
            
            
.DONE       MOVEM.L (A7)+,D0-D1/A0

            RTS
.TXT1       DC.B    'GAME OVER',0
.TXT2       DC.B    'YOU HAVE GOT HIT TOO MANY TIMES',0
.TXT3       DC.B    'PRESS SPACE TO CONTINUE',0
            DS.W    0










            
*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
