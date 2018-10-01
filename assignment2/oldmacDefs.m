% Mass (kg) vs metabolism (w)
data = [
    400 270 % Cow
    70  82  % Human
    45  50  % Sheep
    2   4.8 % Hen
    0.3 1.45 % Rat
    0.16 0.97 % Dove
    ];
f1 =figure;
x = data(:,1);
%x = log(x);
y = data(:,2);
%y = log(y);

X = [ones(length(x),1),x];
b = X\y;
yCalc2 = X*b;
scatter(x,p,150,'red','.');
hold on
plot(x, yCalc2, 'b');
legend('Data', 'Slope', 'Location','southeast');
Rsq1 = 1 - sum((y - yCalc2).^2/sum(y - mean(y)).^2);

fprintf("The R-squared value is %f\n", Rsq1);
fprintf("The linar model is %fx+%f\n", b(2), b(1)); %b(2) is the coefficient of x (y = ax+b)
disp(b);
%f1 = figure;
%plot(m,p)
%f2 = figure;
%loglog(x,y)
f2  = figure;
x = data(:,1);
x = log(x);
y = data(:,2);
y = log(y);

X = [ones(length(x),1),x];
b = X\y;
yCalc2 = X*b;
scatter(x,p,150,'red','.');
hold on
plot(x, yCalc2, 'b');
legend('Data', 'Slope', 'Location','southeast');
Rsq1 = 1 - sum((y - yCalc2).^2/sum(y - mean(y)).^2);

fprintf("The logarithmic R-squared value is %f\n", Rsq1);
fprintf("The  logarithmic linar model is %fx+%f\n", b(2), b(1)); %b(2) is the coefficient of x (y = ax+b)
disp(b);

