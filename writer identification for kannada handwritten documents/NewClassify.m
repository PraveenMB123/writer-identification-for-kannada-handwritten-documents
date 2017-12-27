clc;
close all;
clear all;


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


impathfet = 'D:\PRAVEEN\Mtech finalproject\FeaturesW2\';

TrainSet = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49]; 
TestSet = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50];

TrainFetSet = NewTrain(TrainSet,FN,impathfet);
TestFetSet = Test(TestSet,FN,impathfet);

ClassPer = zeros(1,14);
for nI = 1:14
    for nJ = 1:25
        Class = mindistclassify(TestFetSet(nJ),TrainFetSet);
        if (Class == nI)
            ClassPer(nI) = ClassPer(nI) + 1;
        end
    end
end

ClassPerLst = ClassPer / 25; 
Result = sum(ClassPer) / 350  * 100
%sum(Class == Group)/350 * 100
%Result = (Class == Group)