% A matlab code for the solution of initial value problem
clc ; clear ; close all;
global h rho c A V Tinf;
h = 400;
r = 0.05;
rho = 8500;
c = 400;
A = 4*pi*(r^2);
V = (4/3)*pi*(r^3);
Tinf = 25;
T0_Mat = 25:2:100;
tspan = [0 500];
figure; hold on;
for T0 = T0_Mat
    [t , T] = ode45(@(t,T) func(t,T), tspan, T0);
    plot(t,T,'MarkerSize',8)    
end
xlabel('time , t(s) --->')
ylabel('Temperature , T(degree C) ---->')
grid on ; box on;
hold off;


%function delcaration 
function dydx = func(t, T)
    global h rho c A V Tinf;
    dydx = (-h.*A./(rho.*V*c))*(T-Tinf);
end

