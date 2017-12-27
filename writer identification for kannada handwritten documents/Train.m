function [TrainFetSet] = Train(TrainSet,FN,impathfet)
%         TrainFetSet = zeros(350,40961);
        Cnt = 1;
        for (nI=1:14)
            for (nJ = 1: 25)
                ImP = strcat(impathfet,FN{1,nI},'\',int2str(TrainSet(nJ)),'.mat');
                load (ImP);
%                 TrainFetSet(Cnt,1) = nI;
            % TrainFetSet(Cnt,1:size(featureVector)) = featureVector(:);
                TrainFetSet(Cnt,1:length(FCHA)) = FCHA(:);
                Cnt = Cnt + 1;
            end
        end
return