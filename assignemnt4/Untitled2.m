x0 = [1 2 3 4 5 6 7 8];
y0= [.19 .36 .69 1.3 2.5 4.7 8.5 14];
fun = @(x,x0)x(1)*exp(x(2)*x0);
initial = [100,-1];
x = lsqcurvefit(fun,initial,x0,y0);


times = linspace(x0(1),x0(end));
plot(x0,y0,'ko',times,fun(x,times),'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')