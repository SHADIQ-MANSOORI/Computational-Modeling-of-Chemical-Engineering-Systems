% A matlab code for the solution of initial value problem
clc ; clear ; close all;
global h c A V Tinf;
h = 400;
r = 0.05;
rho_Mat = [8500,6000,4000,2000];
c = 400;
A = 4*pi*(r^2);
V = (4/3)*pi*(r^3);
Tinf = 25;
T0 = 100;
tspan = [0 500];
figure; hold on;
for rho = rho_Mat
    [t , T] = ode45(@(t,T) func(t,T,rho), tspan, T0);
    plot(t,T,'LineWidth',1.5)
end

xlabel('time , t(s) --->')
ylabel('Temperature , T(degree C) ---->')
title('Effec of decreasing density \rho')
legend('ρ = 8500','ρ = 6000','ρ = 4000','ρ = 2000')
grid on ; box on;


%function delcaration 
function dydx = func(t, T, rho)
    global h c A V Tinf;
    dydx = (-h.*A./(rho.*V*c))*(T-Tinf);
end

