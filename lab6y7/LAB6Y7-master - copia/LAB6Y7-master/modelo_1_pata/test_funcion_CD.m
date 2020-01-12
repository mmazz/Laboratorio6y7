clear all;
clc;


theta1 = 0*pi/180; theta2 = 10*pi/180;    theta3 = 10*pi/180;
theta1_off = 0; theta2_off = -0.22; theta3_off = -0.81;
a1 = 52; a2 = 66; a3 = 138;


alpha1 = pi/2; alpha2 = 0; alpha3 = 0;

d1 = 0; d2 =0; d3=0;

% syms theta1 theta2 theta3 theta1_off theta2_off theta3_off a1 a2 a3 d1 d2 d3 alpha1 alpha2 alpha3;
p1.theta = theta1; p2.theta = theta2; p3.theta = theta3;
p1.theta_off = theta1_off; p2.theta_off = theta2_off; p3.theta_off = theta3_off;
p1.a= a1; p2.a = a2; p3.a = a3;

p1.alpha = alpha1; p2.alpha = alpha2; p3.alpha = alpha3;

p1.d = d1; p2.d = d2; p3.d = d3;

pata = 6;

forward_kinematics(p1,p2,p3,pata)