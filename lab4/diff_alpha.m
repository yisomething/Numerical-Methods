% scipt for Evaluate several different values for alpha 
% by comparing the finite difference Jacobian 
% to the analytic Jacobian for a variety of values for theta.
l = [0.5;0.5];
theta = [pi/4;pi/4];
alpha = (0.01:0.02:0.1);

for i = 1 : length(alpha)
    [pos,a_J] = evalRobot2D(l,theta);
    f_J = fdJacob2D(l,theta,alpha(i));
    diff(i) = norm(a_J - f_J);
end
max_diff = max(diff);
disp(max_diff);