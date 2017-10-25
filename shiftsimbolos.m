function [ fonteInf,Alf ] = shiftsimbolos(fonte,sllbits )
    N = numel(fonte);
    if(mod(N,2)==1)
        N=N-1;
    end
    count=1;
    fonteInf=zeros(1,N/2);
    for k = 1:2:N-1
        shiftleft=bitsll(fonte(k),sllbits);
        simbolo=shiftleft+fonte(k+1);
        fonteInf(count)=simbolo;
        count=count+1;
    end
    Alf=unique(fonteInf);
end

