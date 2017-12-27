
function [CCMat] = BuildCoOuccurenceMatrix(ImgQnt1, ImgQnt2)

% Pad the image and the region matrix.
ImgQnt1 = padarray(ImgQnt1,[1 1],'replicate','both');
ImgQnt2 = padarray(ImgQnt2,[1 1],'replicate','both');
% Size of Image.
[nR,nC] = size(ImgQnt1);

CCMat = zeros(256,256);

% Process image and Build the co-occurence. Since padding is done computation is done on inner rect. 
for nI=2:nR-1
    for nJ=2:nC-1
        
        % First consider angle 0.
        Row = ImgQnt1(nI,nJ) + 1;
        Col = ImgQnt2(nI,nJ+1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 45.
        Col = ImgQnt2(nI-1,nJ+1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 90.      
        Col = ImgQnt2(nI-1,nJ) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 135.
        Col = ImgQnt2(nI-1,nJ-1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 180.
        Col = ImgQnt2(nI,nJ-1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 225.
        Col = ImgQnt2(nI+1,nJ-1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 270.
        Col = ImgQnt2(nI+1,nJ) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
        % Next consider angle 315.
        Col = ImgQnt2(nI+1,nJ+1) + 1;
        CCMat(Row,Col) = CCMat(Row,Col) + 1;
    end
end
return