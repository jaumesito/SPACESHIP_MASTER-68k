; ==============================================================================
; SHIP MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
SHPINIT
; INITIALIZE SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVE.W  #SCRWIDTH/2,(SHPPOSX)
            RTS
        
; ------------------------------------------------------------------------------
SHPUPD
; UPDATES THE SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
        
            MOVE.W  D0,-(A7)
        
            ; UPDATE COORDINATE
            MOVE.W  (SHPPOSX),D0
        
            BTST.B  #0,(KBDVAL)
            BEQ     .CHKRGT
            SUB.W   #SHPSPEED,D0
.CHKRGT     BTST.B  #2,(KBDVAL)
            BEQ     .CONT
            ADD.W   #SHPSPEED,D0
        
            ; CHECK COLLISIONS
.CONT       CMP.W   #SHPWIDTH/2,D0
            BGE     .CONT2
            MOVE.W  #SHPWIDTH/2,D0
            BRA     .DONE
.CONT2      CMP.W   #SCRWIDTH-SHPWIDTH/2,D0
            BLE     .DONE
            MOVE.W  #SCRWIDTH-SHPWIDTH/2,D0

            ; UPDATE VARIABLE
.DONE       MOVE.W  D0,(SHPPOSX)

            BTST.B  #4,(KBDEDGE)        ; TECLA FIRE 1 (SPACE)
            BNE     .FIRE
            BTST.B  #1,(KBDEDGE)        ; TECLA UP (ATTRACT MODE)
            BEQ     .NOFIRE         
.FIRE       MOVEM.L D0-D2/A1-A3,-(A7)
            LEA     SHTINIT,A1
            LEA     SHTUPD,A2
            LEA     SHTPLOT,A3
            MOVE.W  #SHTAGN,D0
            CMP.W   #SCODSTSL,(SCODST)
            BLT     .ONESHT
            ; TWO SHOTS (NEXT LEVEL)
            MOVE.W  (SHPPOSX),D1
            ADD.W   #SHPWIDTH/2,D1
            MOVE.W  #SHPPOSY,D2
            ADD.W   #SHPHEIGH/2,D2
            JSR     AGLADD
            
            SUB.W   #SHPWIDTH,D1
            JSR     AGLADD
            CMP.W   #SCODSTTL,(SCODST)
            BLT     .END
            ; THREE SHOTS (NEXT LEVEL)
            
.ONESHT     MOVE.W  (SHPPOSX),D1
            MOVE.W  #SHPPOSY,D2
            JSR     AGLADD
.END        MOVEM.L (A7)+,D0-D2/A1-A3

.NOFIRE     MOVE.W  (A7)+,D0
            RTS
        
; ------------------------------------------------------------------------------
SHPPLOT
; PLOT THE SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D4,-(A7)
        
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #SHPPCOL,D1
            TRAP    #15
        
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #SHPFCOL,D1
            TRAP    #15

            ; DRAW SPACE SHIP
            MOVE.B  #84,D0
            MOVE.W  (SHPPOSX),D1
            MOVE.W  #SHPPOSY,D2
            MOVE.W  D1,D3
            ADD.W   #SHPWIDTH/2,D3
            MOVE.W  #SHPPOSY+SHPHEIGH,D4
            TRAP    #15
        
            MOVE.B  #85,D0
            MOVE.W  D3,D1
            MOVE.W  D4,D2
            SUB.W   #SHPHEIGH/2,D2
            TRAP    #15
            
            ADD.W   #SHPHEIGH/2,D2
            TRAP    #15
            
            SUB.W   #SHPWIDTH/2,D1
            SUB.W   #SHPHEIGH/4,D2
            TRAP    #15
            
            SUB.W   #SHPWIDTH/2,D1
            ADD.W   #SHPHEIGH/5,D2
            TRAP    #15
            
            SUB.W   #SHPHEIGH/2,D2
            TRAP    #15
            
            ADD.W   #SHPHEIGH/2,D2
            TRAP    #15
        
            MOVE.W  (SHPPOSX),D1
            MOVE.W  #SHPPOSY,D2
            TRAP    #15
            
            SUB.W   #4,D2
            TRAP    #15
        
            ; FILL SPACE SHIP
            MOVE.B  #89,D0
            ADD.W   #5,D2
            TRAP    #15
        
        
            MOVEM.L (A7)+,D0-D4
        
            RTS




















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
