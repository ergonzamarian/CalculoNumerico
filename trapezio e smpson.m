



%1/3 simpson
isimp=(f(1)+4*sum(f(2:2:end-1))+2*sum(f(3:2:end-1))+f(n))

%trapezio
isimp=(f(1)+2*sum(f(2:1:end-1))+f(n))