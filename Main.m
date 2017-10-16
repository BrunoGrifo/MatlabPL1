%exe1,2,3
filename=input('Escolha o nome do ficheiro a ler: ','s');
[filepath,name,ext] = fileparts(filename);
disp(filename);
if ext== '.wav'
    [fonteInf,fs]=audioread(filename);
    info=audioinfo(filename);
    song = audioplayer(fonteInf,fs);
    %play(song);
    d=(1-(-1))/2^info.BitsPerSample;
    alfabeto=-1:d:1-d;
    histogram(fonteInf,alfabeto);
    disp(info);
    [H,Z,bincounts]=entropia(fonteInf,alfabeto);
    fprintf('Entropia de %s: %.4f\n',filename,H);
    

    pause(2);
    
    Lmed=exe4(bincounts,Z);
    fprintf('Comprimento medio de bits por simbolo: %.4f\n',Lmed);
    
    %entropia2a2Musica();

    
elseif ext == '.bmp'
    fonteInf = imread(filename);
    imgInfo= imfinfo(filename);
    alfabeto= 0:((2^imgInfo.BitDepth)-1);
    disp(imgInfo);
    histogram(fonteInf,alfabeto);
    xlim([0 (2^imgInfo.BitDepth)-1]);
    [H,Z,bincounts]=entropia(fonteInf,alfabeto);
    fprintf('Entropia de %s: %.4f\n',filename,H);
    
    pause(2);
    
    Lmed=exe4(bincounts,Z);
    fprintf('Comprimento medio de bits por simbolo: %.4f\n',Lmed);
    
    [Entropia2a2]=entropia2a2(fonteInf,imgInfo.BitDepth);
    fprintf('Entropia 2 a 2: %.4f\n',Entropia2a2);
    
    
elseif ext == '.txt'
    fileID = fopen(filename);
    T = fscanf(fileID,'%s');
    fonteInf = double(T);
    alfabeto = [double('A'):double('Z'),double('a'):double('z')];
    disp(imgInfo);
    histogram(fonteInf,alfabeto);
    [H,Z,bincounts]=entropia(fonteInf,alfabeto);
    fclose(fileID);
    fprintf('Entropia de %s: %.4f\n',filename,H);
    

    pause(2);
    
    Lmed=exe4(bincounts,Z);
    fprintf('Comprimento medio de bits por simbolo: %.4f\n',Lmed);
    
    
    
end



