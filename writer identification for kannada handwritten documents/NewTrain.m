function [TrainFetSet] = NewTrain(TrainSet,FN,impathfet)
%         TrainFetSet = zeros(350,40961);
%         Cnt = 1;
        for (nI=1:14)
            Fs = zeros(1,18);
            for (nJ = 1: 25)
                ImP = strcat(impathfet,FN{1,nI},'\',int2str(TrainSet(nJ)),'.mat');
                load (ImP);
                Fs = Fs + Fs1;
%                 TrainFetSet(Cnt,1) = nI;
%                 TrainFetSet(Cnt,1:size(featureVector)) = featureVector(:);
%                 TrainFetSet(Cnt,1:length(Fs1)) = Fs1(:);
%                 Cnt = Cnt + 1;
            end
            Fs = Fs / 25;
            TrainFetSet(nI,1:length(Fs1)) = Fs(:);
        end
return