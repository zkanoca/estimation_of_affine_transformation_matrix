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
% Form�l T = R * O - t; �eklindedir. Buna g�re bulunmas� gereken R ve t
% de�erleri i�in a�a��daki i�lem basamaklar� ger�ekle�tirilmelidir:
%  
% 1. Her iki veri k�mesinin orta noktas� bulunur 
% 2. Her iki veri k�mesini orijine getirip optimum d�nme miktar� bulunur
% 3. Translation de�eri bulunur.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

thresholdO = graythresh(Original);
thresholdT = graythresh(Transformed);

sbO = im2bw(Original, thresholdO);
sbT = im2bw(Transformed, thresholdT);
 
