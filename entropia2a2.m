function [ H ] = entropia2a2(fonte,sllbits,filename)
    
    
    [fonteInf,Alf]=shiftsimbolos(fonte,sllbits);
    histogram(fonteInf,Alf);
    ylabel('Numero de Ocorr�ncias');
    xlabel('Alfabeto');
    title(filename);
    [H,Z,bincounts]=entropia(fonteInf,Alf); 
    H=H/2;

end

