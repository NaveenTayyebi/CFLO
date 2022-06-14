%% Sonic Total Pressure Ratios
% Functions f1, f2, and f3, correspond the the isentropic, adiabatic, and
% reversible heat transfer solutions respectively. The constant g is the
% specific heat ratio. 
syms x
g = 1.4; 
f1 = 1; 
f2 = 1/x*((2/(g+1))*(1 + (g-1)/2*x^2))^((g+1)/(2*g-2));
f3 = (1 + g)/(1 + g*x^2)*((2/(g+1))*(1 + (g-1)/2*x^2))^(g/(g-1));
fplot(f1,[1 5],'Linewidth',1,'color','#D95319');
hold on 
fplot(f2,[1 5],'Linewidth',1,'color','red');
hold on 
fplot(f3,[1 5],'Linewidth',1,'color','magenta');
xlabel('Mach Number');
ylabel('p_{o} / p_{o}*');
title('Sonic Total Pressure Ratios');
legend('Isentropic','Adiabatic','Reversible Heat Transfer');
