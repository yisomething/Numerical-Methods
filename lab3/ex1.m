load('EllipsePoints.mat');

% average Y
y1_avg = mean(Y1,2);
y2_avg = mean(Y2,2);
y3_avg = mean(Y3,2);

% center the data and plot
y1_center = Y1 - (y1_avg * ones(1, size(Y1,2)));
y2_center = Y2 - (y2_avg * ones(1, size(Y2,2)));
y3_center = Y3 - (y3_avg * ones(1, size(Y3,2)));

% cmpute the empirical convariance matrix:
C1 = y1_center*y1_center'/size(Y1, 2);
C2 = y2_center*y2_center'/size(Y2, 2);
C3 = y3_center*y3_center'/size(Y3, 2);

% eigen-decompose
[X1,D1] = eig(C1);
D1=2 * sqrt(D1);

[X2,D2] = eig(C2);
D2=2 * sqrt(D2);

[X3,D3] = eig(C3);
D3=2 * sqrt(D3);

% plot Y
hold on
plot(Y1(1,:),Y1(2,:),'.')
plot(Y2(1,:),Y2(2,:),'.')
plot(Y3(1,:),Y3(2,:),'.')
axis equal

% plot transform
plot(D1(1,1)*[0 X1(1,1)]+y1_avg(1),D1(1,1)*[0 X1(2,1)]+y1_avg(2),'r')
plot(D1(2,2)*[0 X1(1,2)]+y1_avg(1),D1(2,2)*[0 X1(2,2)]+y1_avg(2),'g')

plot(D2(1,1)*[0 X2(1,1)]+y2_avg(1),D2(1,1)*[0 X2(2,1)]+y2_avg(2),'r')
plot(D2(2,2)*[0 X2(1,2)]+y2_avg(1),D2(2,2)*[0 X2(2,2)]+y2_avg(2),'g')

plot(D3(1,1)*[0 X3(1,1)]+y3_avg(1),D3(1,1)*[0 X3(2,1)]+y3_avg(2),'r')
plot(D3(2,2)*[0 X3(1,2)]+y3_avg(1),D3(2,2)*[0 X3(2,2)]+y3_avg(2),'g')
hold off
