function [ H ] = entropia2a2(fonte,sllbits)
    
    
    [fonteInf,Alf]=shiftsimbolos(fonte,sllbits);
    %histogram(fonteInf,Alf);
    [H,Z,bincounts]=entropia(fonteInf,Alf); 
    H=H/2;

end

