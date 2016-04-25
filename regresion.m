function [a b]=regresion(x,y)
    n=length(x);
    a=zeros(2,1);
    b=zeros(2,1);
    
    %pendiente de la recta de regresión, a
    a(1)=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)*sum(x));
    %ordenada en el origen, b
    b(1)=(sum(y)-a(1)*sum(x))/n;
   
    % errores de a y de b
    sd2=sum((y-a(1)*x-b(1)).^2);
    a(2)=sqrt(sd2/(n-2))/sqrt(sum(x.^2)-sum(x)*sum(x)/n);
    b(2)=sqrt(sum(x.^2)/n)*a(2);