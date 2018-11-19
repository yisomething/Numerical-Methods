function [pos,J] = evalRobot3D(M,theta)
pos = get_p(M,theta);  

% get Jacobian, calculated by central diferences
alpha = 0.01;
J(:,1) = (get_p(M,theta+[alpha;0;0;0])-get_p(M,theta-[alpha;0;0;0]))/(2*alpha);
J(:,2) = (get_p(M,theta+[0;alpha;0;0])-get_p(M,theta-[0;alpha;0;0]))/(2*alpha);
J(:,3) = (get_p(M,theta+[0;0;alpha;0])-get_p(M,theta-[0;0;alpha;0]))/(2*alpha);
J(:,4) = (get_p(M,theta+[0;0;0;alpha])-get_p(M,theta-[0;0;0;alpha]))/(2*alpha);
J =J(1:3,1:4);
end

% calculate the position
function pos = get_p(M,theta)
Rx_1 = [1 0 0 0;
    0 cos(theta(1)) -sin(theta(1)) 0;
    0 sin(theta(1)) cos(theta(1)) 0;
    0 0 0 1];

Ry_2 = [cos(theta(2)) 0 sin(theta(2)) 0;
    0 1 0 0;
    -sin(theta(2)) 0 cos(theta(2)) 0;
    0 0 0 1];

Rz_3 = [cos(theta(3)) -sin(theta(3)) 0 0;
    sin(theta(3)) cos(theta(3)) 0 0;
    0 0 1 0;
    0 0 0 1];

Rx_4 = [1 0 0 0;
    0 cos(theta(4)) -sin(theta(4)) 0;
    0 sin(theta(4)) cos(theta(4)) 0;
    0 0 0 1];

pos = M{1}*Rz_3*Ry_2*Rx_1*M{2}*Rx_4*M{3}*[0,0,0,1]';
pos = pos(1:3);
end

    
