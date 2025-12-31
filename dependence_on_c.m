% A matlab code for the solution of initial value problem
clc ; clear ; close all;
global h A V Tinf rho;
h = 400;
r = 0.05;
rho = 8500;
c_val = [400, 300, 200, 100];
A = 4*pi*(r^2);
V = (4/3)*pi*(r^3);
Tinf = 25;
T0 = 100;
tspan = [0 500];
figure; hold on;
for c = c_val
    [t , T] = ode45(@(t,T) func(t,T,c), tspan, T0);
    plot(t,T,'LineWidth',1.5)
end

xlabel('time , t(s) --->')
ylabel('Temperature , T(degree C) ---->')
title('Effec of decreasing heat capacity C')
legend('c = 400','c = 300','c = 200','c = 100')
grid on ; box on;


%function delcaration 
function dydx = func(t, T, c)
    global h rho A V Tinf;
    dydx = (-h.*A./(rho.*V*c))*(T-Tinf);
end

