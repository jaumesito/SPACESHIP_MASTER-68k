; ==============================================================================
; GAME CONSTANTS
; ==============================================================================
    
; --- SHIP RELATED CONSTANTS ---------------------------------------------------

SHPWIDTH    EQU     100                 ; SHIP WIDTH 
SHPHEIGH    EQU     20                  ; SHIP HEIGHT 
SHPPOSY     EQU     430                 ; SHIP Y COORDINATE
SHPPCOL     EQU     $00D3D3D3           ; SHIP CONTOUR COLOR
SHPFCOL     EQU     $00D3D3D3           ; SHIP FILL COLOR
SHPSPEED    EQU     10                  ; MAGNITUDE OF THE X DISPLACEMENT

; --- INTRO SHIP RELATED CONSTANTS ---------------------------------------------

ISHWIDTH    EQU     300                 ; INTRO SHIP WIDTH
ISHHEIGH    EQU     60                  ; INTRO SHIP HEIGHT
ISHPOSX     EQU     320                 ; INTRO SHIP X COORDINATE
ISHPOSY     EQU     250                 ; INTRO SHIP Y COORDINATE
ISHPCOL     EQU     $00D3D3D3           ; INTRO SHIP CONTOUR COLOR
ISHFCOL     EQU     $00D3D3D3           ; INTRO SHIP FILL COLOR

; --- SHOT RELATED CONSTANTS ---------------------------------------------------

SHTWIDTH    EQU     1                   ; SHOT WIDTH
SHTHEIGH    EQU     7                   ; SHOT HEIGHT
SHTSPEED    EQU     3                   ; MAGNITUDE OF THE Y DISPLACEMENT
SHTPCOL     EQU     $0000FFFF           ; SHOT CONTOUR COLOR
SHTFCOL     EQU     $0000FFFF           ; SHOT FILL COLOR

; --- EXPLOSION RELATED CONSTANTS ----------------------------------------------

EXPMXRAD    EQU     15                  ; EXPLOSION MAXIMUM RADIUS
EXPPCOL     EQU     $000011FF           ; EXPLOSION CONTOUR COLOR
EXPFCOL     EQU     $000011FF           ; EXPLOSION FILL COLOR
LEXPFCOL    EQU     $000066FF           ; LITTLE EXPLOSION FILL COLOR

; --- LIMIT LINE RELATED CONSTANTS ---------------------------------------------

LIMWIDTH    EQU     640                 ; LIMIT LINE WIDTH
LIMHEIGH    EQU     1                   ; LIMIT LINE HEIGHT
LIMPOSX     EQU     0                   ; LIMIT LINE X COORDINATE
LIMPOSY     EQU     400                 ; LIMIT LINE Y COORDINATE
LIMPCOL     EQU     $000000FF           ; LIMIT LINE CONTOUR COLOR

; --- ATTRACT MODE RELATED CONSTANTS -------------------------------------------

ATRSAVE     EQU     0                   ; SET TO 1 TO RECORD GAME

; --- AGENTS RELATED CONSTANTS -------------------------------------------------

SHTAGN      EQU     1                   ; SHOT AGENT NUMBER
ESHAGN      EQU     2                   ; ENEMY SHOT AGENT NUMBER
ENEAGN      EQU     3                   ; ENEMY SHIP AGENT NUMBER
EXPAGN      EQU     4                   ; EXPLOSION AGENT NUMBER

; --- ENEMIES RELATED CONSTANTS ------------------------------------------------

ENEWIDTH    EQU     50                  ; ENEMY WIDTH
ENEHEIGH    EQU     10                  ; ENEMY HEIGHT
ENEHSPD     EQU     3                   ; FIRST ROW ENEMY SPEED
ENEDSPD     EQU     1                   ; ENEMIES DOWN SPEED
ENEPCOL     EQU     $00EEEEEE           ; ENEMY CONTOUR COLOR
ENEFCOL     EQU     $00EEEEEE           ; ENEMY FILL COLOR

; --- SCENARY RELATED CONSTANTS ------------------------------------------------

SCEPCOL     EQU     $00888888           ; SCENARY STARS CONTOUR COLOR
SCENMB      EQU     50                  ; SCENARY NUMBER OF STARS

; --- SCOREBOARD RELATED CONSTANTS ---------------------------------------------

SCOFCOL     EQU     $00000000           ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101               ; FIRST TEXT LINE COORDINATES
SCOLINE2    EQU     $0102               ; SECOND TEXT LINE COORDINATES

; --- SPAWNER RELATED CONSTANTS ------------------------------------------------

SPWMSKFL    EQU     %01111111           ; SPAWNER MASK FOR FIRST LEVEL
SPWMSKSL    EQU     %00111111           ; SPAWNER MASK FOR SECOND LEVEL
SPWMSKTL    EQU     %00011111           ; SPAWNER MASK FOR THIRD LEVEL

; --- STATE RELATED CONSTANTS --------------------------------------------------

STANONE     EQU     -1                  ; NON-EXISTENT STATE NUMBER
STAISC      EQU     0                   ; INTRO SCREEN STATE NUMBER
STAINS      EQU     1                   ; INSTRUCTIONS SCREEN STATE NUMBER
STAGAM      EQU     2                   ; GAME SCREEN STATE NUMBER
STAWIN      EQU     3                   ; WIN SCREEN STATE NUMBER
STAGOV1     EQU     4                   ; GAME OVER 1 SCREEN STATE NUMBER
STAGOV2     EQU     5                   ; GAME OVER 2 SCREEN STATE NUMBER
STAATR      EQU     6                   ; ATTRACT MODE STATE NUMBER
ISCMAXTM    EQU     500                 ; INTRO SCREEN WAITING CYCLES
INSMAXTM    EQU     400                 ; INSTRUCTIONS SCREEN WAITING CYCLES

; --- VICTORY/DEFEAT RELATED CONSTANTS -----------------------------------------

SCODSTSL    EQU     10                  ; NUMBER OF SHIPS DESTROYED TO SECOND LEVEL
SCODSTTL    EQU     20                  ; NUMBER OF SHIPS DESTROYED TO THIRD LEVEL
SCODSTMX    EQU     30                  ; NUMBER OF SHIPS DESTROYED TO VICTORY
SCOHITMX    EQU     10                  ; NUMBER OF TIMES YOU CAN BE HIT
SCOENEMX    EQU     1                   ; NUMBER OF ENEMIES THAT CAN CROSS L.LINE





*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
