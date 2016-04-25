clc; 
clear all;

num_neuronas = 5;
num_patrones = 2;
porc_interconex_elim = 10;

P = sign(randn(num_neuronas, num_patrones));

P(P==0)=1; %Redefino la función signo en 0 = 1
[m n] = size(P);
W=zeros(m);
for j=1:n
	W = W + P(:,j)*P(:,j)'-eye(m);
end

% 
% %%
% clc;
% clear all;
% test = ones(5);
% k=randperm(5^2);
% test = test(:);
% test(k(1:round(0.2*5^2)))=0;
% test = reshape(test, [5 5]);

w = W(:);
k=randperm(num_neuronas^2);
w(k(1:round(0.1*num_neuronas^2)))=0;
w_cuadrada = reshape(w, [m m]);


s = sign(w_cuadrada*P);

patron = reshape(P(:,1),size(P(:,1)));
actualizacion = reshape(s(:,1),size(s(:,1)));

figure(1);
imshow(patron);
figure(2);
imshow(actualizacion);

% 
% for i=num_neuronas
%     for v=num_patrones
%         P = sign(randn(num_neuronas(i), num_patrones(v)));
%         P(P==0)=1;
%         [m n] = size(P);
%         W=zeros(m);
%         for j=1:n
%             W = W + P(:,j)*P(:,j)'-eye(m);
%         end
%         S = sign(W*P);
%         Perror = sum(S(:)~=P(:))/(num_neuronas(i)*num_patrones(v));
%         
%         if(Perror>0.001)
%             Pmax(i) = num_patrones(v);
%             break;
%         end
% 
%     end
% end
% 
% plot(num_neuronas,Pmax);
% 
