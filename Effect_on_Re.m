%this is the code to analyse the effect of Reynolds No on the headloss

clc
clear
close all

d = 0.127; %dia of pipe in m 
g = 9.81; %acc due to gravity 
L = 375; %length of pipe in m
rho = 1830; %Density of H2SO4 
mu = 26.7e-3; %Viscosity of H2SO4 in Pa.s

Re1 = 500:100:1500; %1st range of Re No.
Re2 = 5000:1000:25000; %2nd range of Re No.
e_by_d = 0.001; %pipe roughness to diameter ratio 
A = (1/4)*pi.*d.^2; %Area of Cross-section

%Analysis of Laminar region 
for i = 1:length(Re1)
    f = laminar(Re1(i));
    u = (Re1(i)*mu)/(rho*d);
    h_f1(i) = f*(L/d)*(u*u)/(2*g);
end

%plotting
figure;
plot(Re1,h_f1,'LineWidth',2)
xlabel('Re')
ylabel('h_f (m)')

%analysis of turbulent region 
for i = 1:length(Re2)
    f = turbulent(Re2(i),e_by_d);
    u = (Re2(i)*mu)/(rho*d);
    h_f2(i) = f*(L/d)*(u*u)/(2*g);
end

%plotting 
figure;
plot(Re2,h_f2,'LineWidth',2)
xlabel('Re')
ylabel('h_f (m)')
