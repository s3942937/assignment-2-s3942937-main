.ORIG x3000

    TRAP x29            

    ST  R0, PLAYERS_X_COORDINATE
    ST  R1, PLAYERS_Y_COORDINATE
    ST  R2, PLAYERS_Z_COORDINATE

    LD  R1, PLAYERS_X_COORDINATE
    LD  R2, A_X

    ADD R3, R1, R2      

    NOT R2, R2          
    ADD R2, R2, #1      
    ADD R3, R1, R2      

    JSR ABS_VALUE       
    ST  R3, DISTANCE_A      

    LD  R1, PLAYERS_Y_COORDINATE    
    LD  R2, A_Y         

    NOT R2, R2
    ADD R2, R2, #1      

    ADD R3, R1, R2      
    JSR ABS_VALUE       

    LD  R4, DISTANCE_A
    ADD R4, R4, R3      
    ST  R4, DISTANCE_A

    LD  R1, PLAYERS_Z_COORDINATE    
    LD  R2, A_Z         

    NOT R2, R2
    ADD R2, R2, #1      

    ADD R3, R1, R2      
    JSR ABS_VALUE       

    LD  R4, DISTANCE_A
    ADD R4, R4, R3      
    ST  R4, DISTANCE_A

    LD  R1, PLAYERS_X_COORDINATE    
    LD  R2, B_X         
    NOT R2, R2
    ADD R2, R2, #1      
    ADD R3, R1, R2      
    JSR ABS_VALUE       
    ST  R3, DISTANCE_B      

    LD  R1, PLAYERS_Y_COORDINATE    
    LD  R2, B_Y         
    NOT R2, R2
    ADD R2, R2, #1      
    ADD R3, R1, R2      
    JSR ABS_VALUE       
    LD  R4, DISTANCE_B
    ADD R4, R4, R3      
    ST  R4, DISTANCE_B

    LD  R1, PLAYERS_Z_COORDINATE    
    LD  R2, B_Z         
    NOT R2, R2
    ADD R2, R2, #1      
    ADD R3, R1, R2      
    JSR ABS_VALUE       
    LD  R4, DISTANCE_B
    ADD R4, R4, R3      
    ST  R4, DISTANCE_B

    LD  R3, DISTANCE_A

    LD  R4, DISTANCE_B

    ADD R5, R3, #0      
    NOT R4, R4
    ADD R4, R4, #1      
    ADD R5, R5, R4      

    BRn PLAYER_CLOSER_A 
    BRp PLAYER_CLOSER_B 
    BR  PLAYER_EQUIDISTANT   

PLAYER_CLOSER_A
        LEA R0, MESSAGE_A
        TRAP x28           
        BR   PROGRAM_END

PLAYER_CLOSER_B
        LEA R0, MESSAGE_B
        TRAP x28            
        BR   PROGRAM_END

PLAYER_EQUIDISTANT
        LEA R0, MESSAGE_EQUAL
        TRAP x28           

PROGRAM_END
        HALT


ABS_VALUE
        BRzp ABS_END        

        NOT R3, R3
        ADD R3, R3, #1      

ABS_END
        RET

A_X .FILL #1
A_Y .FILL #2
A_Z .FILL #3
B_X .FILL #20
B_Y .FILL #32
B_Z .FILL #-8

PLAYERS_X_COORDINATE    .BLKW 1    
PLAYERS_Y_COORDINATE    .BLKW 1    
PLAYERS_Z_COORDINATE    .BLKW 1    

DISTANCE_A      .BLKW 1    
DISTANCE_B      .BLKW 1    

MESSAGE_A       .STRINGZ "The player is closer to point A"
MESSAGE_B       .STRINGZ "The player is closer to point B"
MESSAGE_EQUAL      .STRINGZ "The player is equidistant from both points"

.END
