; ==============================================================================
; GAME STATE MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
STAINIT
; INITIALIZE STATE MANAGER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVE.W  #STANONE,(STACUR)
            CLR.W   (STANEXT)
            RTS
        
; ------------------------------------------------------------------------------
STAUPD
; PERFORMS STATE UPDATE AND INIT IF NECESSARY
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0/A0,-(A7)
            CLR.L   D0
            MOVE.W  (STANEXT),D0
            CMP.W   (STACUR),D0
            BEQ     .DOUPD
            MOVE.W  D0,(STACUR)             ; IF STATE CHANGED, DO INIT
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .INITBL(A0),A0
            JSR     (A0)
.DOUPD      CLR.L   D0                      ; IN ANY CASE, DO UPDATE
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .UPDTBL(A0),A0
            JSR     (A0)
            MOVEM.L (A7)+,D0/A0
            RTS
.INITBL     DC.L    ISCINIT,INSINIT,GAMINIT,WININIT,GOV1INIT,GOV2INIT,STAATRI
.UPDTBL     DC.L    ISCUPD,INSUPD,GAMUPD,WINUPD,GOV1UPD,GOV2UPD,STAATRU
        
; ------------------------------------------------------------------------------
STAPLOT
; PERFORMS STATE PLOT
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------        
            MOVEM.L D0/A0,-(A7)
            CLR.L   D0
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .PLTTBL(A0),A0
            JSR     (A0)
            MOVEM.L (A7)+,D0/A0
            RTS
.PLTTBL     DC.L    ISCPLOT,INSPLOT,GAMPLOT,WINPLOT,GOV1PLOT,GOV2PLOT,STAATRP

; ------------------------------------------------------------------------------
STAEMPTY
; EMPTY SUBROUTINE FOR CASES WITH NOTHING TO DO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------ 
            RTS
            
; -----------------------------------------------------------------------------
STAATRI
; ATTRACT MODE INIT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            JSR     DMMINIT
            IFEQ    ATRSAVE
            JSR     ATRINIT                 ; ONLY IN ATTRACT PLAY MODE
            ENDC
            JSR     SHPINIT
            BRA     SCOINIT
            RTS

; -----------------------------------------------------------------------------
STAATRU
; ATTRACT MODE UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            BTST    #4,(KBDEDGE)            ; CHECK USER INITIATED EXIT
            BNE     .EXIT
            IFEQ    ATRSAVE
            JSR     ATRUPD                  ; ONLY IN ATTRACT PLAY MODE
            ENDC
            BTST    #4,(KBDEDGE)            ; CHECK END OF RECORD
            BNE     .EXIT
            JSR     AGLUPD
            JSR     SPWAUPD
            JSR     SHPUPD
            BRA     .END
.EXIT       MOVE.W  #STAISC,(STANEXT)
.END        RTS

; -----------------------------------------------------------------------------
STAATRP
; ATTRACT MODE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            BRA     GAMPLOT                 ; PLOT GAME









*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
