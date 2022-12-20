load Original.mat;
load Transformed.mat;


levelO = graythresh(Original);
bwO = im2bw(Original,level);
Original2 = 1 - bwO;
Original2 = bwareaopen(Original2, 200);
% Original3 = imfill(Original2, 'holes');
sO  = regionprops(Original3, 'centroid');
centroidsO = cat(1, sO.Centroid);


levelT = graythresh(Transformed);
bwT = im2bw(Transformed,level);
Transformed2 = 1 - bwT;
Transformed2 = bwareaopen(Transformed2, 200);
% Transformed3 = imfill(Transformed2, 'holes');
sT  = regionprops(Transformed3, 'centroid');
centroidsT = cat(1, sT.Centroid);



figure(1);
imshow(Original3);
hold on;
plot(centroidsO(:,1), centroidsO(:,2), 'r*')
hold off;
impixelinfo

figure(2);
imshow(Transformed3);
hold on;
plot(centroidsT(:,1), centroidsT(:,2), 'm*')
hold off
impixelinfo