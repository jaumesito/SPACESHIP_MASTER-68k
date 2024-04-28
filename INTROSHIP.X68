; ==============================================================================
; INTRO SHIP MANAGEMENT
; ==============================================================================
    
; ------------------------------------------------------------------------------
ISHINIT
; INITIALIZE INTRO SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            RTS
        
; ------------------------------------------------------------------------------
ISHUPD
; UPDATES THE INTRO SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------
            
            RTS
        
; ------------------------------------------------------------------------------
ISHPLOT
; PLOTS THE INTRO SHIP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ------------------------------------------------------------------------------        

            MOVEM.L D0-D4,-(A7)
        
            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #ISHPCOL,D1
            TRAP    #15
        
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #ISHFCOL,D1
            TRAP    #15

            ; DRAW SPACE SHIP
            MOVE.B  #84,D0
            MOVE.W  #ISHPOSX,D1
            MOVE.W  #ISHPOSY,D2
            MOVE.W  #ISHPOSX+ISHWIDTH/2,D3
            MOVE.W  #ISHPOSY+ISHHEIGH,D4
            TRAP    #15
        
            MOVE.B  #85,D0
            MOVE.W  D3,D1
            MOVE.W  D4,D2
            SUB.W   #ISHHEIGH/2,D2
            TRAP    #15
            
            ADD.W   #ISHHEIGH/2,D2
            TRAP    #15
            
            SUB.W   #ISHWIDTH/2,D1
            SUB.W   #ISHHEIGH/4,D2
            TRAP    #15
            
            SUB.W   #ISHWIDTH/2,D1
            ADD.W   #ISHHEIGH/5,D2
            TRAP    #15
            
            SUB.W   #ISHHEIGH/2,D2
            TRAP    #15
            
            ADD.W   #ISHHEIGH/2,D2
            TRAP    #15
        
            MOVE.W  #ISHPOSX,D1
            MOVE.W  #ISHPOSY,D2
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
