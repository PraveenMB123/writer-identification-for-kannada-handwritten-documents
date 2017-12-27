function [TrainFetSet] = CombinedTrain(TrainSet,FN,impathfet1,impathfet2)
%         TrainFetSet = zeros(350,40961);
        Cnt = 1;
        for (nI=1:14)
            for (nJ = 1: 25)
                ImP1 = strcat(impathfet1,FN{1,nI},'\',int2str(TrainSet(nJ)),'.mat');
                load (ImP1);
                Fs = Fs1;
                ImP2 = strcat(impathfet2,FN{1,nI},'\',int2str(TrainSet(nJ)),'.mat');
                load (ImP2);
                Fs = [Fs Fs1];
%                 TrainFetSet(Cnt,1) = nI;
             %TrainFetSet(Cnt,1:size(featureVector)) = featureVector(:);
                TrainFetSet(Cnt,1:length(Fs)) = Fs(:);
                Cnt = Cnt + 1;
            end
        end
return