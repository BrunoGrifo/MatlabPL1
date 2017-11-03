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
    

%     pause(2);
%     
%     Lmed=exe4(bincounts,Z);
%     fprintf('Comprimento medio de bits por simbolo: %.4f\n',Lmed);
%     
%     [Entropia2a2]=entropia2a2(fonteInf,info.BitsPerSample);
%     fprintf('Entropia 2 a 2: %.4f\n',Entropia2a2);

    
elseif ext == '.bmp'
    fonteInf = imread(filename);
    fonteInf = double(fonteInf);
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
    histogram(fonteInf,alfabeto);
    [H,Z,bincounts]=entropia(fonteInf,alfabeto);
    fclose(fileID);
    fprintf('Entropia de %s: %.4f\n',filename,H);
    

    pause(2);
    
    Lmed=exe4(bincounts,Z);
    fprintf('Comprimento medio de bits por simbolo: %.4f\n',Lmed);
    
    [Entropia2a2]=entropia2a2(fonteInf,8);
    fprintf('Entropia 2 a 2: %.4f\n',Entropia2a2);
    
    
end

%% 6a)
 query = [2 6 4 10 5 9 5 8 0 8];
target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
 alfabeto =(0:10);
 step = 1;

infoMutua=informacaoMutua(query,alfabeto,target,step, 8);
%% 6b)
    [query]=audioread('guitarSolo.wav');
    info=audioinfo('guitarSolo.wav');
    d=(1-(-1))/2^info.BitsPerSample;
    alfabeto=-1:d:1-d;
    [target1]=audioread('target01 - repeat.wav');
    [target2]=audioread('target02 - repeatNoise.wav');
    N = numel(query(:,1));
    step = N*(1/4);
    infoMutua1=informacaoMutua(query(:,1)',alfabeto,target1',step, info.BitsPerSample);
    infoMutua2=informacaoMutua(query(:,1)',alfabeto,target2',step, info.BitsPerSample);
    
    %Gráfico conjunto - Target 1 e 2    
    figure('Name','Informação mútua com a música "guitarSolo.wav"');
    title('ola');
    subplot(2,1,1);
    plot(infoMutua1);
    ylabel('Informação Mútua');
    xlabel('Número de Janelas');
    title('target01 - repeat.wav');
    subplot(2,1,2);
    plot(infoMutua2);
    xlabel('Número de Janelas');
    ylabel('Informação Mútua');
    title('target02 - repeatNoise.wav');
    
    %Gráfico sobreposto - Target 1 e 2
    figure('Name','Comparação de resultados');
    plot(1:length(infoMutua1),infoMutua1,1:length(infoMutua2),infoMutua2);
    legend('Target 1','Target 2')
    xlabel('Número de Janelas')
    ylabel('Informação Mútua')
    
    %ylim([0 4]);
    %var = var(infoMutua);
    m = mean(infoMutua2);%média
    %max();
    %sort(A, 'descend');
    
%% 6c)
    [query]=audioread('guitarSolo.wav');
    info=audioinfo('guitarSolo.wav');
    d=(1-(-1))/2^info.BitsPerSample;
    alfabeto=-1:d:1-d;
    [target1]=audioread('Song01.wav');
    [target2]=audioread('Song02.wav');
    [target3]=audioread('Song03.wav');
    [target4]=audioread('Song04.wav');
    [target5]=audioread('Song05.wav');
    [target6]=audioread('Song06.wav');
    [target7]=audioread('Song07.wav');
    
    N = numel(query(:,1));
    step = N*(1/4);
    infoMutua1=informacaoMutua(query(:,1)',alfabeto,target1',step, info.BitsPerSample);
    infoMutua2=informacaoMutua(query(:,1)',alfabeto,target2',step, info.BitsPerSample);
    infoMutua3=informacaoMutua(query(:,1)',alfabeto,target3',step, info.BitsPerSample);
    infoMutua4=informacaoMutua(query(:,1)',alfabeto,target4',step, info.BitsPerSample);
    infoMutua5=informacaoMutua(query(:,1)',alfabeto,target5',step, info.BitsPerSample);
    infoMutua6=informacaoMutua(query(:,1)',alfabeto,target6',step, info.BitsPerSample);
    infoMutua7=informacaoMutua(query(:,1)',alfabeto,target7',step, info.BitsPerSample);

    %ylim([0 4]);
    %var = var(infoMutua);
    
    %Valores maximos de cada musica com o target guitarSolo.wav
    clear max; %https://stackoverflow.com/questions/16568841/how-to-find-min-and-max-of-float-number-in-matlab
    max1 = max(infoMutua1);
    fprintf('Valor maximo de informação mutua da música Song01.wav com a música guitarSolo.wav',max1);
    max2 = max(infoMutua2);
    fprintf('Valor maximo de informação mutua da música Song02.wav com a música guitarSolo.wav',max2);
    max3 = max(infoMutua3);
    fprintf('Valor maximo de informação mutua da música Song03.wav com a música guitarSolo.wav',max3);
    max4 = max(infoMutua4);
    fprintf('Valor maximo de informação mutua da música Song04.wav com a música guitarSolo.wav',max4);
    max5 = max(infoMutua5);
    fprintf('Valor maximo de informação mutua da música Song05.wav com a música guitarSolo.wav',max5);
    max6 = max(infoMutua6);
    fprintf('Valor maximo de informação mutua da música Song06.wav com a música guitarSolo.wav',max6);
    max7 = max(infoMutua7);
    fprintf('Valor maximo de informação mutua da música Song07.wav com a música guitarSolo.wav',max7);
    
    
    m1 = mean(infoMutua1);%média
    m2 = mean(infoMutua2);
    m3 = mean(infoMutua3);
    m4 = mean(infoMutua4);
    m5 = mean(infoMutua5);
    m6 = mean(infoMutua6);
    m7 = mean(infoMutua7);
    
    infoFinal = [m1, m2, m3, m4, m5, m6, m7];
    infoFinal2 = sort(infoFinal, 'descend'); 
    plot(infoFinal);
