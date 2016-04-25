clc; 
clear all;

p1_img = imread('Imagenes/paloma.bmp');
p2_img = imread('Imagenes/quijote.bmp');
p3_img = imread('Imagenes/torero.bmp');

[x y] = size(p1_img); 

%------ Patrones vectorizados----------
p1 = single(p1_img(:))*2 - 1;
p2 = single(p2_img(:))*2 - 1;
p3 = single(p3_img(:))*2 - 1;
%------ Patrones con ruido-------------
p1_noise = sign(awgn(p1,0));
p2_noise = sign(awgn(p2,0));
p3_noise = sign(awgn(p3,0));
%------- Cargo la imagen a identificar---------
s_in = p1_noise;
s = s_in;

[m n] = size(s);
%------- Apredizaje----------------------------
W = (p1*p1' - eye(m)) + (p2*p2' - eye(m)) + (p3*p3' - eye(m));

actualizar = 1;
s_ant = size([size(s) 1]);

while actualizar
    s_ant = s;
    s = sign(W*s);
    %----- Redefino la funcion sign(0)=1 --------
    s(s==0)=1;
    if (s == s_ant)
            actualizar = 0;                    
    end  
end

%----------Presento la imagen ingresada y la reconocida-------------
img_ingresada = reshape(s_in, [x y]);
img_reconocida = reshape(s,[x y]);
figure(1);
subplot(1,2,1);
imshow(img_ingresada);
title('Imagen Ingresada');
subplot(1,2,2);
imshow(img_reconocida);
title('Imagen Reconocida');