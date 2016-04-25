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

[x y] = size(p1_img); %Guardo las dimensiones de las imagenes para volver a armarlas

%------ Patrones vectorizados----------
%------ Convierto los patrones en vectores y cambio los 0 (ceros) por (-1)
p1 = single(p1_img(:))*2 - 1;
p2 = single(p2_img(:))*2 - 1;
p3 = single(p3_img(:))*2 - 1;
%------ Patrones con ruido-------------
%------ El segundo termino de la funcion awgn es el valor SNR
p1_noise = sign(awgn(p1,0));
p2_noise = sign(awgn(p2,0));
p3_noise = sign(awgn(p3,0));

%% Ingreso la Imagen a reconocer


figure(1);
subplot(1,2,1);
imshow(img_ingresada);
title('Imagen Ingresada');
