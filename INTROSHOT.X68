; ==============================================================================
; INTRO SHOT MANAGEMENT (AGENT)
; IST1POSX (W)  (A0)
; IST1POSY (W) 2(A0)
; IST2POSX (W) 4(A0)
; IST2POSY (W) 6(A0)
; ==============================================================================
    
; ------------------------------------------------------------------------------
ISTINIT
; INITIALIZE INTRO SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVE.W  #ISHPOSX+ISHWIDTH/2,(A0)
            MOVE.W  #ISHPOSY+ISHHEIGH/2,2(A0)
            MOVE.W  #ISHPOSX-ISHWIDTH/2,4(A0)
            MOVE.W  2(A0),6(A0)
            RTS
        
; ------------------------------------------------------------------------------
ISTUPD
; UPDATES THE INTRO SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            
            MOVEM.W D0-D1,-(A7)
        
            ; UPDATE SHOT COORDINATES
            MOVE.W  2(A0),D0
            MOVE.W  6(A0),D1
            SUB.W   #SHTSPEED,D0
            SUB.W   #SHTSPEED,D1
        
            ; CHECK VERTICAL COLLISIONS
            CMP.W   #SHTHEIGH,D1
            BLT     .COLTOP
            BRA     .DONE
            
.COLTOP     JSR     AGLKILL
            BRA     .DONE                 
        
            ; STORE POSITION
.DONE       MOVE.W  D0,2(A0)
            MOVE.W  D1,6(A0)

            MOVEM.W (A7)+,D0-D1
            
            RTS
        
; ------------------------------------------------------------------------------
ISTPLOT
; PLOT THE INTRO SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
        
            MOVEM.L D0-D4,-(A7)
        
            ; DRAW RIGHT SHOT
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
            
            ; DRAW LEFT SHOT
            ; DEFINE COORDINATES
            MOVE.W  4(A0),D1
            SUB.W   #SHTWIDTH/2,D1
            MOVE.W  6(A0),D2
            SUB.W   #SHTHEIGH,D2
            MOVE.W  D1,D3
            ADD.W   #SHTWIDTH,D3
            MOVE.W  6(A0),D4
            
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS








*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
