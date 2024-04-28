; ==============================================================================
; LIMIT LINE MANAGEMENT
; ==============================================================================
        
; ------------------------------------------------------------------------------
LIMPLOT
; PLOTS THE LIMIT LINE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)
            
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #LIMPCOL,D1
            TRAP    #15
            
            ; DRAW LINE
            MOVE.B  #84,D0
            MOVE.W  #LIMPOSX,D1
            MOVE.W  #LIMPOSY,D2
            MOVE.W  D1,D3
            ADD.W   #LIMWIDTH,D3
            MOVE.W  D2,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS






*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
