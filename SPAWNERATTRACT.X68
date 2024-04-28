; ==============================================================================
; ATTRACT MODE SPAWNER MANAGEMENT
; ==============================================================================
        
; ------------------------------------------------------------------------------
SPWAUPD
; UPDATES THE SPAWNER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------                       
            
            MOVEM.L D0/A1-A3,-(A7)
            ; THE LONGER THE GAME, THE HARDER IT GETS
            ; ENEMY AGENT CREATOR
            MOVE.B  (SCRCYCCT),D0
            CMP.W   #SCODSTSL,(SCODST)
            BLT     .FLEVEL
            CMP.W   #SCODSTTL,(SCODST)
            BLT     .SLEVEL
            ; THIRD LEVEL
            AND.B   #SPWMSKTL,D0
            BNE     .END
            BRA     .AGNT
            
            ; SECOND LEVEL
.SLEVEL     AND.B   #SPWMSKSL,D0
            BNE     .END
            BRA     .AGNT
            
            ; FIRST LEVEL
.FLEVEL     AND.B   #SPWMSKFL,D0
            BNE     .END
.AGNT       LEA     ENEAINIT,A1
            LEA     ENEAUPD,A2
            LEA     ENEAPLOT,A3
            MOVE.W  #ENEAGN,D0
            JSR     AGLADD
            
.END        MOVEM.L (A7)+,D0/A1-A3           
            RTS
        

       














            
*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
