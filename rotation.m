%% �zkan �ZL�
% Kocaeli �niversitesi 
% Fen Bilimleri Enstit�s� 
% Bilgisayar M�hendisli�i Anabilim Dal�
% Robot G�r�s� Dersi
% Birinci �dev

%% Tan�t�m
% Bu script ile verilen bir resmin d�nd�rme a��s� ve originden kayd�rma miktar� hesaplanmaktad�r.
% 

load Original.mat;
load Transformed.mat;

% transformasyonMatrisi = [  cos(a) sin(a) tx ; ...
%                          -sin(a) cos(a)  ty ; ...
%                               0      0   1];

% Original resme ait sat�r say�s�n� bul
noktaSay = size(Original,1);

% Resimlerdeki integer de�erleri double tipine d�n��t�r
org = double(Original);

trf = double(Transformed);

% Original g�r�nt�den 100. s�tundaki t�m pikselleri al
org_nok_X = org(:,100);

% Original g�r�nt�den 200. s�tundaki t�m pikselleri al
org_nok_Y = org(:,200);

% Transformed g�r�nt�den 100. s�tundaki t�m pikselleri al
trf_nok_X = trf(:,100);

% Transformed g�r�nt�den 200. s�tundaki t�m pikselleri al
trf_nok_Y = trf(:,200);


% Yard�mc� vekt�rler olu�tur
vektor0 = zeros(noktaSay,1);
vektor1 = ones(noktaSay,1);

% A vekt�r� i�in de�erleri hesapla
xOrgxTrf = -org_nok_X .* trf_nok_X;

yOrgxTrf = -org_nok_Y .* trf_nok_X;


xOrgyTrf = -org_nok_X .* trf_nok_Y;

yOrgyTrf = -org_nok_Y .* trf_nok_Y;

% A vekt�r�n� olu�tur
A = [org_nok_X org_nok_Y vektor1 vektor0   vektor0   vektor0 xOrgxTrf yOrgxTrf; ...
     vektor0   vektor0   vektor0 org_nok_X org_nok_Y vektor1 xOrgyTrf yOrgyTrf];

% B vekt�r�n� olu�tur
B = [trf_nok_X; trf_nok_Y];

% H vekt�r�n� bul
H = A \ B;

% H vekt�r�n� 3 x 3 transformation matrisine d�n��t�r.
H = vec2mat(H,3);

%Ekran i�lemleri
clc;
H

fprintf('* D�nd�rme a��s�: %s\n', num2str(acos(H(1,1))*180/pi));

fprintf('* Sa�a kayd�rma miktar�: %s piksel \n* Yukar�ya kayd�rma miktar�: %s piksel\n', num2str(round(H(1,3))),num2str(round(H(2,3))));

