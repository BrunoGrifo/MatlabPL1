function [Lmed]=exe4( bincounts,probabilidades )

    Hlen = hufflen(bincounts);
    lipi=Hlen.*probabilidades;
    Lmed=sum(lipi);

end

