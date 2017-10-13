function [H, bincounts] = entropia(P,A)

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
    disp(H);
end