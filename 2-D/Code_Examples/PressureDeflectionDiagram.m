g = 1.4; 
colorVec = {'#A2142F','#D95319','#D95319','#0072BD'}; 
for M1 = 2:1:5
B = asin(1/M1):0.0001:(pi/2); 
L = length(B); 
p2p1 = 1*ones(1,L) + (2*g)/(g+1)*(M1^2*(sin(B)).^2-1);
theta = atan(2*cot(B).*((M1^2*(sin(B)).^2 - 1*ones(1,L))...
        ./(M1^2*(g*ones(1,L)+cos(2*B))+2*ones(1,L))));
plot(theta*(180/pi),p2p1,'linewidth',1,'color',colorVec{:,M1-1});
hold on 
plot(-theta*(180/pi),p2p1,'linewidth',1,'color',colorVec{:,M1-1});
hold on 
end 
xlim([-45 45]);
title('Single-Shock Pressure Deflection');
legend('M = 2','','M = 3','','M = 4','','M = 5','');
xlabel('\theta','FontSize',15); 
ylabel('p_{2}/p_{1}'); 

