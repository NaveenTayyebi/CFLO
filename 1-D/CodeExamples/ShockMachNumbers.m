syms x 
g = 1.4; 
f1 = x; 
f2 = (1 + (g-1)/2*x^2)^(1/2)/(g*x^2-(g-1)/2)^(1/2); 
fplot(f1,[0 1],'linewidth',1,'color','red');
hold on 
fplot(f2,[1,10],'linewidth',1,'color','red');
xlim([0 10]);
ylim([0 1.5]);
xlabel('Upstream Mach Number ( M_{1} )');
ylabel('Downstream Mach Number ( M_{2} )');
title('Mach Number across a Normal Shock'); 


 