%This is the fuction file to declare all the IVP's related to the cascade
%CSTR problem

function dC = cstr(t,C)
    k = 0.12;
    tau = 5;
    CA0 = 20;
    dC(1,1) = (1/tau)*(CA0-C(1)-(k*C(1)));
    dC(2,1) = (-1/tau)*C(2) + (k*C(1));
    dC(3,1) = (1/tau)*(C(1)-C(3))-(k*C(3));
    dC(4,1) = (1/tau)*(C(2)-C(4)) + (k*C(3));
end