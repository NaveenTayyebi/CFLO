syms x y 
g = 1.4; 
A = y.^(-1/2); 
M1 = A*(g+1)/(2*g) - (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
Tt1 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-1);
Pt1 = M1.*A*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-g/(g-1));
f1 = x + log(Tt1) - (g-1)/g*log(Pt1); 
M2 = A*(g+1)/(2*g) + (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
Tt2 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-1);
Pt2 = M2.*A*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-g/(g-1)); 
f2 = x + log(Tt2) - (g-1)/g*log(Pt2);
figure(1)
fimplicit(f1,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',1700);
hold on 
fimplicit(f2,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',1700);
xlim([-1.5 0.4]);
ylim([0 1.5]);
xlabel("\Delta{s}/c_{p}");
ylabel("T / T*");
title("Rayleigh Line");


