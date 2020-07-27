clear;
clc;
syms X;
%x = [1 4 7 10];
%y = [0 1.39 1.95 2.3];
k=1;
Poli = 0;



x = input('Digie o vetor x, ex [1 4 7 10]: ');
clc
opcao=input('Deseja digitar y ou fazer y=1/x ?  (1 para y , 0 para y=1/x ):')
clc
if opcao == 1
    
    y = input('Digie o vetor y, ex [0 1.39 1.95 2.3]:');
    clc
else
    
    for a=1:length(x)
    
        y(a) = 1/(x(a));
        
    end
    
end

L(length(x)+1) = X;

for k = 1:length(x)
    L(k)=1;
    for i = 1:length(x)

        if i~=k
    
            L(k) = L(k)*(X-x(i))/(x(k)-x(i));
    
        end
  
         
    end

     
end
for j = 1:length(x)
    
    %SOMA DE P
    Poli = Poli + (y(j)*L(j));
    
end
P = inline(char(Poli));

disp('------------------------------------------------------');
disp('EQUACAO POLINOMIAL P(X)');
disp('------------------------------------------------------');
P_expandidao = expand(Poli)
P = inline(char(P_expandidao))
disp('------------------------------------------------------');

ezplot(P_expandidao,-5:10);
grid;


clc;
clear;
x = [2 2.5 3 3.5];
for s: 1 length(x)
    
erro(s) = (1/x(s))-P(x(s));

end