function [info] = informacaoMutua(query,alfabeto,target,step, bitspersample)
    %Tamanho da query
    querySize = numel(query);
    %Tamanho do target
    targetSize = numel(target);
    Hq = entropia(query, alfabeto);
    N = round((targetSize - querySize+1) / step);
    fonteInf=zeros(1,querySize);
    info = zeros(1,N);
    count2 = 0;
    for j = 0:step:(N*step)-1
        count = 1;
        for k = 1:1:querySize
            shiftleft=bitsll(query(k),bitspersample);
            simbolo=shiftleft+target(k+j);
            fonteInf(count)=simbolo;
            count = count + 1;
        end
        Ht = entropia(target(j+1:j+querySize),alfabeto);
        Alf=unique(fonteInf);
        Ha = entropia(fonteInf,Alf); %entropia H(X,Y)
        info(count2+1) = Hq+Ht-(Ha);
        count2 = count2+1;
    end
end

