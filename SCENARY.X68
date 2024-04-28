; ==============================================================================
; SCENARY MANAGEMENT
; ==============================================================================
         
; ------------------------------------------------------------------------------
SCEPLOT
; PLOT THE SCENARY
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------

            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #SCEPCOL,D1
            TRAP    #15
            
            CLR.W   D3
            MOVE.W  #SCENMB,D3
.LOOP       CLR.L   D0
            JSR     UTLRAND
            MOVE.W  D0,D1
            ADD.W   D0,D1
            ADD.W   D0,D1
            JSR     UTLRAND
            MOVE.W  D0,D2
            ADD.W   D0,D2
            CLR.L   D0
            MOVE.B  #82,D0
            TRAP    #15
            DBRA    D3,.LOOP
                 
            RTS




















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
