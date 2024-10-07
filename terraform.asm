.ORIG x3000

TRAP x29           
ADD R4, R1, #-1     

ADD R0, R0, #-1    
ADD R2, R2, #-1    
JSR CHECK_DIRECTION
TRAP x29           

ADD R2, R2, #-1    
JSR CHECK_DIRECTION
TRAP x29 

ADD R0, R0, #1     
ADD R2, R2, #-1    
JSR CHECK_DIRECTION
TRAP x29 

ADD R0, R0, #-1    
JSR CHECK_DIRECTION
TRAP x29 

ADD R0, R0, #1     
JSR CHECK_DIRECTION
TRAP x29 

ADD R0, R0, #-1    
ADD R2, R2, #1     
JSR CHECK_DIRECTION
TRAP x29 

ADD R2, R2, #1     
JSR CHECK_DIRECTION
TRAP x29 

ADD R0, R0, #1     
ADD R2, R2, #1     
JSR CHECK_DIRECTION
TRAP x29 

HALT

CHECK_DIRECTION
    TRAP x2B           
    ADD R3, R3, #0     
    BRz GO_DOWN  

    LD R3, BLOCK_OF_AIR   
    TRAP x2C           
BREAK_ABOVE
    ADD R1, R1, #1     
    TRAP x2B           
    ADD R3, R3, #0     
    BRz END_CHECK      
    LD R3, BLOCK_OF_AIR   
    TRAP x2C           
    BRnzp BREAK_ABOVE  

    BRnzp END_CHECK    

GO_DOWN
    ADD R1, R1, #-1    
    TRAP x2B           
    ADD R3, R3, #0     
    BRz GO_DOWN  

SPAWN_COBBLE
    NOT R5, R4         
    ADD R5, R5, #1     
    ADD R5, R1, R5     
    BRz END_FILL       

    ADD R1, R1, #1     
    TRAP x2B           
    ADD R3, R3, #0     
    BRz OPERATION    

    BRnzp END_FILL     

OPERATION
    LD R3, COBBLESTONE_BLOCK
    TRAP x2C           
    BRnzp SPAWN_COBBLE 

END_FILL
    RET
END_CHECK
    RET

BLOCK_OF_AIR .FILL #0       
COBBLESTONE_BLOCK .FILL #4    

.END
