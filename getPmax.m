function [pmax] = getPmax(num_neuronas, num_patrones, perror_teorico)

dim_neuronas = size(num_neuronas);
dim_patrones = size(num_patrones);
%Creo tantos pmax como numero de neuronas que vaya a probar
pmax = zeros(1,dim_neuronas(2));

for i=1:dim_neuronas(2)

    for v=1:dim_patrones(2)

        P = sign(randn(num_neuronas(i), num_patrones(v)));
        P(P==0)=1;
        [m n] = size(P);
        W = P*P' - n*eye(m);
        S = sign(W*P);
        Perror = sum(S(:)~=P(:))/(num_neuronas(i)*num_patrones(v));

        if(Perror>perror_teorico)
            pmax(i) = num_patrones(v);
            break;
        end

    end
end
