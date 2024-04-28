; ==============================================================================
; GAME VARIABLES
; ==============================================================================
    
; --- SHIP RELATED VARIABLES ---------------------------------------------------

SHPPOSX     DS.W    1                   ; SHIP X COORDINATE

; --- EXPLOSION RELATED VARIABLES ----------------------------------------------

EXPRAD      DS.W    1                   ; EXPLOSION RADIUS
LEXPRAD     DS.W    1                   ; LITTLE EXPLOSION RADIUS

; --- SCOREBOARD RELATED VARIABLES ---------------------------------------------

SCODST      DS.W    1                   ; NUMBER OF SHIPS DESTROYED
SCOHIT      DS.W    1                   ; NUMBER OF TIMES YOU GET HIT
SCOENE      DS.W    1                   ; NUMBER OF TIMES AN ENEMY CROSSES
                                        ; THE LINE
                                        
; --- INTRO STATE RELATED VARIABLES --------------------------------------------

ISCTIMER    DS.W    1                   ; INTRO TIMER

; --- ATTRACT MODE RELATED VARIABLES -------------------------------------------

ATRPTR      DS.L    1                   ; POINTER TO CURRENT KEYSTROKE
ATRCTR      DS.W    1                   ; ATTRACT MODE COUNTER

; --- INSTRUCTIONS STATE RELATED VARIABLES -------------------------------------

INSTIMER    DS.W    1                   ; INSTRUCTIONS TIMER

; --- STATE RELATED VARIABLES --------------------------------------------------

STACUR      DS.W    1                   ; CURRENT STATE
STANEXT     DS.W    1                   ; NEXT STATE















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
