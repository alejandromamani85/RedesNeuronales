clc; 
clear all;

% num_neuronas = 1000;
num_neuronas = 1000;
num_patrones = 100;
%num_patrones = 100:150;
% P_error = 0;
% P_errorTeorico = [0.001, 0.0036, 0.01, 0.05, 0.1]
% Pmax = 1:1000;

Pmax = zeros(1,5);
% for i=0:50
for i=1:5
    num_neuronas = num_neuronas + i;
    for v=1:5        
        num_patrones = num_patrones + v;
        P = sign(randn(num_neuronas, num_patrones));
        P(P==0)=1;
        [m n] = size(P);
        W=zeros(m);
        for j=1:n
            W = W + P(:,j)*P(:,j)'-eye(m);
        end
        W_fast = P*P' - n*eye(m);

        S = sign(W*P);
        Perror = sum(S(:)~=P(:))/(num_neuronas*num_patrones);

        if(Perror>0.001)
%             P_error = Perror;        
%             Pmax(i) = Perror;
            Pmax(i) = num_patrones;
            break;
        end

    end
end
m = 1001:1005;
plot(m,Pmax)

