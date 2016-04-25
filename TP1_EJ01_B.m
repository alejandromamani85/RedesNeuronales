%**************************************************************************
%  MATERIA:                                                               *
%  Sistemas Adaptativos: Redes Neuronales                                 *
%                                                                         *
%  UBA-FI                                                                 *
%  Universidad de Buenos Aires                                            *
%  Facultad de Ingeniería                                                 *
%  Año: 2016                                                              *
%                                                                         *
%  Docentes                                                               *
%    Dr. Sergio Lew                                                       *
%                                                                         *
%                                                                         *
%**************************************************************************
%  Autor: Mamani Gutierrez Raul Alejandro                                 *
%  Fecha: 24/03/2016                                                      *
%  Descripcion: TP1 - EJ01_A                                              *
%               Actualización Sincronica de una Red de Hopfield           *
%                                                                         *
%**************************************************************************

clc;
clear all;
close all;
fclose all;

%% Carga de Patrones
p1 = imread('Imagenes/paloma.bmp');
p2 = imread('Imagenes/quijote.bmp');
p3 = imread('Imagenes/torero.bmp');

[x y] = size(p1); %Guardo las dimensiones de las imagenes para volver a armarlas

%% Convierto los patrones en vectores y cambio los 0 (ceros) por (-1)
p1 = single(p1(:))*2 - 1;
p2 = single(p2(:))*2 - 1;
p3 = single(p3(:))*2 - 1;

%% Generacion de Patrones con Ruido

p1_noise = sign(awgn(p1,0));
p2_noise = sign(awgn(p2,0));
p3_noise = sign(awgn(p3,0));

%% Aprendizaje
[n m] = size(p1*p1'); %Dimension "n" de la matriz cuadrada
W = (p1*p1' - eye(n)) + (p2*p2' - eye(n)) + (p3*p3' - eye(n));

%% Ingreso la Imagen a reconocer

s = p2;

img_ingresada = reshape(s,[x y]);
figure(1);
subplot(1,2,1);
imshow(img_ingresada);
title('Imagen Ingresada');

%% Actualizacion Sincronica
actualizar = 1;
while actualizar
    a = randperm(n);
    for i = 1:n     
        s_ant = s;
        s(a(i))= sign(W(a(i),:)*s);
        if(s==s_ant)
            actualizar = 0;             
        end
    end
end 
%% Presento la Imagen reconocida
img_reconocida = reshape(s,[x y]);
subplot(1,2,2)
imshow(img_reconocida); 
title('Imagen Reconocida');
