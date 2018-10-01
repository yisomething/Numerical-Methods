

data =[
       1.02 0.39
       0.95 0.32
       0.87 0.27
       0.77 0.22
       0.67 0.18
       0.56 0.15
       0.44 0.13
       0.30 0.12
       0.16 0.13
       0.01 0.15
       ];

x = data(:,1);
y = data(:,2);
A = [y.^2,x.*y,x,y,ones(length(x),1)];
b = [x.^2];

m = A\b;
fit_ellipse(x,y)

%yCalc2 = A*m;
%
scatter(x,y,150,'red','.');
hold on
a=0.8451; % horizontal radius
b=0.5368; % vertical radius
x0=0.3006; % x0,y0 ellipse centre coordinates
y0=0.6553;
t=-pi:0.01:pi;
x=x0+a*cos(t);
y=y0+b*sin(t);
plot(x,y)
%plot(x, yCalc2, 'b');


