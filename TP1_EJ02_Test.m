clc; 
clear all;

N = 5;
num_neuronas = 600:100:1000;
num_patrones = 600:700;



P_errorTeorico = [0.001, 0.0036, 0.01, 0.05, 0.1];
Perror_teorico_1 = 0.001;
Perror_teorico_2 = 0.0036;
Perror_teorico_3 = 0.01;
Perror_teorico_4 = 0.05;
Perror_teorico_5 = 0.1;

num_patrones_1 = round(min(num_neuronas)*9/100):round(max(num_neuronas)*12/100);
num_patrones_2 = round(min(num_neuronas)*12/100):round(max(num_neuronas)*15/100);
num_patrones_3 = round(min(num_neuronas)*17/100):round(max(num_neuronas)*20/100);
num_patrones_4 = round(min(num_neuronas)*35/100):round(max(num_neuronas)*39/100);
num_patrones_5 = round(min(num_neuronas)*59/100):round(max(num_neuronas)*63/100);

dim_neuronas = size(num_neuronas);
Pmax = zeros(1,dim_neuronas(2));

%-------------- Obtengo el Promedio--------------------
for i= 1:N
Pmax_aux = getPmax(num_neuronas, num_patrones_5, Perror_teorico_5);  
Pmax = Pmax + Pmax_aux;
end
Pmax = Pmax/N;

[a b] = regresion(num_neuronas, Pmax);

%gráfica
t = num_neuronas;
x = Pmax;
plot(t,x,'ro','markersize',8,'markerfacecolor','r')
tmin=min(t);
xmin=a(1)*tmin+b(1);
tmax=max(t);
xmax=a(1)*tmax+b(1);
line([tmin tmax],[xmin xmax]); %recta
xlabel('t')
ylabel('x')
title('Regresión lineal')

