%This is the fuction file for the calculation of f and phi for turb flow
%The func req two i/p : Re and e/d ratio 
%One output is o/b : f 

function [f] = turbulent(Re,e_by_d)
    %function handle to calcualte f 
    if Re<4000
        error("Not in Turbulent Region");
    end
    func = @(f) 1/(f^0.5) + 2*log10((e_by_d/3.7)+(2.51/(Re*(f^0.5))))

%use fo fsolve with initial guess 0.150 to solve for f 
    f = fsolve(func, 0.150)
end

