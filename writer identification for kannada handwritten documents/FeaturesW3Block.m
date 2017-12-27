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
    [a1,h1,v1,d1] = dwt2(X2,'db8');
[m,n] = size(h1);
R1 = imcrop(h1,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(h1,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(h1,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(h1,[uint8(m/2) uint8(n/2) m n]);

Fs1(1) = mean(R1(:));
Fs1(2) = std2(R1(:));
Fs1(3) = mean(R2(:));
Fs1(4) = std2(R2(:));
Fs1(5) = mean(R3(:));
Fs1(6) = std2(R3(:));
Fs1(7) = mean(R4(:));
Fs1(8) = std2(R4(:));

R1 = imcrop(v1,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(v1,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(v1,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(v1,[uint8(m/2) uint8(n/2) m n]);

Fs1(9) = mean(R1(:));
Fs1(10) = std2(R1(:));
Fs1(11) = mean(R2(:));
Fs1(12) = std2(R2(:));
Fs1(13) = mean(R3(:));
Fs1(14) = std2(R3(:));
Fs1(15) = mean(R4(:));
Fs1(16) = std2(R4(:));

R1 = imcrop(d1,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(d1,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(d1,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(d1,[uint8(m/2) uint8(n/2) m n]);

Fs1(17) = mean(R1(:));
Fs1(18) = std2(R1(:));
Fs1(19) = mean(R2(:));
Fs1(20) = std2(R2(:));
Fs1(21) = mean(R3(:));
Fs1(22) = std2(R3(:));
Fs1(23) = mean(R4(:));
Fs1(24) = std2(R4(:));


[a2,h2,v2,d2] = dwt2(a1,'db8');

[m,n] = size(h2);
R1 = imcrop(h2,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(h2,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(h2,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(h2,[uint8(m/2) uint8(n/2) m n]);

Fs1(25) = mean(R1(:));
Fs1(26) = std2(R1(:));
Fs1(27) = mean(R2(:));
Fs1(28) = std2(R2(:));
Fs1(29) = mean(R3(:));
Fs1(30) = std2(R3(:));
Fs1(31) = mean(R4(:));
Fs1(32) = std2(R4(:));

R1 = imcrop(v2,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(v2,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(v2,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(v2,[uint8(m/2) uint8(n/2) m n]);

Fs1(33) = mean(R1(:));
Fs1(34) = std2(R1(:));
Fs1(35) = mean(R2(:));
Fs1(36) = std2(R2(:));
Fs1(37) = mean(R3(:));
Fs1(38) = std2(R3(:));
Fs1(39) = mean(R4(:));
Fs1(40) = std2(R4(:));

R1 = imcrop(d2,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(d2,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(d2,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(d2,[uint8(m/2) uint8(n/2) m n]);

Fs1(41) = mean(R1(:));
Fs1(42) = std2(R1(:));
Fs1(43) = mean(R2(:));
Fs1(44) = std2(R2(:));
Fs1(45) = mean(R3(:));
Fs1(46) = std2(R3(:));
Fs1(47) = mean(R4(:));
Fs1(48) = std2(R4(:));


[a3,h3,v3,d3] = dwt2(a2,'db8');

[m,n] = size(h3);
R1 = imcrop(h3,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(h3,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(h3,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(h3,[uint8(m/2) uint8(n/2) m n]);

Fs1(49) = mean(R1(:));
Fs1(50) = std2(R1(:));
Fs1(51) = mean(R2(:));
Fs1(52) = std2(R2(:));
Fs1(53) = mean(R3(:));
Fs1(54) = std2(R3(:));
Fs1(55) = mean(R4(:));
Fs1(56) = std2(R4(:));

R1 = imcrop(v3,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(v3,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(v3,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(v3,[uint8(m/2) uint8(n/2) m n]);

Fs1(57) = mean(R1(:));
Fs1(58) = std2(R1(:));
Fs1(59) = mean(R2(:));
Fs1(60) = std2(R2(:));
Fs1(61) = mean(R3(:));
Fs1(62) = std2(R3(:));
Fs1(63) = mean(R4(:));
Fs1(64) = std2(R4(:));

R1 = imcrop(d3,[0 0 uint8(m/2) uint8(n/2)]);
R2 = imcrop(d3,[0 uint8(n/2) uint8(m/2) n]);
R3 = imcrop(d3,[uint8(m/2) 0 m uint8(n/2)]);
R4 = imcrop(d3,[uint8(m/2) uint8(n/2) m n]);

Fs1(65) = mean(R1(:));
Fs1(66) = std2(R1(:));
Fs1(67) = mean(R2(:));
Fs1(68) = std2(R2(:));
Fs1(69) = mean(R3(:));
Fs1(70) = std2(R3(:));
Fs1(71) = mean(R4(:));
Fs1(72) = std2(R4(:));


        
        %path of the TRAINED FEATURE DATA to be stored
       impathwrite = strcat('D:\PRAVEEN\Mtech finalproject\FeaturesW3Block\',FN{1,i},'\',int2str(j),'.mat');
        
        %Saving the workspace of variables Horizontal,Vertical & Diagonal
        save(impathwrite, 'Fs1');
    end
end            
%calculating the ellpsed time
t2=etime(clock,t1);
t2