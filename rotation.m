%% Özkan ÖZLÜ
% Kocaeli Üniversitesi 
% Fen Bilimleri Enstitüsü 
% Bilgisayar Mühendisliði Anabilim Dalý
% Robot Görüsü Dersi
% Birinci Ödev

%% Tanýtým
% Bu script ile verilen bir resmin döndürme açýsý ve originden kaydýrma miktarý hesaplanmaktadýr.
% 

load Original.mat;
load Transformed.mat;

% transformasyonMatrisi = [  cos(a) sin(a) tx ; ...
%                          -sin(a) cos(a)  ty ; ...
%                               0      0   1];

% Original resme ait satýr sayýsýný bul
noktaSay = size(Original,1);

% Resimlerdeki integer deðerleri double tipine dönüþtür
org = double(Original);

trf = double(Transformed);

% Original görüntüden 100. sütundaki tüm pikselleri al
org_nok_X = org(:,100);

% Original görüntüden 200. sütundaki tüm pikselleri al
org_nok_Y = org(:,200);

% Transformed görüntüden 100. sütundaki tüm pikselleri al
trf_nok_X = trf(:,100);

% Transformed görüntüden 200. sütundaki tüm pikselleri al
trf_nok_Y = trf(:,200);


% Yardýmcý vektörler oluþtur
vektor0 = zeros(noktaSay,1);
vektor1 = ones(noktaSay,1);

% A vektörü için deðerleri hesapla
xOrgxTrf = -org_nok_X .* trf_nok_X;

yOrgxTrf = -org_nok_Y .* trf_nok_X;


xOrgyTrf = -org_nok_X .* trf_nok_Y;

yOrgyTrf = -org_nok_Y .* trf_nok_Y;

% A vektörünü oluþtur
A = [org_nok_X org_nok_Y vektor1 vektor0   vektor0   vektor0 xOrgxTrf yOrgxTrf; ...
     vektor0   vektor0   vektor0 org_nok_X org_nok_Y vektor1 xOrgyTrf yOrgyTrf];

% B vektörünü oluþtur
B = [trf_nok_X; trf_nok_Y];

% H vektörünü bul
H = A \ B;

% H vektörünü 3 x 3 transformation matrisine dönüþtür.
H = vec2mat(H,3);

%Ekran iþlemleri
clc;
H

fprintf('* Döndürme açýsý: %s\n', num2str(acos(H(1,1))*180/pi));

fprintf('* Saða kaydýrma miktarý: %s piksel \n* Yukarýya kaydýrma miktarý: %s piksel\n', num2str(round(H(1,3))),num2str(round(H(2,3))));

