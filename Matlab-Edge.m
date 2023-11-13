% 1.soru
% Aşağıdaki matrisi 
% [MATLAB'a girin ve imfilter kullanarak
%     resme Roberts, Prewitt, Sobel, Laplacian ve 
%     sıfır çapraz kenar bulma yöntemlerini uygulayın. 
%     İki filtre uygulanması gereken durumlarda 
%     (örneğin Roberts, Prewitt veya Sobel gibi), her filtreyi ayrı ayrı uygulayın ve sonuçları birleştirin.
%     ['Gerekirse sınır kenarlarını gösteren yalnızca ikili bir görüntü elde etmek için eşikleme uygulayın.
%     'Hangi yöntemin en iyi sonuçları ürettiğini belirlemek için sonuçları karşılaştırın.]]
% 
% 
%  Roberts_x ve Roberts_y diğerlerine göre köşe algılamada daha iyi bir
%  performans gösterdi.

A=[ 201, 195, 203, 203, 199, 200, 204, 190, 198, 203;
    201, 204, 209, 197, 210, 202, 205, 195, 202, 199;
    205, 198, 46, 60, 53, 37, 50, 51, 194, 205;
    208, 203, 54, 50, 51, 50, 55, 48, 193, 194;
    200, 193, 50, 56, 42, 53, 55, 49, 196, 211;
    200, 198, 203, 49, 51, 60, 51, 205, 207, 198;
    205, 196, 202, 53, 52, 34, 46, 202, 199, 193;
    199, 202, 194, 47, 51, 55, 48, 191, 190, 197;
    194, 206, 198, 212, 195, 196, 204, 204, 199, 200;
    201, 189, 203, 200, 191, 196, 207, 203, 193, 204
    ];

%formüller
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
laplacian = [0 1 0; 1 -4 1; 0 1 0];

B_X = imfilter(A, roberts_x);
B_Y = imfilter(A, roberts_y);
C_X = imfilter(A, prewitt_x);
C_Y = imfilter(A, prewitt_y);
D_X = imfilter(A, sobel_x);
D_Y = imfilter(A, sobel_y);
E_lap = imfilter(A, laplacian);

subplot(3,3,1);
imshow(B_X,[]),title('roberts x ');
subplot(3,3,2);
imshow(B_Y,[]),title('roberts y ');
subplot(3,3,3);
imshow(C_X,[]),title('prewitt x ');
subplot(3,3,4);
imshow(C_Y,[]),title('prewitt y ');
subplot(3,3,5);
imshow(D_X,[]),title('sobel x ');
subplot(3,3,6);
imshow(D_Y,[]),title('sobel y ');
subplot(3,3,7);
imshow(E_lap,[]),title('laplacian ');
subplot(3,3,8);
imshow(A,[]),title('orjinal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2.soru
% Yukarıdaki matrisi kullanarak, edge fonksiyonunu 
% tüm olası parametrelerle kullanın. Hangi yöntemin 
% en iyi sonuçları ürettiğini belirleyin?
% 
% %% en iyi sonuç yorumu
% zerocross canny log canny_old ve log metotları köşe algılayabildi bunlar
% içinde en iyi performans gösteren canny ve canny_old metotları
% 
% A=[ 201, 195, 203, 203, 199, 200, 204, 190, 198, 203;
%     201, 204, 209, 197, 210, 202, 205, 195, 202, 199;
%     205, 198, 46, 60, 53, 37, 50, 51, 194, 205;
%     208, 203, 54, 50, 51, 50, 55, 48, 193, 194;
%     200, 193, 50, 56, 42, 53, 55, 49, 196, 211;
%     200, 198, 203, 49, 51, 60, 51, 205, 207, 198;
%     205, 196, 202, 53, 52, 34, 46, 202, 199, 193;
%     199, 202, 194, 47, 51, 55, 48, 191, 190, 197;
%     194, 206, 198, 212, 195, 196, 204, 204, 199, 200;
%     201, 189, 203, 200, 191, 196, 207, 203, 193, 204
%     ];
% 
% B = edge(A,'Prewitt');
% C = edge(A,'sobel');
% D = edge(A,'roberts');
% E = edge(A,'zerocross');
% F = edge(A,'canny');
% G = edge(A,'log');
% H = edge(A,'canny_old');
% J = edge(A,'approxcanny');
% subplot(3,3,1);
% imshow(B,[]),title('prewitt');
% subplot(3,3,2);
% imshow(C,[]),title('sobel');
% subplot(3,3,3);
% imshow(D,[]),title('roberts');
%  subplot(3,3,4);
% imshow(E,[]),title('zerocross');
%   subplot(3,3,5);
% imshow(F,[]),title('canny');
%   subplot(3,3,6);
% imshow(G,[]),title('log');
%   subplot(3,3,7);
% imshow(H,[]),title('canny_old');
%   subplot(3,3,8);
% imshow(J,[]),title('approxcanny');
% subplot(3,3,9);
% imshow(A,[]),title('orjinal');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3.soru 
% MATLAB'da cameraman.tif adlı görüntüyü açın ve sırayla aşağıdaki kenar bulma tekniklerini uygulayın:
% (a) Roberts
% (b) Prewitt
% (c) Sobel
% (d) Laplacian
% (e) Laplacian'ın sıfır çaprazları
% (f) Marr-Hildreth yöntemi LOG
% Sizin için en iyi sonucu sağladığını düşündüğünüz yöntem hangisidir?


% A = imread('cameraman.tif');
% B = edge(A,'Prewitt');
% C = edge(A,'sobel');
% D = edge(A,'roberts');
% E = edge(A,'zerocross');
% F = edge(A,'log');
% laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
% G = imfilter(A, laplacian_filter);
% threshold = 0.01;
% edge_image = abs(G) > threshold;
% 
% 
% 
% subplot(3,3,1);
% imshow(B,[]),title('prewitt');
% subplot(3,3,2);
% imshow(C,[]),title('sobel');
% subplot(3,3,3);
% imshow(D,[]),title('roberts');
%  subplot(3,3,4);
% imshow(E,[]),title('zerocross');
%   subplot(3,3,5);
% imshow(F,[]),title('Log / Marr-Hildreth');
%    subplot(3,3,6);
% imshow(G,[]),title('laplacian');
% subplot(3,3,7);
% imshow(A,[]),title('orjinal');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Soru 4: 
% Yukarıdaki alıştırmayı tekrarlayın, ancak tire.tif adlı görüntüyü kullanın.
% 
% zerocross  ve Marr-hildreth diğerlerine göre kenar bulma
% konusunda diğer yöntemlere göre daha iyi sonuç verdi.
% 
% 
% A = imread('tire.tif');
% B = edge(A,'Prewitt');
% C = edge(A,'sobel');
% D = edge(A,'roberts');
% E = edge(A,'zerocross');
% F = edge(A,'log');
% laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
% G = imfilter(A, laplacian_filter);
% threshold = 0.01;
% edge_image = abs(G) > threshold;
% 
% 
% 
% subplot(3,3,1);
% imshow(B,[]),title('prewitt');
% subplot(3,3,2);
% imshow(C,[]),title('sobel');
% subplot(3,3,3);
% imshow(D,[]),title('roberts');
%  subplot(3,3,4);
% imshow(E,[]),title('zerocross');
%   subplot(3,3,5);
% imshow(F,[]),title('Log / Marr-Hildreth');
%    subplot(3,3,6);
% imshow(G,[]),title('laplacian');
% subplot(3,3,7);
% imshow(A,[]),title('orjinal');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% soru 5 
% Gri tonlamalı bir çiçek görüntüsü alın: 
% fl = imread('flowers.tif');
% f = im2uint8(rgb2gray(fl)); Şimdi soru 3'ü tekrarlayın.
% 
% 
% zerocross diğer kenar bulma yöntemlerine göre daha başarılı bir sonuç sağladı
% 
% A = imread('yellowlily.jpg');
% O = im2uint8(rgb2gray(A));
% B = edge(O,'Prewitt');
% C = edge(O,'sobel');
% D = edge(O,'roberts');
% E = edge(O,'zerocross');
% laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
% G = imfilter(A, laplacian_filter);
% threshold = 0.01;
% edge_image = abs(G) > threshold;
% 
% 
% 
% subplot(3,3,1);
% imshow(B,[]),title('prewitt');
% subplot(3,3,2);
% imshow(C,[]),title('sobel');
% subplot(3,3,3);
% imshow(D,[]),title('roberts');
%  subplot(3,3,4);
% imshow(E,[]),title('zerocross');
%  subplot(3,3,5);
% imshow(G,[]),title('laplacian');
%   subplot(3,3,6);
% imshow(A,[]),title('orjinal');
% subplot(3,3,7);
% imshow(O,[]),title('rgb2gray');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% soru 6 Gri tonlamalı bir görüntü seçin ve ona gürültü ekleyin; örneğin
% c = imread('cameraman.tif');
% c1 = imnoise(c, 'salt & pepper', 0.1);
% c2 = imnoise(c, 'gaussian', 0, 0.02);
% 
% 
% Şimdi kenar bulma tekniklerini her iki "gürültülü" görüntü c1 ve c2 üzerine uygulayın. Hangi teknik gürültü varlığında en iyi sonuçları veriyor?
% (a) Gürültü varlığında en iyi sonuçları veren teknik hangisidir?
% (b) Gürültü varlığında en kötü sonuçları veren teknik hangisidir?
% 
% 
% A = en iyi sonuç veren papper&salt için ???????
% B = en kötü sonuç veren approxcanny metodu her iki gürültülü efektede
% köşe algılayamadı. Diğer metotlar roberts ve prewitt  gauss gürültü
% efektine göre kötü bir performans gösterdi
% 
% A = imread('pout.tif');
% A1 = imnoise(A,'salt & pepper',0.1);
% A2 = imnoise(A,'gaussian',0,0.02);
% 
% 
% B = edge(A1,'Prewitt');
% C = edge(A1,'sobel');
% D = edge(A1,'roberts');
% E = edge(A1,'zerocross');
% F = edge(A1,'canny');
% G = edge(A1,'log');
% H = edge(A1,'canny_old');
% J = edge(A1,'approxcanny');
% laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
% G = imfilter(A, laplacian_filter);
% threshold = 0.01;
% edge_image = abs(G) > threshold;
% 
% 
% B2 = edge(A2,'Prewitt');
% C2 = edge(A2,'sobel');
% D2 = edge(A2,'roberts');
% E2 = edge(A2,'zerocross');
% F2 = edge(A2,'canny');
% G2 = edge(A2,'log');
% H2 = edge(A2,'canny_old');
% J2 = edge(A2,'approxcanny');
% laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
% G2 = imfilter(A, laplacian_filter);
% threshold = 0.01;
% edge_image = abs(G2) > threshold;
% 
% 
% 
% subplot(5,4,1);
% imshow(B,[]),title('A1 prewitt');
% subplot(5,4,2);
% imshow(C,[]),title('A1 sobel');
% subplot(5,4,3);
% imshow(D,[]),title('A1 roberts');
%  subplot(5,4,4);
% imshow(E,[]),title('A1 zerocross');
%   subplot(5,4,5);
% imshow(F,[]),title('A1 canny');
%   subplot(5,4,6);
% imshow(G,[]),title('A1log');
%   subplot(5,4,7);
% imshow(H,[]),title('A1 canny_old');
%   subplot(5,4,8);
% imshow(J,[]),title('A1 approxcanny');
% subplot(5,4,9);
% imshow(A1,[]),title('A1 orjinal');
% 
% 
% 
% subplot(5,4,10);
% imshow(B2,[]),title('A2 prewitt');
% subplot(5,4,11);
% imshow(C2,[]),title('A2 sobel');
% subplot(5,4,12);
% imshow(D2,[]),title('A2 roberts');
%  subplot(5,4,13);
% imshow(E2,[]),title('A2 zerocross');
%   subplot(5,4,14);
% imshow(F2,[]),title('A2 canny');
%   subplot(5,4,15);
% imshow(G2,[]),title('A2 log');
%   subplot(5,4,16);
% imshow(H2,[]),title('A2 canny_old');
%   subplot(5,4,17);
% imshow(J2,[]),title('A2 approxcanny');
% subplot(5,4,18);
% imshow(A2,[]),title('A2 orjinal');
% subplot(5,4,19);
% imshow(G,[]),title('A1 laplacian');
% subplot(5,4,20);
% imshow(G2,[]),title('A2 laplacian'); 
% 
% 
% 
% 






