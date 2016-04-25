clear all;
close all;

%% Fila 1

N = 200;
cantidad = 100;
p = 11;
error_medido = 0;
matriz = 0;
porcentaje = 0;
grafica = 1:2:100;

 for i=1:50  
    error_medido=0;
    porcentaje=porcentaje+0.02;
    for j = 1:cantidad
            matriz = sign(randn(N,p));
            W = (matriz*transpose(matriz))-(p*eye(N));
            M=(rand(N)>porcentaje);
            Wp=M.*W;
            
            %Calculo de S
            S = sign(Wp*matriz);
            for k=1:N*p
                if(S(k)==0)
                    S(k)=1;
                end
            end
            %
            error_medido= (sum(S(:)~=matriz(:)))/(N*p)+error_medido;
            M = zeros(N);
    end
    promedio(i)=(error_medido/cantidad)*100;
   
 end
 
 plot(grafica,promedio)

