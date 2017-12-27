close all;
clear all;
clc;
%initializing the clock
t1=clock;

%Name of the Images Used
FN{1,1} = 'K1';
FN{1,2} = 'K2';
FN{1,3} = 'K3';
FN{1,4} = 'K4';
FN{1,5} = 'K5';
FN{1,6} = 'K6';
FN{1,7} = 'K7';
FN{1,8} = 'K8';
FN{1,9} = 'K9';
FN{1,10} = 'K10';
FN{1,11} = 'K11';
FN{1,12} = 'K12';
FN{1,13} = 'K13';
FN{1,14} = 'K14';


for i = 1:14
    ImageName = strcat(FN{1,i},'_');
    %original images
    TypeOfImage = 'o';
    FileNames{1,1} = strcat(ImageName,'00_',TypeOfImage);
    FileNames{1,2} = strcat(ImageName,'01_',TypeOfImage);
    FileNames{1,3} = strcat(ImageName,'02_',TypeOfImage);
    FileNames{1,4} = strcat(ImageName,'03_',TypeOfImage);
    FileNames{1,5} = strcat(ImageName,'04_',TypeOfImage);
    FileNames{1,6} = strcat(ImageName,'05_',TypeOfImage);
    FileNames{1,7} = strcat(ImageName,'06_',TypeOfImage);
    FileNames{1,8} = strcat(ImageName,'07_',TypeOfImage);
    FileNames{1,9} = strcat(ImageName,'08_',TypeOfImage);
    FileNames{1,10} = strcat(ImageName,'09_',TypeOfImage);
    FileNames{1,11} = strcat(ImageName,'10_',TypeOfImage);
    FileNames{1,12} = strcat(ImageName,'11_',TypeOfImage);
    FileNames{1,13} = strcat(ImageName,'12_',TypeOfImage);
    FileNames{1,14} = strcat(ImageName,'13_',TypeOfImage);
    
    for j = 1:14
        X1 = imread(strcat('D:\PRAVEEN\Mtech finalproject\image sets\',FileNames{1,j},'.bmp'));
        
        % 1- level wavelet Decomposition of original image
        [A1,H1,V1,D1] = dwt2(X1,'haar');
        [FCH1] = WaveletFeatures(A1,H1,V1,D1);
        
        % 1- level wavelet Decomposition of Complementary image
        [A2,H2,V2,D2] = dwt2(imcomplement(X1),'haar');
        [FCH2] = WaveletFeatures(A2,H2,V2,D2);
        
        FCHA1 = [FCH1,FCH2];
        % FCHA = FCHA1/sqrt(sum(FCHA1.*FCHA1));
        FCHA = FCHA1;
        
        %path of the TRAINED FEATURE DATA to be stored
        impathwrite = strcat('D:\PRAVEEN\Mtech finalproject\FeaturesHistograms',FileNames{1,j});
        
        % Saving the workspace of variables Horizontal,Vertical & Diagonal
        save(impathwrite, 'FCHA');
    end
end            
%calculating the ellpsed time
t2=etime(clock,t1);
t2
