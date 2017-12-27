%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function to compute the  5 Co-Occurence Features
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Z = HaralicFeatures(PI)
%m & n represents the order of matrix
[m,n] = size(PI);
PI = double(PI);
R = sum(PI(:));
% p is the normalized gray-tone co-occurence matrix
p = PI/R;
% Rowwise & columnwise mean and variance.
RowSumVect = sum(p);
MuX = 0;
for nI=1:length(RowSumVect)
    MuX = MuX + (nI * RowSumVect(nI));
end
ColSumVect = sum(p');
MuY = 0;
for nI=1:length(ColSumVect)
    MuY = MuY + (nI * ColSumVect(nI));
end
SigX = 0;
for nI=1:length(RowSumVect)
    SigX = SigX + (((nI-MuX)^2) * RowSumVect(nI));
end
SigY = 0;
for nI=1:length(ColSumVect)
    SigY = SigY + (((nI-MuY)^2) * ColSumVect(nI));
end

contrast = 0;%contrast (1 - FEATURE)
homogeneity = 0;% energy (2 - FEATURE)
entropy = 0;%Entropy (3 - FEATURE)
Corr = 0;% Correlation.(4 - FEATURE)
LocalHom= 0;% Local Homogeneity (5 - FEATURE)

for i = 1:m
    for j = 1:n
        homogeneity = homogeneity + (p(i,j)^2);
        contrast = contrast + ((i-j)^2) * p(i,j);
        Corr = Corr + ((i*j)*p(i,j));
        temp = p(i,j);
        temp1 = temp;
        if ( temp1 == 0)
            temp1 = 1;
        end
        entropy = entropy + temp * log(temp1);
        LocalHom = LocalHom + (1/(1+ ((i-j)^2)))* p(i,j);
    end
end
entropy = -entropy;
Corr = (Corr - (MuX*MuY)) / (SigX*SigY);

% Creating a vector containing  5 features
Z = [homogeneity,contrast, Corr,entropy, LocalHom];
return
