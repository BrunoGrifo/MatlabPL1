%exe1,2,3
filename=input('Escolha o nome do ficheiro a ler: ','s');
[filepath,name,ext] = fileparts(filename);
disp(filename);
if ext== '.wav'
    [fonteInf,fs]=audioread(filename);
    info=audioinfo(filename);
    song = audioplayer(fonteInf,fs);
    play(song);
    d=(1-(-1))/2^info.BitsPerSample;
    alfabeto=-1:d:1-d;
    histogram(fonteInf,alfabeto);
    disp(info);
    %entropia(alfabeto);
elseif ext == '.bmp'
    fonteInf = imread(filename);
    imgInfo= imfinfo(filename);
    alfabeto= 0:((2^imgInfo.BitDepth)-1);
    disp(imgInfo);
    histogram(fonteInf,alfabeto);
    xlim([0 (2^imgInfo.BitDepth)-1]);
    entropia(alfabeto);
elseif ext == '.txt'
    fileID = fopen(filename);
    T = fscanf(fileID,'%s');
    fonteInf = double(T);
    alfabeto = [double('A'):double('Z'),double('a'):double('z')];
    disp(imgInfo);
    histogram(fonteInf,alfabeto);
    entropia(fonteInf,alfabeto);
    fclose(fileID);
end