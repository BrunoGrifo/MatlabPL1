function [ H ] = entropia2a2(fonte,sllbits)
    
    
    [fonteInf,Alf]=shiftsimbolos(fonte,sllbits);
    [H,Z,bincounts]=entropia(fonteInf,Alf);   

end

