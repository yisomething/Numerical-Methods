
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
R = -0.005+(0.005-(-0.005))*rand(10,1);
x = data(:,1)+ R;
R1 = -0.005+(0.005-(-0.005))*rand(10,1);
y = data(:,2)+R1;
A = [y.^2,x.*y,x,y,ones(length(x),1)];
b = [x.^2];

m = A\b;
fit_ellipse(x,y)

%yCalc2 = A*m;
%
scatter(x,y,150,'red','.');
hold on
a=4.3019; % horizontal radius
b=17.6595; % vertical radius
x0=0.6972; % x0,y0 ellipse centre coordinates
y0=17.6055;
t=-pi:0.01:pi;
x=x0+a*cos(t);
y=y0+b*sin(t);
plot(x,y)

