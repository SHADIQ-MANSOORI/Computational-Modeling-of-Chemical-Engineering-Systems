%This is the code to generate the turbulent region of the Moody chart 

clc
clear
close all

%array of e/d values
e_by_d = [0, 0.0002:0.0001:0.0008, 0.001:0.001:0.008, 0.01:0.01:0.05];

%Array of Re No.
Re = [5000:1000:10000, 2e4:1e4:1e5, 1e5:1e5:1e6];

phiz = zeros(length(e_by_d),length(Re)); %initialize phi

for i = 1:length(e_by_d)
    for j = 1:length(Re)
        f = turbulent(Re(j),e_by_d(i));
        phiz(i,j) = f/8; % updation of (i,j) cell of matrix phiz
    end
end

%plotting 
loglog(Re,phiz(1:end,:)) %log log plot
axis auto
ylabel('\phi') %y axis have phi values
xlabel('Re') %x axixs has Re no.

%addming text feature to the plot to understand range of e_by_d

xt = [1.2e5 1.2e5]; %x coordinate of text 
yt = [0.00165 0.009]; %y coordinate of text
str = {"Smooth pipes",'e/d = 0.05'}; % cell array for text to be added 
text(xt, yt,str,'FontSize',12)

