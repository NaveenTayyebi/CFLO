%% Fanno & Rayleigh Lines
% Functions f1, f2, and f3, correspond the the isentropic, adiabatic, and
% reversible heat transfer solutions respectively. The constant g is the
% specific heat ratio.
g = 1.4; 
R = 287; 
T = 1:0.1:1000;
count = 1;
colorVec = {'#FF8700','#FF9900','#FFC600','#FFD900','#FFF300','#00FF60',...
                '#00FFAB','#00FFFD','#00A7FF'};
for M = 0.6:0.1:1.2
    dsdT = (M^2-1)/M^2*g./((g-1)*T);
    plot(dsdT,'LineWidth',1,'color',colorVec{count});
    hold on 
    count = count + 1; 
end 
xlim([1 200]); 
ylim([-6.5 1.5]);
xlabel('Temperature (K)');
ylabel('dsdT (J / kg K^2)');
legend('M = 0.6','M = 0.7','M = 0.8','M = 0.9','M = 1',...
        'M = 1.1','M = 1.2');


