; ==============================================================================
; SHOT MANAGEMENT (AGENT)
; SHTPOSX (W)  (A0)
; SHTPOSY (W) 2(A0)
; ==============================================================================
    
; ------------------------------------------------------------------------------
SHTINIT
; INITIALIZE SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
;             D1 X COORDINATE
;             D2 Y COORDINATE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.W D1-D2,-(A7)
            MOVE.W  D1,(A0)
            MOVE.W  D2,2(A0)
            MOVEM.W (A7)+,D1-D2
            RTS
        
; ------------------------------------------------------------------------------
SHTUPD
; UPDATES THE SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            SUB.W   #SHTSPEED,2(A0)         ; MOVE
            CMP.W   #SHTHEIGH,(A0)          ; KILL IF OUT OF SCREEN
            BLE     AGLKILL
            MOVEM.L A0-A1/D0-D7,-(A7)
            MOVE.W  (A0),D2
            MOVE.W  2(A0),D3
            MOVE.W  #SHTWIDTH,D5
            MOVE.W  #SHTHEIGH,D7
            MOVE.L  A0,A1
            MOVE.W  #ENEAGN,D0
            JSR     DMMFRSTO
.LOOP       CMP.L   #0,A0
            BEQ     .END
            MOVE.W  8(A0),D0
            SUB.W   #ENEWIDTH/2,D0
            MOVE.W  10(A0),D1
            SUB.W   #ENEHEIGH/2,D1
            MOVE.W  #ENEWIDTH,D4
            MOVE.W  #ENEHEIGH,D6
            JSR     UTLCHCOL
            TST.B   D0
            BNE     .EXPLO
            MOVE.W  #ENEAGN,D0
            JSR     DMMNEXTO
            BRA     .LOOP
.END        MOVEM.L (A7)+,A0-A1/D0-D7
            RTS            
.EXPLO      ADD.L   #8,A0
            JSR     ENEXPLO
            MOVE.L  A1,A0
            JSR     AGLKILL            
            ADDQ.W  #1,(SCODST)
            BRA     .END
        
; ------------------------------------------------------------------------------
SHTPLOT
; PLOT THE SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
        
            MOVEM.L D0-D4,-(A7)
        
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #SHTPCOL,D1
            TRAP    #15
        
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #SHTFCOL,D1
            TRAP    #15
        
            ; DEFINE COORDINATES
            MOVE.W  (A0),D1
            SUB.W   #SHTWIDTH/2,D1
            MOVE.W  2(A0),D2
            SUB.W   #SHTHEIGH,D2
            MOVE.W  D1,D3
            ADD.W   #SHTWIDTH,D3
            MOVE.W  2(A0),D4
        
            ; DRAW RECTANGLE
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS








*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
