%--------------------LISTA 2--------------------------------------

clear
clc
%1
i = input('Digie o numero de linhas: ');

%2
j = input('Digie o numero de linhas: ');

%3
for a = 1:i
    for b = 1:j
         y(a,b) = rand;
     end
end

%4
y = y*100
indice =[];
x = floor(y)
for a = 1:i
    for b = 1:j
        if mod(x(a,b),2) == 0
            disp('PAR');
            disp([x(a,b)])
            indice = [indice x(a,b)];
        end
    end
end
disp('Indice ')
disp([indice])

z = indice*-1
d = sum(indice)