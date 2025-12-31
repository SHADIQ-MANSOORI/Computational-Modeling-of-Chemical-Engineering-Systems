clc
clear 
close all

global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tj Tf

%Parameter Set1 
%F_by_V = 1; k0 = 14825*3600; H_rxn = 5215; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 250; Tj = 25+273; R = 1.98; Tf=25+273;

%Parameter Set2
F_by_V = 1; k0 = 9703*3600; H_rxn = 5960; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 150; Tj = 25+273; R = 1.98; Tf=25+273;

%Parameter Set3
%F_by_V = 1; k0 = 18194*3600; H_rxn = 8195; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 750; Tj = 25+273; R = 1.98; Tf=25+273;

F_by_V_vec = linspace(0,1,20); %array of F_by_V
T_reactor = linspace(280,400,20);

for i = 1:length(F_by_V_vec)
    F_by_V = F_by_V_vec(i);
    Tjss(i,:) = cstr_curve3(T_reactor);
end

figure;

for i = 1:length(F_by_V_vec)
    plot3(Tjss(i,:),ones(1,20).*F_by_V_vec(i),T_reactor)
    hold on
end
xlabel('T_j (k)')
ylabel('F/V (h^{-1})')
zlabel('T (k)')

function Tjss = cstr_curve3(T_vec)
    global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tf
    for i = 1:length(T_vec)
        T = T_vec(i);
        k = k0.*exp(-E./(R.*T));
        Ca = F_by_V*Caf/(F_by_V+k);
        rate = k*Ca;
        term1 = F_by_V*(Tf-T);
        term2 = rate*H_rxn/rhoCp;
        Tjss(i) = T - ((term1+term2)/(UA_by_V/rhoCp));
    end
end
