function [TestFetSet] = Test(TestSet,FN,impathfet)
%         TestFetSet = zeros(350,40961);
        Cnt = 1;
        for (nI=1:14)
            for (nJ = 1: 25)
                ImP = strcat(impathfet,FN{1,nI},'\',int2str(TestSet(nJ)),'.mat');
                load (ImP);
%                TrainFetSet(Cnt,1) = nI;
                %TestFetSet(Cnt,1:size(featureVector)) = featureVector(:);
                TestFetSet(Cnt,1:length(FCHA)) = FCHA(:);
                Cnt = Cnt + 1;
            end
        end
return