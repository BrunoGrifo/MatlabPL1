function [info] = informacaoMutua(query,alfabeto,target,step)
    %Tamanho da query

    querySize = numel(query);
    %Tamanho do target
    targetSize = numel(target);
    Hq = entropia(query, alfabeto);
    N = targetSize - querySize + step;
    fonteInf=zeros(1,querySize);
    info = zeros(1,N);  
    for j = 0:step:N-1
        count = 1;
        for k = 1:1:querySize
            shiftleft=bitsll(query(k),4);
            simbolo=shiftleft+target(k+j);
            fonteInf(count)=simbolo;
            count = count + 1;
        end
        Ht = entropia(target(j+1:j+querySize),alfabeto);
        Alf=unique(fonteInf);
        Ha = entropia(fonteInf,Alf); %entropia H(X,Y)
        info(j+1) = Hq+Ht-(Ha);
    end

end

