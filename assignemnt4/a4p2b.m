close all
clear all

A=[ones(8,1) (1:8)'];
b=log([0.19;0.36;0.69;1.3;2.5;4.7;8.5;14;]);
x=A\b;

p=exp(x(1));
r=exp(x(2));