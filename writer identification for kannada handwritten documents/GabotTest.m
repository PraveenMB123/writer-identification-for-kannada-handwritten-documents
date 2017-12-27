clc;
close all;
clear all;

img = imread('cameraman.tif');

gaborArray = gaborFilterBank(5,8,39,39);
featureVector = gaborFeatures(img,gaborArray,16,16);

