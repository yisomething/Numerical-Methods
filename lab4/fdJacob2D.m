function J = fdJacob2D(l,theta,alpha)

% central differences = f(x+h)-f(x-h))/(2h)
% the first parameter of the Jacobian
J(:,1) = (evalRobot2D(l,theta+[alpha;0])-evalRobot2D(l,theta-[alpha;0]))/(2*alpha);
% the second parameter of the Jacobian
J(:,2) = (evalRobot2D(l,theta+[0;alpha])-evalRobot2D(l,theta-[0;alpha]))/(2*alpha);

end