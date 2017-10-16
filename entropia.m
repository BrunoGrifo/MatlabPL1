function [H,Z, bincounts] = entropia(P,A)

    P = reshape(P,1,[]);
    N = numel(A);
    bincounts = histc(P,A);
    NF = sum(bincounts);
    Z = bincounts./NF;
    H=0;
    for k = 1:N
        if (Z(k)~=0)
            H = H + (Z(k)*log2(Z(k)));
        end
    end
    H = - H;
end