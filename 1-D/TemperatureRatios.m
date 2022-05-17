syms x
g = 1.4; 
f1(x) = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
f2(x) = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
f3(x) = x^2*(1+g)^2/(1+g*x^2)^2;
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


