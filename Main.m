%exe1
filename=input('Escolha o nome do ficheiro a ler: ','s');
[filepath,name,ext] = fileparts(filename);
disp(filename);
if ext== '.wav'
    [fonteInf,fs]=audioread(filename);
    info=audioinfo(filename);
    song = audioplayer(fonteInf,fs);
    play(song);
    histogram(fonteInf);
    disp(info);
    %entropia(alfabeto);
elseif ext == '.bmp'
    fonteInf = imread(filename);
    imgInfo= imfinfo(filename);
    disp(imgInfo);
    histogram(fonteInf);
    %entropia(alfabeto);
end