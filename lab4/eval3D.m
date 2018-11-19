
addpath /cshome/vis/data;
robot3D('new');
load human_data;
load walk3;


% initialize
L_theta = [-pi/8;0;0;pi/4];
R_theta = [-pi/8;0;0;pi/4];

% loop each column
for i = 1:size(L,2)
    L_theta = invKin3D(Ml , L_theta, L(:,i));
    R_theta = invKin3D(Mr , R_theta, R(:,i));
    theta = [L_theta; R_theta];
    robot3D(humanInterp(drad, theta));
    pause(0.01)
end