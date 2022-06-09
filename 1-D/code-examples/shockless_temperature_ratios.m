%% Sonic Temperature Ratios
% Functions f1, f2, and f3, correspond the the isentropic, adiabatic, and
% reversible heat transfer solutions respectively. The constant g is the
% specific heat ratio.
syms x
g = 1.4; 
f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
f2 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
f3 = x^2*(1+g)^2/(1+g*x^2)^2;
figure(1)
fplot(f1,[1 5],'linewidth',1,'color','#D95319');
hold on 
fplot(f2,[1 5],'linewidth',0.8,'color','red','marker','o'); 
hold on 
fplot(f3,[1 5],'linewidth',1,'color','magenta');
xlabel('Mach Number');
ylabel('T/T*');
title('Sonic Temperature Ratios');
legend('Isentropic','Adiabatic','Reversible Heat Transfer');


