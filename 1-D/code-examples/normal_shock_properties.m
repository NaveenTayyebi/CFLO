%% Normal Shock Mach Number & Fluid Property Ratios
% The constant g is the speicifc heat ratio. 
syms x 
g = 1.4; 

% Functions f1_1 and f1_2 make up the piecewise solution to the Mach 
% number downstream of any point in a steady 1-D flow. When the upstream 
% Mach number is less than one, the downstream Mach number is the same--
% solution f_1 applies. However, when the upstream Mach number exceeds 
% one, a shock forms and solution f_2 applies. 
f1_1 = x; 
f1_2 = (1 + (g-1)/2*x^2)^(1/2)/(g*x^2-(g-1)/2)^(1/2); 
figure(1)
fplot(f1_1,[0 1],'linewidth',1,'color','red');
hold on 
fplot(f1_2,[1 10],'linewidth',1,'color','red'); 
ylim([0 1.5]);
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('Downstream Mach Number ( M_{2} )');
title('Mach Number across a Normal Shock');

% Functions f2, f3, f4, and f5 correspond to the Static Temperature,
% Static Density, Static Pressure, and Total Pressure Ratio across a 
% a normal shock. 
f2 = (1 + (2*g)/(g+1)*(x^2-1))*((2 + (g-1)*x^2)/((g+1)*x^2));
f3 = ((g+1)*x^2)/(2 + (g-1)*x^2); 
f4 = 1 + (2*g)/(g+1)*(x^2-1); 
f5 = ((g + 1)*x^2/(2 + (g-1)*x^2))^(g/(g-1))...
    *((g + 1)/(2*g*x^2 - (g-1)))^(1/(g-1));

figure(2)
fplot(f2,[1 10],'linewidth',1,'color','red');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('T_{2} / T_{1}'); 
title('Temperature Ratio');
figure(3)
fplot(f3,[1 10],'linewidth',1,'color','blue');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('\rho_{2} / \rho_{1}'); 
title('Density Ratio');
figure(4)
fplot(f4,[1 10],'linewidth',1,'color','#D95319');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('p_{2} / p_{1}');
title('Pressure Ratio'); 
figure(5)
fplot(f5,[1 10],'linewidth',1,'color','#77AC30');
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('p_{o_{2}} / p_{o_{1}}');
title('Total Pressure Ratio');
 
 