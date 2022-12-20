load Original.mat;
load Transformed.mat;
clc;

% subplot(1,2,1), imshow(Original);
% subplot(1,2,2), imshow(Transformed);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T Transformed Resim
% R Rotation
% O Original Resim
% t translation
% Formül T = R * O - t; þeklindedir. Buna göre bulunmasý gereken R ve t
% deðerleri için aþaðýdaki iþlem basamaklarý gerçekleþtirilmelidir:
%  
% 1. Her iki veri kümesinin orta noktasý bulunur 
% 2. Her iki veri kümesini orijine getirip optimum dönme miktarý bulunur
% 3. Translation deðeri bulunur.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

thresholdO = graythresh(Original);
thresholdT = graythresh(Transformed);

sbO = im2bw(Original, thresholdO);
sbT = im2bw(Transformed, thresholdT);
 
