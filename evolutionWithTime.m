%This code plots the evolution of concnetrations
%of different species in the cascade CSTR system

clc
clear
close all
%          independent variable(min), initial values (we have 4 variables)
[tsol, Csol] = ode45(@cstr,[0 10],[0 0 0 0]); %now our output is from single variable to vector

figure
plot(tsol,Csol(:,1),'-o')
hold on
plot(tsol,Csol(:,2),'-o')
legend('C_A','C_B','Location','northwest')
xlabel('Time (min)')
ylabel('Conc in Reactor 1 (mol/L)')
print('lab05_figure01','-dpng','-r300')

figure
plot(tsol,Csol(:,3),'-*')
hold on
plot(tsol,Csol(:,4),'-*')
legend('C_A','C_B','Location','northwest')
xlabel('Time (min)')
ylabel('Conc in Reactor 2 (mol/L)')
print('lab05_figure02','-dpng','-r300')