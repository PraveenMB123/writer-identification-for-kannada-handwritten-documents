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
    
   
    for j = 1:50
        ImP = strcat('D:\PRAVEEN\Mtech finalproject\image sets\',FN{1,i},'\',int2str(j),'.bmp')
        X = (imread(ImP));
        X2 = rgb2gray(X);
        %[CCMat1] = BuildCoOuccurenceMatrix(X2,X2);
  %      [CCMat2] = BuildCoOuccurenceMatrix(X2,255-X2);
% Z1 = HaralicFeatures(CCMat1);
 %Z2 = HaralicFeatures(CCMat2);
 %       Z = [Z1,Z2];
        
%         X3 = imresize(X2,[256,256]);
%         level = graythresh(X3); %global threshold, den convert an intensity image to a binary image
%         X1 = im2bw(X3,level);       
        % 1- level wavelet Decomposition of original image
%         [A1,H1,V1,D1] = dwt2(X1,'haar');
%         [FCH1] = WaveletFeatures(A1,H1,V1,D1);
%         subplot(2,2,1);imshow([A1,H1;V1,D1]);
                
        
        % 1- level wavelet Decomposition of Complementary image
%         [A2,H2,V2,D2] = dwt2(imcomplement(X1),'haar');
%         [FCH2] = WaveletFeatures(A2,H2,V2,D2);
        
%         FCHA1 = [FCH1,FCH2];
        % FCHA = FCHA1/sqrt(sum(FCHA1.*FCHA1));
%         FCHA = FCHA1;
 [a1,h1,v1,d1] = dwt2(X2,'bior2.6');
Fs1(1) = mean(h1(:));
Fs1(2) = std2(h1(:));
Fs1(3) = mean(v1(:));
Fs1(4) = std2(v1(:));
Fs1(5) = mean(d1(:));
Fs1(6) = std2(d1(:));

[a2,h2,v2,d2] = dwt2(a1,'bior2.6');



Fs1(7) = mean(h2(:));
Fs1(8) = std2(h2(:));
Fs1(9) = mean(v2(:));
Fs1(10) = std2(v2(:));
Fs1(11) = mean(d2(:));
Fs1(12) = std2(d2(:));

[a3,h3,v3,d3] = dwt2(a2,'bior2.6');

Fs1(13) = mean(h3(:));
Fs1(14) = std2(h3(:));
Fs1(15) = mean(v3(:));
Fs1(16) = std2(v3(:));
Fs1(17) = mean(d3(:));
Fs1(18) = std2(d3(:));


%figure,imshow(imgg);



        
        %path of the TRAINED FEATURE DATA to be stored
       impathwrite = strcat('D:\PRAVEEN\Mtech finalproject\FeaturesW5\',FN{1,i},'\',int2str(j),'.mat');
        
        %Saving the workspace of variables Horizontal,Vertical & Diagonal
       save(impathwrite, 'Fs1');
    end
end            
%calculating the ellpsed time
t2=etime(clock,t1);
t2



