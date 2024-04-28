; ==============================================================================
; EXPLOSION MANAGEMENT (AGENT)
; EXPPOSX (W)  (A0)
; EXPPOSY (W) 2(A0)
; ==============================================================================
    
; ------------------------------------------------------------------------------
EXPINIT
; INITIALIZE EXPLOSION
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
            MOVE.W  #5,(EXPRAD)
            MOVE.W  #1,(LEXPRAD)
            RTS
        
; ------------------------------------------------------------------------------
EXPUPD
; UPDATES THE EXPLOSION
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            CMP.W   #EXPMXRAD,(EXPRAD)
            BEQ     .KILL
            ADDQ.W  #1,(EXPRAD)
            ADDQ.W  #1,(LEXPRAD)
            BRA     .END
.KILL       JSR     AGLKILL
.END        RTS
        
; ------------------------------------------------------------------------------
EXPPLOT
; PLOT THE EXPLOSION
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
        
            MOVEM.L D0-D4,-(A7)
        
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #EXPPCOL,D1
            TRAP    #15
        
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #EXPFCOL,D1
            TRAP    #15
        
            ; DEFINE COORDINATES
            MOVE.W  (A0),D1
            SUB.W   (EXPRAD),D1
            MOVE.W  2(A0),D2
            SUB.W   (EXPRAD),D2
            MOVE.W  D1,D3
            ADD.W   (EXPRAD),D3
            ADD.W   (EXPRAD),D3
            MOVE.W  D2,D4
            ADD.W   (EXPRAD),D4
            ADD.W   (EXPRAD),D4
            
            ; DRAW CIRCLE
            MOVE.B  #88,D0
            TRAP    #15
            
            ; SET FILL COLOR FOR LITTLE EXPLOSION
            MOVE.B  #81,D0
            MOVE.L  #LEXPFCOL,D1
            TRAP    #15
            
            ; DEFINE COORDINATES
            MOVE.W  (A0),D1
            SUB.W   (LEXPRAD),D1
            MOVE.W  2(A0),D2
            SUB.W   (LEXPRAD),D2
            MOVE.W  D1,D3
            ADD.W   (LEXPRAD),D3
            ADD.W   (LEXPRAD),D3
            MOVE.W  D2,D4
            ADD.W   (LEXPRAD),D4
            ADD.W   (LEXPRAD),D4
            
            ; DRAW CIRCLE
            MOVE.B  #88,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS







            

*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
