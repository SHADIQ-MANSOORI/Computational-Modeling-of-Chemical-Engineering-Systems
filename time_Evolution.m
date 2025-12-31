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
tspan = [0 500];
[t , T] = ode45(@(t,T) func(t,T), tspan, T0);

box on
plot(t,T,'MarkerSize',8,'MarkerEdgeColor','k')
xlabel('time , t(s) --->')
ylabel('Temperature , T(degree C) ---->')

%Time Req for the temp of the body to drop to 50degreeC

t_final = 500;
T_target = 50;
t_fine = 0:1:t_final;
y_fine = interp1(t,T,t_fine);
err = abs(y_fine-50);
arr = cat(1,t_fine,y_fine,err);
min_err = min(arr(3,:));
[row, col] = find(arr == min_err);

fprintf('TIme Required (in s) for the temp tp reach 50 is %f',arr(1,col))
fprintf('\nThis result has uncertainty in temp of %f\n',arr(3,col))



%function delcaration 
function dydx = func(t, T)
    global h rho c A V Tinf;
    dydx = (-h.*A./(rho.*V*c))*(T-Tinf);
end

