syms B T
g = 1.4; 
M1_2 = 2; 
M1_3 = 3; 
M1_4 = 4; 
M1_5 = 5; 
i = 1; 
colorVec = {'cyan', 'blue', 'red', 'magenta'}; 
f1_2 = @(T,B) tan(T) - 2*cot(B)*((M1_2^2*(sin(B))^2 - 1)./...
        (M1_2^2*(g + cos(2*B))+2));
f1_3 = @(T,B) tan(T) - 2*cot(B)*((M1_3^2*(sin(B))^2 - 1)./...
        (M1_3^2*(g + cos(2*B))+2));
f1_4 = @(T,B) tan(T) - 2*cot(B)*((M1_4^2*(sin(B))^2 - 1)./...
        (M1_4^2*(g + cos(2*B))+2));
f1_5 = @(T,B) tan(T) - 2*cot(B)*((M1_5^2*(sin(B))^2 - 1)./...
        (M1_5^2*(g + cos(2*B))+2));
for k = 0.625:0.125:1
    f2 = @(T,B) k*(sin(B-T))^2 - (1 + (g-1)/2*M1_4^2*(sin(B))^2)./...
        (g*M1_4^2*(sin(B))^2-(g-1)/2);
    fsolve(@(X)[f1_4(X(1),X(2)); f2(X(1),X(2))],[deg2rad(25) deg2rad(45)]) 
end 
% Transition Points for M2 
m2SolnX = [0.3803 0.3976 0.4009 0.3963];
m2SolnY = [1.2373 1.1740 1.1203 1.0731];
m3SolnX = [0.5749 0.5896 0.5945 0.5936];
m3SolnY = [1.2366 1.1900 1.1493 1.1129];
m4SolnX = [0.6566 0.6707 0.6761 0.6764];
m4SolnY = [1.2483 1.2072 1.1712 1.1389];
m5SolnX = [0.6974 0.7111 0.7167 0.7175];
m5SolnY = [1.256 1.2175 1.1837 1.1534];
figure(1)
fimplicit(f1_2, [0 pi/4 0 pi/2],'linewidth',1,'color','#A2142F'); 
hold on 
fimplicit(f1_3, [0 pi/4 0 pi/2],'linewidth',1,'color','#D95319'); 
hold on 
fimplicit(f1_4, [0 pi/4 0 pi/2],'linewidth',1,'color','#EDB120'); 
hold on 
fimplicit(f1_5, [0 pi/4 0 pi/2],'linewidth',1,'color','#0072BD'); 
hold on 
plot(m2SolnX,m2SolnY,'LineStyle','none','marker','o','MarkerFaceColor',...
    'black','MarkerEdgeColor','black');
plot(m3SolnX,m3SolnY,'LineStyle','none','marker','o','MarkerFaceColor',...
    'black','MarkerEdgeColor','black');
plot(m4SolnX,m4SolnY,'LineStyle','none','marker','o','MarkerFaceColor',...
    'black','MarkerEdgeColor','black');
plot(m5SolnX,m5SolnY,'LineStyle','none','marker','o','MarkerFaceColor',...
    'black','MarkerEdgeColor','black');
labels = {'0.625','0.75','0.875','1.00'};
labelpoints(m2SolnX,m2SolnY,labels,'W',0.2,'FontSize',8);
labelpoints(m3SolnX,m3SolnY,labels,'W',0.2,'FontSize',8);
labelpoints(m4SolnX,m4SolnY,labels,'W',0.2,'FontSize',8);
labelpoints(m5SolnX,m5SolnY,labels,'E',0.2,'FontSize',7);
hold on
legend('M = 2', 'M = 3','M = 4','M = 5');
title('Oblique Shock Angles');
xlabel('{\bf \theta}','FontSize',15);
ylabel('{\bf \beta}','FontSize',15);
hold on 
% Check our implicit solutions
%for k = 0.625:0.125:1
%    f2 = @(T,B) k*(sin(B-T))^2 - (1 + (g-1)/2*M1_5^2*(sin(B))^2)./...
%        (g*M1_5^2*(sin(B))^2-(g-1)/2);
%    fimplicit(f2, [0 pi/4 0 pi/2],'linewidth',1,'color',colorVec{:,i});
%    hold on
%    i = i + 1; 
%end 

% Label with degrees instead of radians
xticklabels({round(rad2deg(0.1)), round(rad2deg(0.2)),round(rad2deg(0.3))...
    ,round(rad2deg(0.4)),round(rad2deg(0.5)),round(rad2deg(0.6)),...
    round(rad2deg(0.7)),round(rad2deg(0.8))}); 
yticklabels({round(rad2deg(0)), round(rad2deg(0.5)),round(rad2deg(1))...
   ,round(rad2deg(1.5))}); 



