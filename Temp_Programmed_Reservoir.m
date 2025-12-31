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

T0 = 100;
tspan = [0 200];

% for the temperature of body
[t , T] = ode45(@(t,T) func(t,T), tspan, T0);

% for reservoir temp profile
T_res = arrayfun(@(tt) Tres(tt,Tinf), t);

%Plot both
figure; hold on;
plot(t,T,'b-','LineWidth',2)
plot(t,T_res, 'r--','LineWidth',2)
xlabel('Time, t(s)')
ylabel('Temprature (degree C)')
title('Body v/s Reservoir Temp Evolution')
legend('Body Temp','Reservoir Temp','Location','best')
grid on; box on;

%function delcaration 
function dydx = func(t, T)
    global h rho c A V Tinf;
    Trev = Tinf + 0.52*t;
    dydx = (-h.*A./(rho.*V*c))*(T-Trev);
end

function Tr = Tres(t,Tinf)
    if t<=45
        Tr = Tinf; % costant phase
    else 
        Tr = Tinf + 0.52*(t-45); % ramping phase 
    end
end