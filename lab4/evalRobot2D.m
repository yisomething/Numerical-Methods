function [pos,J]=evalRobot2D(l,theta)
% f1 pos(1,1) f2 pos(2,1)
pos(1,1) = l(1)*cos(theta(1))+l(2)*cos(theta(1)+theta(2));
pos(2,1) = l(1)*sin(theta(1))+l(2)*sin(theta(1)+theta(2));

% Jocobean: theta(1) x theta(2) y
f1_x = -l(1)*sin(theta(1)) - l(2)*sin(theta(1)+theta(2));
f1_y = -l(2)*sin(theta(1)+theta(2));
f2_x = l(1)*cos(theta(1)) + l(2)*cos(theta(1)+theta(2));
f2_y = l(2)*cos(theta(1)+theta(2));

J = [f1_x,f1_y;f2_x,f2_y];
end