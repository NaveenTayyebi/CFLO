%% Sonic Density Ratios
% Functions f1, f2, and f3, correspond the the isentropic, adiabatic, and
% reversible heat transfer solutions respectively. The constant g is the
% specific heat ratio.
syms x
g = 1.4; 
f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1/(g-1));
f2 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(1/2);
f3 = 1/x^2*(1+g*x^2)/(1+g);
figure(1)
fplot(f1,[1 5],'linewidth',1,'color','#D95319');
hold on 
fplot(f2,[1 5],'linewidth',1,'color','red');
hold on 
fplot(f3,[1 5],'linewidth',1,'color','magenta');
xlabel('Mach Number');
ylabel('\rho/\rho*');
title('Sonic Density Ratios');
legend('Isentropic','Adiabatic','Reversible Heat Transfer');

