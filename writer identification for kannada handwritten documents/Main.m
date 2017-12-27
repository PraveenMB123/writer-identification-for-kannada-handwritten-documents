clc;
clear all;
close all;

img = imread('D:\PRAVEEN\Mtech finalproject\image sets\K1\3.bmp');
imgg = rgb2gray(img);
[CCMat1] = BuildCoOuccurenceMatrix(imgg,imgg);
[CCMat2] = BuildCoOuccurenceMatrix(imgg,255-imgg);
 Z1 = HaralicFeatures(CCMat1);
 Z2 = HaralicFeatures(CCMat2);