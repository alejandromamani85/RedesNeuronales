clc; 
clear all;

p1 = imread('Imagenes/paloma.bmp');
p2 = imread('Imagenes/quijote.bmp');
p3 = imread('Imagenes/torero.bmp');

[x y] = size(p1);
figure(1);
imshow(p1);
p1 = single(p1(:))*2 - 1;
p2 = single(p2(:))*2 - 1;
p3 = single(p3(:))*2 - 1;

n = size(p1*p1');
W = (p1*p1' - eye(n)) + (p2*p2' - eye(n)) + (p3*p3' - eye(n));

img = p2

%aux = sign(W*img);
aux_noise = sign(awgn(img,0,1));
aux_noise = single(aux_noise(:))*2-1;
aux = sign(W*aux_noise);


img_noise = reshape(aux_noise,[x y]);
figure(2);
imshow(img_noise);
s1 = aux;
%s1 = (aux + 1)/2; %lo paso a "1" y "0"

img_reconocida = reshape(s1,[x y]);
figure(3);
imshow(img_reconocida);
fin =p2 - s1