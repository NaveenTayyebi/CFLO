syms x
g = 1.4; 
f1(x) = (2/(g+1)*(1+(g-1)/2*x^2))^(-g/(g-1));
f2(x) = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(-1/2);
f3(x) = (1+g)/(1+g*x^2);
figure(1)
fplot(f1,[1 5],'linewidth',1,'color','#D95319');
hold on 
fplot(f2,[1 5],'linewidth',1,'color','red');
hold on 
fplot(f3,[1 5],'linewidth',1,'color','magenta');
xlabel('Mach Number');
ylabel('p/p*');
title('Sonic Pressure Ratios');
legend('Isentropic','Adiabatic','Reversible Heat Transfer');


