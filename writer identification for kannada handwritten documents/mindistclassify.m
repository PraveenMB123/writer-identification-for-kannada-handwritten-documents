function [Class] = mindistclassify(TestFet,TrainFetSet)
         Dist = zeros(1,14);
         for (nI = 1:14)
             Dist(nI) = sum(abs(TrainFetSet(nI) - TestFet));
         end
         Dist
         Class = find(min(Dist) == Dist);
return