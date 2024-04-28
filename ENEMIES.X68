; ==============================================================================
; ENEMY MANAGEMENT (AGENT)
; ENEPOSX (W)  (A0)
; ENEPOSY (W) 2(A0)
; ENEVELX (W) 4(A0)
; ENEVELY (W) 6(A0)
; ==============================================================================
    
; ------------------------------------------------------------------------------
ENEINIT
; INITIALIZE SHOT
; INPUT     : A0 POINTER TO THE LOCAL MEMORY
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0/A1,-(A7)
            MOVE.W  #SCRWIDTH/2,(A0)
            MOVE.W  #ENEHEIGH,2(A0)
            JSR     UTLRAND                 ; HACE ALEATORIO EL SENTIDO
            AND.L   #$00000004,D0           ; EN EL QUE EMPIEZA
            LEA     .VELVEC,A1
            MOVE.W  (A1,D0),4(A0)
            MOVE.W  #ENEDSPD,6(A0)
            MOVEM.L (A7)+,D0/A1
            RTS
            
.VELVEC     DC.W    ENEHSPD,0               ;0
            DC.W    -ENEHSPD,0              ;4
        
; ------------------------------------------------------------------------------
ENEUPD
; UPDATES THE ENEMY
; INPUT     : A0 POINTER TO THE LOCAL MEMORY
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            
            MOVEM.W D0-D1,-(A7)
        
            ; UPDATE ENEMY COORDINATES
            MOVE.W  (A0),D0
            MOVE.W  2(A0),D1
            ADD.W   4(A0),D0
            ADD.W   6(A0),D1
            
            ; CHECK HORIZONTAL COLLISIONS
            CMP.W   #SCRWIDTH-ENEWIDTH/2,D0
            BGT     .COLRGT
            CMP.W   #ENEWIDTH/2,D0
            BLT     .COLLFT
            
            ; CHECK VERTICAL COLLISIONS (LIMIT LINE)
            CMP.W   #LIMPOSY-ENEHEIGH/2,D1
            BLT     .DONE
            MOVE.L  #0,4(A0)
            ADDQ.W  #1,(SCOENE)
            BRA     .DONE
            
            ; RIGHT SIDE COLLISIONS
.COLRGT     NEG.W   4(A0)
            MOVE.W  #SCRWIDTH-ENEWIDTH/2,D0
            BRA     .DONE

            ; LEFT SIDE COLLISIONS
.COLLFT     NEG.W   4(A0)
            MOVE.W  #ENEWIDTH/2,D0
            BRA     .DONE

            ; STORE POSITION
.DONE       MOVE.W  D0,(A0)
            MOVE.W  D1,2(A0)
            
            MOVE.B  (SCRCYCCT),D0
            AND.B   #%00011111,D0
            BNE     .NOFIRE
            
            MOVEM.L A1-A3/D0-D2,-(A7)
            LEA     ESHINIT,A1
            LEA     ESHUPD,A2
            LEA     ESHPLOT,A3
            MOVE.W  #ESHAGN,D0
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            JSR     AGLADD
            MOVEM.L (A7)+,A1-A3/D0-D2
.NOFIRE
            MOVEM.W (A7)+,D0-D1            
            
            RTS
        
; ------------------------------------------------------------------------------
ENEPLOT
; PLOT THE ENEMY
; INPUT     : A0 POINTER TO THE LOCAL MEMORY
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)
            
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #ENEPCOL,D1
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #ENEFCOL,D1
            TRAP    #15

            ; DRAW SPACE SHIP
            MOVE.B  #84,D0
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            MOVE.W  D1,D3
            ADD.W   #ENEWIDTH/2,D3
            MOVE.W  2(A0),D4
            SUB.W   #ENEHEIGH,D4
            TRAP    #15
        
            MOVE.B  #85,D0
            MOVE.W  D3,D1
            MOVE.W  D4,D2
            ADD.W   #ENEHEIGH/2,D2
            TRAP    #15
            
            SUB.W   #ENEHEIGH/2,D2
            TRAP    #15
            
            SUB.W   #ENEWIDTH/2,D1
            ADD.W   #ENEHEIGH/4,D2
            TRAP    #15
            
            SUB.W   #ENEWIDTH/2,D1
            SUB.W   #ENEHEIGH/5,D2
            TRAP    #15
            
            ADD.W   #ENEHEIGH/2,D2
            TRAP    #15
            
            SUB.W   #ENEHEIGH/2,D2
            TRAP    #15
        
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            TRAP    #15
            
            ADD.W   #4,D2
            TRAP    #15

            ; FILL SPACE SHIP
            MOVE.B  #89,D0
            SUB.W   #5,D2
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS
            
            
; ------------------------------------------------------------------------------
ENEXPLO
; EXPLODES AN ENEMY
; INPUT     : A0 POINTER TO THE LOCAL MEMORY
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L A1-A3/D0-D2,-(A7)
            LEA     EXPINIT,A1
            LEA     EXPUPD,A2
            LEA     EXPPLOT,A3
            MOVE.W  EXPAGN,D0
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            SUB.W   #ENEHEIGH/2,D2
            JSR     AGLADD
            JSR     AGLKILL
            MOVEM.L (A7)+,A1-A3/D0-D2
            RTS







*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
