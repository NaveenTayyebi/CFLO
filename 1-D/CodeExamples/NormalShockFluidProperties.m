syms x 
g = 1.4; 
f1 = (1 + (2*g)/(g+1)*(x^2-1))*((2 + (g-1)*x^2)/((g+1)*x^2));
f2 = ((g+1)*x^2)/(2 + (g-1)*x^2); 
f3 = 1 + (2*g)/(g+1)*(x^2-1); 
figure(1)
fplot(f1,[1 10],'linewidth',1,'color','red');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('T_{2} / T_{1}'); 
title('Temperature Ratio');
figure(2)
fplot(f2,[1 10],'linewidth',1,'color','blue');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('\rho_{2} / \rho_{1}'); 
title('Density Ratio');
figure(3)
fplot(f3,[1 10],'linewidth',1,'color','#D95319');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('p_{2} / p_{1}');
title('Pressure Ratio'); 


 
 