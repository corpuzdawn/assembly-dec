.model tiny
.stack
.data
.code  

        MOV DL, 01H
        MOV BX,120
    START:
        MOV [BX], DL
        INC DL
        INC BX
        CMP BX, 129
        JLE START
        
        MOV DX, 00H
        MOV BX, 120
    BEGIN:
        ADD DX, [BX]
        INC BX
        CMP BX, 129
        JLE BEGIN 
        
        PUSH DX 
        CALL ADDITION1
        POP DX 
       
        
        PUSH DX
        CALL ADDITION2
        POP DX  
        MOV AH,4CH
        INT 21H            
 
    
    ADDITION1 proc
        MOV DH,0
      number1:
        SUB DL,010
        INC DH
        CMP DL,009
        JLE print1
        JMP number1
      print1:
        MOV DL, DH
        ADD DL, 048
        MOV AH, 2
        int 21h       
        ret
    ADDITION1 endp 
    
    ADDITION2 proc
      number2:
        SUB DL,010
        CMP DL,009
        JLE print2
        JMP number2
      print2:
        ADD DL, 048
        MOV AH, 2
        int 21h       
        ret        
    ADDITION2 endp 
    

    
end
