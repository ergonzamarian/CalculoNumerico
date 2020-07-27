

%FALSA POSIÇÃO COM BISSECÇÃO - COMPARAÇÃO E MONTAGEM DE TABELAS

%--------------------------------FALSA POSIÇAO -------------------------------------

clear
clc

zeros = [];
x = [-1:6];
%z = x.^3 - 9*x + 3
%z = sqrt(x) - 5*exp(-x);
%z = x.*log10(x)-1;
z = sin((x-1)./exp(x))-exp((x/3)-3)+0.2;

for  i = 1:length(x)-1,
    if z(i)*z(i+1)<0
        
      intervalo = [x(i) x(i+1)]
      e1 = 0.001;
      a = x(i);
      b = x(i+1);
      
      %f = inline('x^3 - 9*x + 3');
      %f = inline('sqrt(x) - 5*exp(-x)');
      %f = inline('x*log10(x)-1');
      f = inline('sin((x-1)/exp(x))-exp((x/3)-3)+0.2');
      x1 = (a*f(b)-b*f(a))/(f(b)-f(a));
      k=0;
      disp('    k                   a                   b                    x1                 f(x1)                e1                 (b-a)')
      
      while abs(f(x1))>= e1
          k = k+1;
          x1 = (a*f(b)-b*f(a))/(f(b)-f(a));
          
          disp([k a b x1 f(x1) e1 (b-a)])

          if(f(a)*f(x1)<0)
                b = x1;
          else
                a = x1;
          end
       
              
      end
  end
end

%--------------------------------------BISSECÇAO-------------------------------------

clear
clc
x = [-1:6];
%y = x.^3-9*x+3
%y = sqrt(x) - 5*exp(-x);
%y = x.*log10(x)-1;
y = sin((x-1)./exp(x))-exp((x/3)-3)+0.2;
zeros = [];
% se o valor da multilicacao for negativa os zeros da funcao 
% estarao entre os termos multilicados
for i = 1:length(x)-1
    if y(i)*y(i+1)<0
        
        zeros = [zeros;x(i) x(i+1)];
        intervalo = [x(i) x(i+1)]
        
        %f = inline('x.^3-9*x+3');
        %f = inline('sqrt(x) - 5*exp(-x)');
        %f = inline('x*log10(x)-1');
        f = inline('sin((x-1)/exp(x))-exp((x/3)-3)+0.2');
        
        a = x(i);
        b = x(i+1);
        x1 = (a+b)/2;
        e = 0.001;
        k=0;
      disp('    k                   a                   b                    x1                 f(x1)                e1                 (b-a)')
        
        while(abs(f(x1)) >= e)
            x1 = (a+b)/2;
            k=k+1;
            disp([k a b x1 f(x1) (b-a) e])
            
              if f(a)*f(x1)< 0 
                    b = x1;
              else
                    a = x1;
              end 
        end
        
    end
end

%--------------------------------------PONTO FIXO-------------------------------------

clear
clc

k = 0;

x0 = input('INFORME O VALOR DE X0 :');

f_temp = input('INFORME A f(x) : ','s');
f = inline(char(f_temp));

%verificando se a funcao eh valida
sair = 1;
while(sair == 1)
    
    
    phi_temp = input('DIGITE SUA FUNCAO phi : ','s');
    phi = inline(phi_temp);
    phi_linha = inline(char(diff(phi_temp)));
    
    if abs(phi_linha(x0)) < 1
        disp('Sua funcao phi esta show de bola, vamos continuar!');
        sair = 0;
    else
        disp('Infelizmente sua funcao phi nao se adequa aos parametros necessarios =(');
    end
%fim da verificacao
end
x1 = phi(x0);

e1 = input('INFORME O VALOR DO ERRO (e1) : ');

disp('    k         x(0)      phi(x0)   f(x0)     e1  ')
while abs(f(x1))>e1
    disp([k x0 phi(x0) f(x0) e1])
    x0 = x1;
    x1 = phi(x0);
    k = k+1;
  
end


%--------------------------------------newton-------------------------------------

clear
clc

k = 0;

x0 = input('INFORME O VALOR DE X0 : ');

f_temp = input('INFORME A f(x) : ','s');

f = inline(f_temp);

f_linha = inline(char(diff(f_temp)));

x1 = x0 - (f(x0)/f_linha(x0));

e1 = input('INFORME O VALOR DO ERRO (e1) : ');

disp('    k         x1        f(x1)     e1');
while abs(f(x1))> e1
    
     disp([k x1 f(x1) e1])
     
     x0 = x1;
     x1 = x0 - (f(x0)/f_linha(x0));
     k = k+1;
     
    
end