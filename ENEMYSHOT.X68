; ==============================================================================
; ENEMY SHOT MANAGEMENT (AGENT)
; ESHPOSX (W)  (A0)
; ESHPOSY (W) 2(A0)
; ==============================================================================
    
; ------------------------------------------------------------------------------
ESHINIT
; INITIALIZE ENEMY SHOT
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
ESHUPD
; UPDATES THE ENEMY SHOT
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            
            MOVEM.W D0-D2,-(A7)
        
            ; UPDATE SHOT COORDINATES
            MOVE.W  (A0),D0
            MOVE.W  2(A0),D1
            ADD.W   #SHTSPEED,D1
        
            ; CHECK VERTICAL COLLISIONS
            CMP.W   #SCRHEIGH-SHTHEIGH,D1
            BGT     .COLBOT
            BRA     .CHKSHP
            
.COLBOT     JSR     AGLKILL
            BRA     .DONE
            
            ; CHECK SHIP COLLISIONS
.CHKSHP     MOVE.W  #SHPPOSY,D2
            SUB.W   D1,D2
            BPL     .ISPOS
            NEG.W   D2
.ISPOS      CMP.W   #SHPHEIGH/2-SHTHEIGH,D2
            BGT     .DONE
            MOVE.W  (SHPPOSX),D2
            SUB.W   D0,D2
            BPL     .ISPOS2
            NEG.W   D2     
.ISPOS2     CMP.W   #SHPWIDTH/2+SHTWIDTH/2,D2
            BGT     .DONE
            JSR     AGLKILL
            ADDQ.W  #1,(SCOHIT)                   
        
            ; STORE POSITION
.DONE       MOVE.W  D0,(A0)
            MOVE.W  D1,2(A0)

            MOVEM.W (A7)+,D0-D2
            
            RTS
        
; ------------------------------------------------------------------------------
ESHPLOT
; PLOT THE ENEMY SHOT
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
