fun = @(x) sin(10*x)-x;
x = linspace(-1,1,8);
y = fun(x);
Sy = sign(y);
Sy = Sy(1:end-1).*Sy(2:end);
bracketind = find(Sy <= 0);
disp(x);