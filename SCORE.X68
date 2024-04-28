; ==============================================================================
; SCOREBOARD MANAGEMENT
; ==============================================================================

; ------------------------------------------------------------------------------
SCOINIT
; INITIALIZE SCOREBOARD
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            CLR.W   (SCODST)
            CLR.W   (SCOHIT)
            CLR.W   (SCOENE)
            RTS
        
; ------------------------------------------------------------------------------
SCOPLOT
; PLOT THE SCOREBOARD
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
        
            MOVEM.L D0-D1/A1,-(A7)

            ; SET BACKGROUND COLOR
            MOVE.B  #81,D0
            MOVE.L  #SCOFCOL,D1
            TRAP    #15
        
            ; SET LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE1,D1
            TRAP    #15
        
            ; PRINT LINE
            LEA     .TXT1,A1
            CLR.L   D1
            MOVE.W  (SCODST),D1
            MOVE.B  #17,D0
            TRAP    #15
            
            ; SET SECOND LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE2,D1
            TRAP    #15

            ; PRINT SECOND LINE
            LEA     .TXT2,A1
            CLR.L   D1
            MOVE.W  (SCOHIT),D1
            MOVE.B  #17,D0
            TRAP    #15
        
            MOVEM.L (A7)+,D0-D1/A1
        
            RTS
.TXT1       DC.B    'SCORE  : ',0
.TXT2       DC.B    'HITS   : ',0










*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
