syms T B 
g = 1.4; 
colorVec = {'#A2142F','#D95319','#D95319','#0072BD'}; 

figure(1)
for k = 2:5
    f1 = @(T,B) tand(T) - 2*cotd(B)*((k^2*(sind(B))^2 - 1)/...
        (k^2*(g + cosd(2*B))+2));
    fimplicit(f1, [0 45 0 90],'linewidth',1,'color',colorVec{:,k-1}); 
    hold on 
end 
hold on 

M = 1:0.01:6; 
sinB2 = ((g-3)*M.^2+(g+1)*M.^4+(16*g*M.^4+...
    ((g-3)*M.^2+(g+1)*M.^4).^(2)).^(1/2))./(4*g*M.^4); 
betaVec = asin((sinB2).^(1/2));
SL = betaVec - asin(((ones(1,501)+(g-1)/2*(M).^2.*(sinB2))...
    ./(g*(M).^2.*(sinB2)-(g-1)/2*ones(1,501))).^(1/2)); 
plot(SL*(180/pi),betaVec*(180/pi),'linewidth',1,'color','black',...
    'LineStyle','-.');
xlim([0 45]);
ylim([0 90]);
text(8.3,72.5,sprintf('Strong Shock \n Solution'));
text(3.8,51.4,sprintf('Weak Shock\nSolution'));
title('Oblique Shock Angles');
legend('M = 2', 'M = 3','M = 4','M = 5','Sonic Line');
xlabel('{\bf \theta}','FontSize',15);
ylabel('{\bf \beta}','FontSize',15); 



