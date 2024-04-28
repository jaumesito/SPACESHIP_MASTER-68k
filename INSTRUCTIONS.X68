; ==============================================================================
; INSTRUCTIONS SCREEN MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
INSINIT
; INITIALIZE INSTRUCTIONS SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            JSR     DMMINIT
            CLR.W   (INSTIMER)
            RTS
        
; ------------------------------------------------------------------------------
INSUPD
; UPDATES THE INSTRUCTIONS SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            BTST.B #4,(KBDEDGE)
            BEQ     .CONT
            CLR.W   (STANEXT)
.CONT       ADDQ.W  #1,(INSTIMER)
            CMP.W   #INSMAXTM,(INSTIMER)
            BLT     .DONE
            MOVE.W  #STAATR,(STANEXT)                   
.DONE       RTS
        
; ------------------------------------------------------------------------------
INSPLOT
; PLOTS THE INSTRUCTIONS SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------        

            MOVEM.L D0-D1/A0-A1,-(A7)
            CLR.B   D1
            MOVE.B  #81,D0
            TRAP    #15
            MOVE.B  #13,D0
            LEA     .TXTLST,A1
.LOOP       MOVE.L  (A1)+,D1
            BEQ     .DONE
            MOVE.L  D1,A0
            JSR     UTLPRINT
            BRA     .LOOP
.DONE       MOVEM.L (A7)+,D0-D1/A0-A1            

            RTS
.TXT1       DC.B    'DO YOU WANNA BE THE SPACE SHIPS MASTER?',0
.TXT2       DC.B    'MOVE THE SHIP USING LEFT AND RIGHT KEYS',0
.TXT3       DC.B    'SHOOT USING YOUR SPACE BAR',0
.TXT4       DC.B    'DO NOT MISS YOUR SHOTS AND DO NOT GET HIT!!',0
.TXT5       DC.B    'WAIT TO SEE A GAME EXAMPLE',0
            DS.W    0
.TXTLST     DC.L    .TXT1,.TXT2,.TXT3,.TXT4,.TXT5,0










            


*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
