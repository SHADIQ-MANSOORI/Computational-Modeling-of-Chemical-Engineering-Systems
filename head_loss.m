%this code calcualte the head loss due to pipe friction 
clc
clear 
close all

G = 1.5;             %Mass flow rat in kg/s
g = 9.81;            %acc due to gravity in m/s2
d = 0.127;           %dia of pipe in m 
e_by_d = 0.05;       %roughness factor
L = 375;             %Length of pipe
rho = 1830;          %Density of H2SO4 in kg/m3
A =  (1/4)*pi.*d.^2; % Area in m2
u = G/(A*rho);       %Velocity in m/s
mu = 26.7e-3;        %Viscosity of H2SO4 in Pa.s
Re = d*u*rho/mu;     % Reynolds No.

if 0 < Re < 2200
    f = laminar(Re);

elseif Re>2200
    f = turbulent(Re,e_by_d);
end

h_f = f*(L/d)*(u*u)/(2*g) %head loss exp

